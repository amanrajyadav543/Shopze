
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/data/model/body/signup_body.dart';
import 'package:shopzy_grocery_user/data/model/response/response_model.dart';

import 'package:shopzy_grocery_user/data/repository/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  AuthController({required this.authRepo});
  bool _isLoading = false;
  String _verificationCode = '';


  bool _isActiveRememberMe = false;
  String get verificationCode => _verificationCode;


  bool get isLoading => _isLoading;
  bool get isActiveRememberMe => _isActiveRememberMe;

  Future<ResponseModel> registration(SignUpBody signUpBody) async {
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body["token"]);
      print("token  "+response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText);
    }
    _isLoading = false;
    update();
    return responseModel;
  }


  Future<ResponseModel> login(String phone, int counrtyCode) async {
    _isLoading = true;
    update();
    Response response = await authRepo.login(phone: phone , country: counrtyCode);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      // authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true,
          '${response.body['is_phone_verified']}${response.body['token']}');

    } else {
      responseModel = ResponseModel(false, response.statusText);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
  Future<ResponseModel> verifyOtp(String phoneNumber) async{
    _isLoading = true;
    update();
    Response response = await authRepo.verifyOtp(phoneNumber, _verificationCode);
    ResponseModel? responseModel;
    if (response.statusCode == 200) {
      String? token = response.body['token'];
      authRepo.saveUserToken(response.body["token"]);
      await authRepo.updateToken(token!);
      responseModel = ResponseModel(true, response.body["token"]);
    } else {
      responseModel = ResponseModel(false, response.statusText);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    update();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }
  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  void updateVerificationCode(String query) {
    _verificationCode = query;
    update();
  }




}