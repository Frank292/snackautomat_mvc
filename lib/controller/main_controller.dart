import 'package:snackautomat/controller/_guidata_controller.dart';
import 'package:snackautomat/controller/_register_controller.dart';
import 'package:snackautomat/controller/_user_controller.dart';
import 'package:snackautomat/gui/_guidata.dart';
import 'package:snackautomat/models/_register.dart';
import 'package:snackautomat/models/_user.dart';
import 'package:snackautomat/objects/product.dart';

/// Controller between GUI and Register
class MainController
    implements IRegisterController, IGuiDataController, IUserController {
  ///Constructor
  MainController()
      : _register = IRegister(),
        _user = IUser(),
        _guidata = IGuiData();
  IUser _user;
  IRegister _register;
  IGuiData _guidata;

  @override
  List<Product> get inventory => _user.pocket;
  List<int> get wallet => _user.wallet;
  int get totalMoney => _sum(_user.wallet);

  @override
  int get displayDebit => _register.debit;
  @override
  int get displayPrice => _register.selectedProduct.price;
  @override
  bool get isAdminMode => _register.adminMode;
  @override
  String get message1 => _register.message1;
  @override
  String get message2 => _register.message2;
  @override
  Product get selectedProduct => _register.selectedProduct;
  @override
  List<Product> get producedProducts => _register.producedProducts;
  @override
  List<int> get coins => _register.coins;
  @override
  List<int> get payout => _register.payout;
  @override
  int get coinSum => _sum(_register.coins);
  @override
  int get payoutSum => _sum(_register.payout);
  @override
  IGuiData get guiData => _guidata;

  @override
  void selectProduct(Product product) {
    final msg = 'Produkt ${product.slotID} wurde gewählt';
    if (isAdminMode == true) return;

    _register = _register.copyWith(
      selectedProduct: product,
      message1: msg,
    );
    _tryPurchaseSnack();
  }

  @override
  void insertCoin(int nom) {
    final msg1;
    final msg2;
    final newCoins = [...coins, nom];
    final newDebit = displayDebit + nom;

    if (_user.wallet.contains(nom) == false && isAdminMode == false) {
      _register = _register.copyWith(
        message1: 'Münze nicht Gefunden',
      );
      return;
    }

    newCoins.sort((a, b) => b.compareTo(a));
    if (isAdminMode == true) {
      _register = _register.copyWith(coins: newCoins);
      _register = _register.copyWith(message1: 'Geld im Automaten: $coinSum');
      return;
    }
    if (selectedProduct.slotID != 0) {
      msg1 = message1;
    } else {
      msg1 = 'Bitte Wählen sie ein Snack';
    }

    msg2 = 'Kontostand: $newDebit';
    _user.wallet.remove(nom);
    _register = _register.copyWith(
        coins: newCoins, debit: newDebit, message1: msg1, message2: msg2);
    _tryPurchaseSnack();
  }

  @override
  void takeCoin(int nom) {
    if (isAdminMode == false) return;

    final newCoins = [...coins, nom];
    newCoins.sort((a, b) => b.compareTo(a));
    _register = _register.copyWith(payout: newCoins);
  }

  @override
  void abort() {
    var toPayout = displayDebit;
    var msg2 = '$toPayout zurückgegeben';
    if (isAdminMode) msg2 = '';
    for (var i = 0; displayDebit > 0 && i < coins.length;) {
      if (toPayout >= coins[i]) {
        payout.add(coins[i]);
        toPayout -= coins[i];
        coins.removeAt(i);
      } else {
        i++;
      }
      _register = _register.copyWith(
          debit: toPayout,
          coins: coins,
          payout: payout,
          selectedProduct: Product.empty(),
          message2: msg2);
    }
  }

  @override
  void takeSnack() {
    if (producedProducts.length == 1) return;
    _user = _user.copyWith(pocket: _user.pocket + [producedProducts.last]);
    producedProducts.removeLast();
  }

  @override
  void takePayout() {
    _user = _user.copyWith(wallet: _user.wallet + _register.payout);
    _register = _register.copyWith(payout: []);
  }

  @override
  void emptyCoinBag() {
    if (isAdminMode) {
      _register = _register
          .copyWith(coins: [], message1: 'Einnahmen wurden entnommen.');
    }
  }

  @override
  void adminMode([bool? adminMode]) {
    final newAdminMode = adminMode ?? !isAdminMode;
    var msg1 = '';
    var msg2 = '';
    abort();
    if (newAdminMode) {
      msg1 = 'Geld im Automaten: $coinSum.';
      msg2 = 'Admin Mode ist Aktiv.';
    }
    _register = _register.copyWith(
        adminMode: newAdminMode,
        selectedProduct: Product.empty(),
        debit: 0,
        message1: msg1,
        message2: msg2);
  }

  void _tryPurchaseSnack() {
    if (_isPurchasePossible()) {
      _register = _register.copyWith(
          debit: displayDebit - displayPrice,
          producedProducts: producedProducts + [selectedProduct],
          selectedProduct: Product.empty(),
          message1: 'Produkt ${selectedProduct.slotID} wurde Gekauft.');
      abort();
    }
  }

  bool _isPurchasePossible() {
    var toPayout = displayDebit - displayPrice;
    var msg1 = '';
    if (selectedProduct.slotID == 0) return false;
    if (displayDebit < displayPrice) {
      _register = _register.copyWith(message1: 'Preis: $displayPrice');
      return false;
    }

    for (var i = 0; toPayout > 0 && i < coins.length; i++) {
      if (toPayout >= coins[i]) {
        toPayout -= coins[i];
      }
    }
    if (toPayout != 0) {
      _register = _register.copyWith(message1: 'Bitte passend(er) bezahlen');
    }

    return toPayout == 0;
  }

  int _sum(List<int> list) {
    var sum = 0;
    for (var i = 0; i < list.length; i++) {
      sum += list[i];
    }
    return sum;
  }

  @override
  void setInventoryOpen([bool? isInventoryOpen]) {
    _guidata = _guidata.copyWith(
        isInventoryOpen: isInventoryOpen ?? !_guidata.isInventoryOpen);
    print(_guidata.isInventoryOpen);
  }

  @override
  void eatSnack(Product product) {
    _user.pocket.remove(product);
    _user = _user.copyWith(pocket: _user.pocket);
  }
}
