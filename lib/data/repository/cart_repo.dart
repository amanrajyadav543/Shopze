
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/app_constants.dart';
import '../model/response/cart_model.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  List<CartModel> getCartList() {
    List<String>? carts = [];
    if (sharedPreferences.containsKey(AppConstants.cartList)) {
      carts = sharedPreferences.getStringList(AppConstants.cartList);
    }
    List<CartModel> cartList = [];
    carts?.
    forEach((cart) => cartList.add(CartModel.fromJson(jsonDecode(cart))));
    return cartList;
  }

  void addToCartList(List<CartModel> cartProductList) {
    List<String> carts = [];
    cartProductList.forEach((cartModel) => carts.add(jsonEncode(cartModel)));
    sharedPreferences.setStringList(AppConstants.cartList, carts);
  }
}
