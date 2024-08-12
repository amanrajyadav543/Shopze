import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shopzy_grocery_user/data/api/api_client.dart';
import 'package:shopzy_grocery_user/data/model/body/add_address_body.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';

class AddressRepo {
  final ApiClient apiClient;

  AddressRepo({required this.apiClient});

  Future<Response> showAddress() async {
    return await apiClient.getData(AppConstants.showAddressUrl);
  }
  Future<Response> addAdrees(AddAddressBody addAddressBody) async {
    return await apiClient.postData(
        AppConstants.addAddressUrl, addAddressBody.toJson());
  }


  Future<Response> removeAddress(int id) async {
    return await apiClient.postData(
        '${AppConstants.removeAddress}?id=$id',{'method:post'});
  }


}
