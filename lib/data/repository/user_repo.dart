
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopzy_grocery_user/data/api/api_client.dart';
import 'package:shopzy_grocery_user/data/model/response/userInfo_model.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';

class UserRepo {
  final ApiClient apiClient;
  UserRepo({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.updateUserProfile);
  }
  Future<Response> getUserProfile() async {
    return await apiClient.getData(AppConstants.userProfile);
  }

  Future<Response> updateProfile(
      UserInfoModel userInfoModel, XFile? data, String token) async {
    Map<String, String> _body = Map();
    _body.addAll(<String, String>{
      'name': userInfoModel.name!,
      'email': userInfoModel.email!,
    });
    return await apiClient.postMultipartData(
        AppConstants.updateUserProfile, _body, [MultipartBody('image', data)]);
  }

  Future<Response> changePassword(UserInfoModel? userInfoModel) async {
    return await apiClient.postData(AppConstants.updateUserProfile, {
      'first_name': userInfoModel?.first_name,
      'last_name': userInfoModel?.last_Name,
      'email': userInfoModel?.email,
      'password': userInfoModel?.password
    });
  }


}
