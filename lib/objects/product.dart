import 'package:flutter/cupertino.dart';

class Product {
  int _slotID = 0;
  int _price = 0;
  Image _image = Image.asset('assets/images/chips.png');

  int get slotID => _slotID;
  int get price => _price;
  Image get image => _image;

  ///Do not use slotID: 0; 0 is for a empty Product
  Product({required int slotID, required int price, required Image image})
      : _slotID = slotID,
        _price = price,
        _image = image;

  ///Empty Product has slotID: 0, price: 0 and a invisible Image.
  Product.empty()
      : _slotID = 0,
        _price = 0,
        _image = Image.asset('assets/images/empty.png');
}
