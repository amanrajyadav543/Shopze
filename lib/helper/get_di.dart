import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopzy_grocery_user/controller/address_controller.dart';
import 'package:shopzy_grocery_user/controller/auth_controller.dart';
import 'package:shopzy_grocery_user/controller/banner_controller.dart';
import 'package:shopzy_grocery_user/controller/category_controller.dart';
import 'package:shopzy_grocery_user/controller/coupan_controller.dart';
import 'package:shopzy_grocery_user/controller/favorite_controller.dart';
import 'package:shopzy_grocery_user/controller/localization_controller.dart';
import 'package:shopzy_grocery_user/controller/product_controller.dart';
import 'package:shopzy_grocery_user/controller/user_controller.dart';
import 'package:shopzy_grocery_user/data/api/api_client.dart';
import 'package:shopzy_grocery_user/data/model/language_model.dart';
import 'package:shopzy_grocery_user/data/repository/address_repo.dart';
import 'package:shopzy_grocery_user/data/repository/auth_repo.dart';
import 'package:shopzy_grocery_user/data/repository/banner_repo.dart';
import 'package:shopzy_grocery_user/data/repository/cart_repo.dart';
import 'package:shopzy_grocery_user/data/repository/category_repo.dart';
import 'package:shopzy_grocery_user/data/repository/coupan_repo.dart';
import 'package:shopzy_grocery_user/data/repository/favorite_repo.dart';
import 'package:shopzy_grocery_user/data/repository/product_repo.dart';
import 'package:shopzy_grocery_user/data/repository/user_repo.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.baseurl, sharedPreferences: Get.find()));

  Get.lazyPut(() => sharedPreferences);

  //repository
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => CategoryRepo(apiClient: Get.find()));
  Get.lazyPut(() => BannerRepo(apiClient: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));
  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => FavroiteRepo(apiClient: Get.find()));
  Get.lazyPut(() => AddressRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));
  Get.lazyPut(() => CouponRepo(apiClient: Get.find()));


  //controller
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => ProductController(productRepo: Get.find()));
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => BannerController(bannerRepo: Get.find()));
  Get.lazyPut(() => CategoryController(categoryRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => FavoriteController(favroiteRepo: Get.find()));
  Get.lazyPut(() => AddressController(addressRepo: Get.find()));
  Get.lazyPut(() => CategoryController(categoryRepo: Get.find()));
  Get.lazyPut(() => CouponController(couponRepo: Get.find()));

  Map<String, Map<String, String>> language = {};
  try {
    for (LanguageModel languageModel in AppConstants.languages) {
      String jsonStringsValues = await rootBundle
          .loadString("assets/languages/${languageModel.languageCode}.json");

      Map<String, dynamic> mappedJson = jsonDecode(jsonStringsValues);
      Map<String, String> json = {};
      mappedJson.forEach((key, value) {
        json[key] = value.toString();
      });
      language['${languageModel.languageCode}_${languageModel.countryCode}'] =
          json;
    }
  } catch (e) {
    debugPrint(e.toString());
  }
  return language;
}
