
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shopzy_grocery_user/data/api/api_client.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';

class ProductRepo {
  final ApiClient apiClient;
  ProductRepo({required this.apiClient});

  Future<Response> getRecommendProductList() async {
    return await apiClient.getData(
        '${AppConstants.recommendProduct}?offset=0&limit=10');
  }
  Future<Response> getFeaturedProductList() async {
    return await apiClient.getData(
        '${AppConstants.getFeatureProduct}?offset=0&limit=10');
  }


  Future<Response> getPopularProductList() async {
    return await apiClient.getData(
        '${AppConstants.getPupularProduct}?offset=0&limit=10');
  }


}
