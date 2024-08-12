import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';

class ApiChecker {
  static void checkApi(Response response) {
    if (response.statusCode == 401) {
      // Get.find<AuthController>().clearSharedData();
      // Get.find<WishListController>().removeWishes();
      // Get.offAllNamed(RouteHelper.getSignInRoute(RouteHelper.splash));
    } else {
      showCustomSnackBar(response.statusText!);
    }
  }
}
