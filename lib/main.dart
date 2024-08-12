import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/localization_controller.dart';
import 'package:shopzy_grocery_user/helper/route_helper.dart';
import 'package:shopzy_grocery_user/themes/light.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';
import 'package:shopzy_grocery_user/utils/messages.dart';
import 'package:shopzy_grocery_user/helper/get_di.dart' as di;
import 'package:shopzy_grocery_user/view/screens/cart/cart_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  Map<String, Map<String, String>> languages = await di.init();
  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;

  const MyApp({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localisationController) {
          return GetMaterialApp(
            theme: light,

            home: CartScreen(),
            title: AppConstants.appName,
            locale: localisationController.locale,
            debugShowCheckedModeBanner: false,
            translations: Messages(languages: languages),
            fallbackLocale: Locale(AppConstants.languages[0].languageCode!, AppConstants.languages[0].countryCode),
            getPages: RouteHelper.routes,
           // initialRoute: RouteHelper.splash,
          );
        });
  }
}
