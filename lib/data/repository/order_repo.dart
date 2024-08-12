import 'package:shopzy_grocery_user/data/api/api_client.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  OrderRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getActiveOrderList(int offset) async {
    return await apiClient.getData(
        '${AppConstants.activeOrders}?offset=$offset&limit=10');
  }

  // Future<Response> getHistoryOrderList(int offset) async {
  //   return await apiClient.getData(
  //       '${AppConstants.HISTORY_ORDER_LIST_URI}?offset=$offset&limit=10');
  // }
  //


}
