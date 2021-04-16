import 'package:flutter/material.dart';
import 'package:snackautomat/models/_register.dart';
import 'package:snackautomat/objects/product.dart';

/// Concrete implementation of IRegister
class Register implements IRegister {
  final List<int> _payout;
  final List<int> _coins;
  final bool _adminMode;
  final int _debit;
  final String _message1;
  final String _message2;
  final Product _selectedProduct;
  final List<Product> _producedProducts;

  @override
  List<int> get payout => _payout;
  @override
  List<int> get coins => _coins;
  @override
  bool get adminMode => _adminMode;
  @override
  int get debit => _debit;
  @override
  String get message1 => _message1;
  @override
  String get message2 => _message2;
  @override
  Product get selectedProduct => _selectedProduct;
  @override
  List<Product> get producedProducts => _producedProducts;

  /// constructor
  Register(
      {List<int>? payout,
      List<int>? coins,
      bool? adminMode,
      int? debit,
      String? message1,
      String? message2,
      Product? selectedProduct,
      List<Product>? producedProducts,
      Icon? selectedItem})
      : _payout = payout ?? [],
        _coins = coins ?? [],
        _adminMode = adminMode ?? false,
        _debit = debit ?? 0,
        _message1 = message1 ?? 'Bitte Wählen sie ein Snack',
        _message2 = message2 ?? '',
        _selectedProduct = selectedProduct ?? Product.empty(),
        _producedProducts = producedProducts ?? [Product.empty()];

  @override
  Register copyWith(
          {List<int>? payout,
          List<int>? coins,
          bool? adminMode,
          int? debit,
          String? message1,
          String? message2,
          Product? selectedProduct,
          List<Product>? producedProducts,
          Icon? selectedItem}) =>
      Register(
          payout: payout ?? _payout,
          coins: coins ?? _coins,
          adminMode: adminMode ?? _adminMode,
          debit: debit ?? _debit,
          message1: message1 ?? _message1,
          message2: message2 ?? _message2,
          selectedProduct: selectedProduct ?? _selectedProduct,
          producedProducts: producedProducts ?? _producedProducts);
}
