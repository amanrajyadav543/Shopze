
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';

import '../api/api_client.dart';

class SearchRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  SearchRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getSearchData(String name) async {
    return await apiClient.getData(
        '${AppConstants.search}?name=$name');
  }



  Future<bool> saveSearchHistory(List<String> searchHistories) async {
    return await sharedPreferences.setStringList(
        AppConstants.searchHistory, searchHistories);
  }


  Future<bool> clearSearchHistory() async {
    return sharedPreferences.setStringList(AppConstants.searchHistory, []);
  }
}
