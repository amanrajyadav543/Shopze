import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/auth_controller.dart';
import 'package:shopzy_grocery_user/helper/route_helper.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';
import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';
import 'package:shopzy_grocery_user/view/screens/auth/user_details_social.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? _countryDialCode;
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body:   GetBuilder<AuthController>(builder: (authController) {
      return  CustomGradient(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.18),
                child: Center(
                    child: Image.asset(
                  Images.smallAppLogo,
                  width: 181,
                  height: 57,
                )),
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'login_account'.tr,
                style: interSemiBold.copyWith(
                    color: Theme.of(context).disabledColor, fontSize: 22),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 52,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Theme.of(context).hintColor),
                ),
                child: CountryCodePicker(
                  showFlagMain: true,
                  alignLeft: true,
                  flagWidth: 30,
                  dialogBackgroundColor: Theme.of(context).cardColor,
                  onChanged: (countryCode) {
                    _countryDialCode =
                        countryCode.dialCode;
                  },
                  initialSelection: 'in',
                  showOnlyCountryWhenClosed: false,
                  showCountryOnly: false,
                  showDropDownButton: true,
                  padding: EdgeInsets.zero,
                  textStyle: interMedium.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: Dimensions.fontSizeExtraSmall,
                  ),

                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 52,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Theme.of(context).hintColor),
                ),
                child: TextField(
                  controller: _phoneController,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '+ 91' "85236996320",
                      hintStyle: interMedium.copyWith(
                          color: Theme.of(context).disabledColor,
                          fontSize: Dimensions.paddingSizeSmallExtra)),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                    title: 'sms'.tr,
                    fontSize: 16,
                    onPressed: () {
                      _sms(authController,int.parse(_countryDialCode!));
                    },
                    radius: 10,
                  )),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: CustomButton(
                    title: 'whatsapp'.tr,
                    fontSize: 16,
                    onPressed: () {

                    },
                    radius: 10,
                  )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                      width: Get.width * 0.3,
                      child: const Divider(
                        thickness: 2,
                        endIndent: 10,
                      )),
                  Text(
                    "or_sign_in_using".tr,
                    style: interSemiBold.copyWith(
                        color: Theme.of(context).disabledColor, fontSize: 14),
                  ),
                  SizedBox(
                      width: Get.width * 0.3,
                      child: const Divider(
                        thickness: 2,
                        indent: 10,
                      )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(const SignUpSocialMedia());
                    },
                    child: Image.asset(
                      Images.gogglePng,
                      height: 55,
                      width: 55,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    Images.facebookPng,
                    height: 55,
                    width: 55,
                  ),
                ],
              )
            ],
          ),
        ),
      );},
    ));
  }



  void _sms(AuthController authController, int countryDialCode) async {
    String phone = _phoneController.text.trim();

    String numberWithCountryCode = "+$countryDialCode$phone";
    if (kDebugMode) {
      print("$numberWithCountryCode this is number");
    }
    if (phone.isEmpty) {
      showCustomSnackBar('enter_phone_number'.tr);
    }else {
      authController.login(numberWithCountryCode,countryDialCode).then((status) async {
        if (status.isSuccess==true) {
          Get.toNamed(RouteHelper.getOtpScreenRoute(numberWithCountryCode));
        } else {
          showCustomSnackBar(status.message!);
        }
      });
    }
  }
}
