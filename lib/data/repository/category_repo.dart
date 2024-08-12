
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopzy_grocery_user/data/api/api_client.dart';
import 'package:shopzy_grocery_user/data/model/response/productDetails_model.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';

class CategoryRepo {
  final ApiClient apiClient;

  CategoryRepo({required this.apiClient,});

  Future<Response> getTopCategoryList() async {
    return await apiClient.getData(AppConstants.getTopCategory);
  }

  Future<Response> getCategoryList(int offset) async {
    return await apiClient.getData(
        '${AppConstants.categoryListUrl}?offset=$offset&limit=${AppConstants.limit}');
  }
    Future<Response> getSubCategoryList(int offset, int categories_id) async {
    return await apiClient.getData(
        '${AppConstants.subCategoryListUrl}?offset=$offset&limit=${AppConstants.limit}&categories_id=$categories_id');
  }

  Future<Response> getProductSubCategoryList(int offset,int subcategory_id) async {
    return await apiClient.getData(
        '${AppConstants.productSubCategoryListUrl}?offset=$offset&limit=${AppConstants.limit}&subcategory_id=$subcategory_id');
  }


  Future<Response> getProductDetails(int offset,int product_id) async {
    return await apiClient.getData(
        '${AppConstants.ProductDetailsUrl}?offset=$offset&limit=${AppConstants.limit}&product_id=$product_id');
  }


}
