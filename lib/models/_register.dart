import 'package:flutter/material.dart';
import 'package:snackautomat/models/register.dart';
import 'package:snackautomat/objects/product.dart';

/// Interface the Register class has to implement
abstract class IRegister {
  /// Coins
  ///  that are where the user can take it (Ausgabeschacht)
  List<int> get payout;

  /// Coins that are in the machine for future transactions
  List<int> get coins;

  /// True if machine is in admin mode
  bool get adminMode;

  /// The amount of money we owe to the current user
  int get debit;

  /// Message to be displayed on display
  String get message1;
  String get message2;

  /// Price of selected product (if a product was selected)

  /// The Products we just bought a product from. The product can be taken
  /// by the user.
  List<Product> get producedProducts;

  /// The Product we want ot buy an item from.

  Product get selectedProduct;

  /// This central switch defaults to Register (which you have to implement).
  /// This way, the program can just create a new IRegister object. But, IRegister
  /// is abstract (which means it cannot be created). Instead, this factory
  /// lets Register create an object instead, which is possible because Register
  /// implements IRegister. This means that Register IS also of type IRegister.
  factory IRegister() = Register;

  /// We want Register to be an immutable state object. This means that all
  /// attributes are final. Instead of changing them, we just create a new
  /// Register object. With this method, we create a new Register object by
  /// reusing all old attributes, other than the ones we explicitly want to
  /// change.
  IRegister copyWith({
    List<int>? coins,
    List<int>? payout,
    bool? adminMode,
    int? debit,
    String? message1,
    String? message2,
    Product? selectedProduct,
    List<Product>? producedProducts,
    Icon? selectedItem,
  });
}
