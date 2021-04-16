import 'package:snackautomat/models/user.dart';
import 'package:snackautomat/objects/product.dart';

abstract class IUser {
  List<int> get wallet;
  List<Product> get pocket;

  factory IUser() = User;

  IUser copyWith({List<int>? wallet, List<Product>? pocket});
}
