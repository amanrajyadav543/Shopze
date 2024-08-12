
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shopzy_grocery_user/data/api/api_client.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';

class BannerRepo {
  final ApiClient apiClient;
  BannerRepo({required this.apiClient});

  Future<Response> getBannerList() async {
    return await apiClient.getData(AppConstants.bannerUri);
  }
}
