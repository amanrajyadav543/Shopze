
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shopzy_grocery_user/data/api/api_client.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';

class CouponRepo  {
  final ApiClient apiClient;
  CouponRepo({required this.apiClient});

  Future<Response> getCouponList( int? offset) async {
    return await apiClient.getData('${AppConstants.getCouponList}?limit=${AppConstants.limit}&offset=$offset');
  }

  Future<Response> applyCoupon(String couponCode) async {
    return await apiClient.postData(
        AppConstants.applyCoupon, {'code':couponCode});
  }
}
