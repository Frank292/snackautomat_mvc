import 'package:snackautomat/models/_user.dart';
import 'package:snackautomat/objects/product.dart';

class User implements IUser {
  final List<int> _wallet;
  final List<Product> _pocket;
  User({List<int>? wallet, List<Product>? pocket})
      : _wallet = wallet ??
            [
              200,
              200,
              200,
              100,
              100,
              50,
              50,
              20,
              20,
              20,
              10,
              10,
              5,
              5,
              2,
              2,
              2,
              2,
              1,
              1
            ],
        _pocket = pocket ?? [];
  @override
  User copyWith({List<int>? wallet, List<Product>? pocket}) =>
      User(wallet: wallet ?? _wallet, pocket: pocket ?? _pocket);

  @override
  int get totalMoney => _wallet.reduce((value, element) => value + element);

  @override
  List<int> get wallet => _wallet;
  @override
  List<Product> get pocket => _pocket;
}
