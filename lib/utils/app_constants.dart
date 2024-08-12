
import 'package:shopzy_grocery_user/data/model/language_model.dart';

class AppConstants {
  static const String appName = 'shopzyUser';
  static const String languagesCode = 'languages';
  static const String countryCode = 'countryCode';
  static const int limit = 10;



  static const String baseurl = 'https://shopze.sqaby.com/api';
  static const String registerUri = '/auth/register';
  static const String loginUri = '/auth/login';
  static const String updateUserProfile = '/v1/profileUpdate';
  static const String userProfile = '/v1/profile';
  static const String verifyOtp = '/auth/verifyOtp';
  static const String showAddressUrl = '/v1/showAddress';
  static const String addAddressUrl = '/v1/addressStore';
  static const String removeAddress = '/v1/deleteAddress';
  static const String getTopCategory = '/v1/category/topCategoery';
  static const String addFavoriteProducts = '/v1/product/addFavoriteProducts';
  static const String removeFavoriteProducts = '/v1/product/removeFavoriteProduct';
  static const String getAllFavoriteProducts = '/v1/product/getAllFavoriteProducts';
  static const String categoryListUrl = '/v1/category/categoryList';
  static const String productSubCategoryListUrl = '/v1/product/getProductsBySubcategory';
  static const String ProductDetailsUrl = '/v1/product/getProductDetails';
  static const String subCategoryListUrl = '/v1/category/allsubcategory';
  static const String activeOrders = '/v1/order/activeOrder';
  static const String bannerUri = '/v1/banner';
  static const String recommendProduct = '/v1/product/getRecommendationProduct';
  static const String getPupularProduct = '/v1/product/getPopularProducts';
  static const String getFeatureProduct = '/v1/product/getFeatureProduct';
  static const String getCouponList = '/v1/order/getCouponsList';
  static const String applyCoupon = '/v1/order/applyCoupon';
  static const String search = '/v1/product/search';




  static const String imageBaseurl = 'https://music.ewr1.vultrobjects.com/category/';
  static const String zoneId = 'zoneId';
  static const String localizationKey = 'X-localization';
  static const String latitude = 'latitude';
  static const String longitude = 'longitude';
  static const String token = 'usertoken';
  static const String cartList = 'cart_list';
  static const String searchHistory = 'search_history';








  static List<LanguageModel> languages = [
    LanguageModel(
        countryCode: 'en',
        imageUrl: '',
        languageCode: 'en',
        languageName: 'English'),
  ];

}
