import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/auth_controller.dart';
import 'package:shopzy_grocery_user/data/model/body/signup_body.dart';
import 'package:shopzy_grocery_user/helper/route_helper.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';
import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? _number;
  FocusNode fieldOne= FocusNode();
  FocusNode fieldTwo= FocusNode();
  FocusNode fieldThree= FocusNode();
  FocusNode fieldFour= FocusNode();
  FocusNode fieldFive= FocusNode();
  FocusNode fieldSixe= FocusNode();
 // FocusNode fieldOne= FocusNode();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _referCodeController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  String? _countryDialCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GetBuilder<AuthController>(builder: (authController) {
          return CustomGradient(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.14),
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
                    'complete_your_signup'.tr,
                    style: interSemiBold.copyWith(
                        color: Theme.of(context).disabledColor, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomTextField(
                     focusNode: fieldOne,
                       title: "first_name".tr,
                      hintText: 'enter_your_first_name'.tr,
                      controller: _firstNameController),
                  CustomTextField(
                      focusNode: fieldTwo,
                      title: "last_name".tr,
                      hintText: 'enter_your_last_name'.tr,
                      controller: _lastNameController),
                  CustomTextField(
                      focusNode: fieldThree,
                      title: "email_name".tr,
                      hintText: 'enter_your_email_name'.tr,
                      controller: _emailController),
                  CustomTextField(
                    focusNode: fieldFour,
                      title: "Password".tr,
                      hintText: "Enter_your_password".tr,
                      controller: _passwordController),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 52,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: Theme.of(context).hintColor, width: 1),
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
                    height: 15,
                  ),
                  Container(
                    height: 52,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: Theme.of(context).hintColor, width: 1),
                    ),
                    child: TextField(
                      focusNode: fieldFive,
                      controller: _mobileNumberController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '+ 91 ' "85236996320",
                          hintStyle: interMedium.copyWith(
                              color: Theme.of(context).disabledColor,
                              fontSize: Dimensions.paddingSizeSmallExtra)),
                    ),
                  ),
                  CustomTextField(
                    focusNode: fieldSixe,
                      title: "Referal_Code_(optional)".tr,
                      hintText: 'Enter_your_referal_code'.tr,
                      controller: _referCodeController),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      radius: 10,
                      title: 'submit'.tr,
                      onPressed: () {
                        _register(authController, _countryDialCode!);
                       })
                ],
              ),
            ),
          );
        }));
  }

  void _register(AuthController authController, String countryCode) async {
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String number = _mobileNumberController.text.trim();
    String referCode = _referCodeController.text.trim();
    if (firstName.isEmpty) {
      showCustomSnackBar('enter_your_first_name'.tr);
    } else if (lastName.isEmpty) {
      showCustomSnackBar('enter_your_last_name'.tr);
    } else if (email.isEmpty) {
      showCustomSnackBar('enter_email_address'.tr);
    } else if (!GetUtils.isEmail(email)) {
      showCustomSnackBar('enter_a_valid_email_address'.tr);
      // } else if (referCode.isNotEmpty && referCode.length != 10) {
      //   showCustomSnackBar('invalid_refer_code'.tr);
    } else if (password.length < 6) {
      showCustomSnackBar('password_length_should_be_greater_than_6'.tr);
    } else if (password.isEmpty) {
      showCustomSnackBar('enter_password'.tr);
    } else if (number.isEmpty) {
      showCustomSnackBar('enter_mobile_number');
    } else {
      SignUpBody signUpBody = SignUpBody(
          first_name: firstName,
          last_name: lastName,
          email: email,
          password: password,
          country: _countryDialCode,
          referral_code: referCode,
          phone_number: _number);
      authController.registration(signUpBody).then((status) async {
        if (status.isSuccess!) {
           Get.toNamed(RouteHelper.getHomeRoute());
        } else {
          showCustomSnackBar(status.message!);
        }
      });
    }
  }
}
