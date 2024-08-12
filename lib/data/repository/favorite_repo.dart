
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shopzy_grocery_user/data/api/api_client.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';

class FavroiteRepo {
  final ApiClient apiClient;
  FavroiteRepo({required this.apiClient});

  Future<Response> addFavoriteList(int? productId) async {
    return await apiClient.postData(
        '${AppConstants.addFavoriteProducts}?product_id=$productId', {'product_id' : productId});
  }
  Future<Response> removeFavouriteList(int? productId) async {
    return await apiClient.deleteData(
        '${AppConstants.removeFavoriteProducts}?favorite_product_id=$productId');
  }
  Future<Response> getFavoriteList(int offset) async {
    return await apiClient.getData(
        '${AppConstants.getAllFavoriteProducts}?limit=${AppConstants.limit}&offset=$offset');
  }

}
