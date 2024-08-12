
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopzy_grocery_user/data/api/api_client.dart';
import 'package:shopzy_grocery_user/data/model/body/signup_body.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> registration(SignUpBody signUpBody) async {
    return await apiClient.postData(
        AppConstants.registerUri, signUpBody.toJson());
  }

  Future<Response> login({String? phone ,int? country}) async {
    return await apiClient.postData(AppConstants.loginUri, {"phone_number": phone, "country":country.toString()});
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(
        token);
    return await sharedPreferences.setString(AppConstants.token, token);
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.token) ?? "";
  }
  bool isLoggedIn() {
    return sharedPreferences.containsKey(AppConstants.token);
  }
  Future<Response> verifyOtp(String phone , String otp) async{
    return  apiClient.postData(AppConstants.verifyOtp, {'phone_number' : phone.trim() , 'otp' : otp});
  }

  Future<void> updateToken(String token) async {
    if (GetPlatform.isIOS && !GetPlatform.isWeb) {
      FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
          alert: true, badge: true, sound: true);
      NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      } else {}
    }
  }
}
