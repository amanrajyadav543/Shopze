import 'package:shopzy_grocery_user/data/model/response/ProductsBySubcategory_model.dart';

class CartModel {
  double? _price;
  double? _discountedPrice;
  double? _discountAmount;
  int? _quantity;

  // List<AddOn>? _addOnIds;
  Product? _product;

  CartModel(double? price, double? discountedPrice, double? discountAmount,
      int? quantity, Product? product) {
    _price = price;
    _discountedPrice = discountedPrice;

    _discountAmount = discountAmount;
    _quantity = quantity;
    // this._addOnIds = addOnIds;

    _product = product;
  }

  double? get price => _price;

  double? get discountedPrice => _discountedPrice;

  double? get discountAmount => _discountAmount;

  // ignore: unnecessary_getters_setters
  int? get quantity => _quantity;

  // ignore: unnecessary_getters_setters
  set quantity(int? qty) => _quantity = qty;

  // List<AddOn>? get addOnIds => _addOnIds;

  Product? get product => _product;

  CartModel.fromJson(Map<String, dynamic> json) {
    _price = json['price'].toDouble();
    _discountedPrice = json['discounted_price'].toDouble();

    _discountAmount = json['discount_amount'].toDouble();
    _quantity = json['quantity'];
    // if (json['add_on_ids'] != null) {
    //   _addOnIds = [];
    //   json['add_on_ids'].forEach((v) {
    //     _addOnIds?.add(new AddOn.fromJson(v));
    //   });
    // }

    if (json['product'] != null) {
      _product = Product.fromJson(json['product']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = _price;
    data['discounted_price'] = _discountedPrice;

    data['discount_amount'] = _discountAmount;
    data['quantity'] = _quantity;
    /*  if (this._addOnIds != null) {
      data['add_on_ids'] = this._addOnIds?.map((v) => v.toJson()).toList();
    }*/
    data['product'] = _product?.toJson();
    return data;
  }
}

class AddOn {
  int? _id;
  int? _quantity;

  AddOn({int? id, int? quantity}) {
    _id = id;
    _quantity = quantity;
  }

  int? get id => _id;

  int? get quantity => _quantity;

  AddOn.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['quantity'] = _quantity;
    return data;
  }
}
