import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:shopzy_grocery_user/controller/auth_controller.dart';
import 'package:shopzy_grocery_user/helper/route_helper.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';
import 'package:shopzy_grocery_user/view/base/custom_loader.dart';
import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';

class OtpScreen extends StatefulWidget {
  final String number;
  const OtpScreen({super.key, required this.number});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // String? _number;
  //  @override
  // void initState() {
  //   _number = widget.number.startsWith('+') ?
  //   widget.number : '+${widget.number.substring(0,widget.number.length)}';
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GetBuilder<AuthController>(builder: (authController){
          return  CustomGradient(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
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
                    'verify_phone'.tr,
                    style: interSemiBold.copyWith(
                        color: Theme.of(context).disabledColor, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'sent_to_mobile'.tr,
                    textAlign: TextAlign.center,
                    style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor, fontSize: 16),
                  ),
                  Center(
                    child: Text(
                      widget.number.tr,
                      textAlign: TextAlign.center,
                      style: interMedium.copyWith(
                          color: Theme.of(context).disabledColor, fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
                    child: OTPTextField(
                      otpFieldStyle: OtpFieldStyle(
                        enabledBorderColor: Theme.of(context).hintColor,
                        disabledBorderColor: Theme.of(context).hintColor,
                        borderColor: Theme.of(context).hintColor,
                        errorBorderColor: Theme.of(context).hintColor,
                        backgroundColor: Theme.of(context).cardColor,
                        focusBorderColor: Theme.of(context).hintColor,
                      ),
                      outlineBorderRadius: 18,
                      keyboardType: TextInputType.number,
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      style: interMedium.copyWith(
                        fontSize: 22,
                        color: Theme.of(context).hintColor,
                      ),
                      fieldWidth: 52,
                      spaceBetween: 0,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.box,
                      onChanged:  authController.updateVerificationCode,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "didn't_receive".tr,
                        style: interMedium.copyWith(
                          color: Theme.of(context).disabledColor,
                          fontSize: Dimensions.fontSizeExtraSmall,
                        ),
                      ),
                      Text(
                        "${"resend_otp".tr} (15 sec)",
                        style: interSemiBold.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: Dimensions.fontSizeExtraSmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  authController.verificationCode.length == 4
                      ? authController.isLoading
                      ? const CustomLoader()
                      : CustomButton(
                      radius: Dimensions.fontSizeVerySmall,
                      title: 'verify'.tr,
                      onPressed: () {
                        authController.verifyOtp(widget.number).then((value){
                          if(value.isSuccess!){
                          }
                        });
                        showCustomSnackBar('login_successfully'.tr);
                        Future.delayed(const Duration(seconds: 2 ),(){
                          Get.offNamed(RouteHelper.getHomeRoute());
                        });
                      })
                      : const SizedBox()
                ],
              ),
            ),
          );

        },));
  }
}