import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';
import 'package:shopzy_grocery_user/view/screens/home_screen/home_screen.dart';
import 'package:shopzy_grocery_user/view/screens/onBoarding/onBoarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences prefs;
  String? token;

  @override
  void initState() {
    super.initState();
    initTimer();

  }
  void initTimer()async{
    if(await checkinternet()){
      if(token!=null)
      Future.delayed(
        const Duration(seconds: 3),
            () => Get.to(() => const HomeScreen()),
      );
      else
        Future.delayed(
          const Duration(seconds: 3),
              () => Get.to(() => const OnBoardScreen()),
        );

    }
    else{
      showCustomSnackBar("Chech Internet Connectivity");
    }
  }
  Future<bool>checkinternet()async{
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString('${AppConstants.token}');
    var connectivityResult =await (Connectivity().checkConnectivity());
    if(connectivityResult==ConnectivityResult.mobile || connectivityResult==ConnectivityResult.wifi )
      return true;
    else return false;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.backgroundColor,
      body: Center(
        child: Image.asset(Images.appLogo,width: 218,height: 218,),
      ),
    );
  }
}
