import 'package:snackautomat/objects/product.dart';

abstract class IUserController {
  List<Product> get inventory;
  List<int> get wallet;
  int get totalMoney;
  void eatSnack(Product product);
}
