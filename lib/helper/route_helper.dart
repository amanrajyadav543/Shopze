import 'package:get/get.dart';
import 'package:shopzy_grocery_user/view/screens/address/add_new_address.dart';
import 'package:shopzy_grocery_user/view/screens/address/address.dart';
import 'package:shopzy_grocery_user/view/screens/auth/login_screen.dart';
import 'package:shopzy_grocery_user/view/screens/auth/otp_screen.dart';
import 'package:shopzy_grocery_user/view/screens/auth/signup_screen.dart';
import 'package:shopzy_grocery_user/view/screens/bottom_navigation/bottom_navigation.dart';
import 'package:shopzy_grocery_user/view/screens/category/all_category_screen.dart';
import 'package:shopzy_grocery_user/view/screens/home_screen/home_screen.dart';
import 'package:shopzy_grocery_user/view/screens/home_screen/widget/favourite_items_widget.dart';
import 'package:shopzy_grocery_user/view/screens/onBoarding/onBoarding.dart';
import 'package:shopzy_grocery_user/view/screens/splash/splash_screen.dart';



class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String otpLogin = '/otpLogin';
  static const String otpScreen = '/otpScreen';
  static const String signIn = '/sign-in';
  static const String address = '/address';
  static const String addAddress = '/add-address';
  static const String allCategory = '/all-category';
  static const String onBoarding = '/on-boarding';
  static const String favorite = '/favorite';
  static const String home = '/home';



  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;
  static String getOtpLoginRoute() => otpLogin;
  static String getOtpScreenRoute(String number) => '$otpScreen?number=$number';
  static String getSignInRoute() => signIn;
  static String getShowAddressRoute() => address;
  static String getAddAddressRoute() => addAddress;
  static String allCategoryRoute() => allCategory;
  static String getOnBoardingRoute() => onBoarding;
  static String getFavoriteRoute() => favorite;
  static String getHomeRoute() => home;


  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: otpLogin, page: () => const LoginScreen()),
    GetPage(name: otpScreen, page: () => OtpScreen(number: Get.parameters['number']!,)),
    GetPage(name: initial, page: () => const BottomNavigationBarScreen()),
    GetPage(name: signIn, page: () => const SignUpScreen()),
    GetPage(name: address, page: () => const AddressScreen()),
    GetPage(name: addAddress, page: () => const AddNewAddressScreen()),
    GetPage(name: allCategory, page: () => const AllCategoryScreen()),
    GetPage(name: onBoarding, page: () => const OnBoardScreen()),
    GetPage(name: favorite, page: () => const FavouriteItemsWidget()),
    GetPage(name: home, page: () => const HomeScreen()),

  ];



}