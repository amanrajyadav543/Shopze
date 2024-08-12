
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopzy_grocery_user/data/api/api_checker.dart';
import 'package:shopzy_grocery_user/data/model/response/response_model.dart';
import 'package:shopzy_grocery_user/data/model/response/userInfo_model.dart';
import 'package:shopzy_grocery_user/data/model/response/userProfile_model.dart';

import '../data/repository/user_repo.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({required this.userRepo});

  UserInfoModel? _userInfoModel;
  User?   _user;

  XFile? _pickedFile;
  bool _isLoading = false;

  UserInfoModel? get userInfoModel => _userInfoModel;
  User? get user=> _user;
  XFile? get pickedFile => _pickedFile;
  bool get isLoading => _isLoading;

  Future<ResponseModel> getUserInfo() async {
    _pickedFile = null;
    ResponseModel _responseModel;
    Response response = await userRepo.getUserInfo();
    if (response.statusCode == 200) {
      _userInfoModel = UserInfoModel.fromJson(response.body);
      _responseModel = ResponseModel(true, 'successful'.tr);
    } else {
      _responseModel = ResponseModel(false, response.statusText);
      ApiChecker.checkApi(response);
    }
    update();
    return _responseModel;
  }

  Future<ResponseModel> getUserProfile() async {
    _user=null;
    ResponseModel _responseModel;
    Response response = await userRepo.getUserProfile();
    if (response.statusCode == 200) {
      _user;
      _user = UserProfileModel.fromJson(response.body).user;
      _responseModel = ResponseModel(true, 'successful'.tr);
    } else {
      _responseModel = ResponseModel(false, response.statusText);
      ApiChecker.checkApi(response);
    }
    update();
    return _responseModel;
  }

  Future<ResponseModel> updateUserInfo(
      UserInfoModel updateUserModel, String token) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;
    Response response =
    await userRepo.updateProfile(updateUserModel, _pickedFile, token);
    _isLoading = false;
    if (response.statusCode == 200) {
      _userInfoModel = updateUserModel;
      _responseModel = ResponseModel(true, response.bodyString);
      _pickedFile = null;
      getUserInfo();
      print(response.bodyString);
    } else {
      _responseModel = ResponseModel(false, response.statusText);
      print(response.statusText);
    }
    update();
    return _responseModel;
  }

  Future<ResponseModel> changePassword(UserInfoModel? updatedUserModel) async {
    _isLoading = true;
    update();
    ResponseModel _responseModel;
    Response response = await userRepo.changePassword(updatedUserModel);
    _isLoading = false;
    if (response.statusCode == 200) {
      String message = response.body["message"];
      _responseModel = ResponseModel(true, message);
    } else {
      _responseModel = ResponseModel(false, response.statusText);
    }
    update();
    return _responseModel;
  }

  void pickImage() async {
    _pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    update();
  }

  void initData() {
    _pickedFile = null;
  }



}
