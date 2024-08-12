import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/helper/route_helper.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';
import 'package:shopzy_grocery_user/view/base/custom_textfield.dart';
import 'package:shopzy_grocery_user/view/screens/auth/otp_screen.dart';

class SignUpSocialMedia extends StatelessWidget {
  const SignUpSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomGradient(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
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
              SizedBox(
                height: 40,
              ),
              Text(
                'complete_your_signup'.tr,
                style: interSemiBold.copyWith(
                    color: Theme.of(context).disabledColor, fontSize: 22),
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextField(title: "first_name".tr, hintText: 'Eric '.tr),
              CustomTextField(title: "last_name".tr, hintText: 'Thomson '.tr),
              CustomTextField(title: "email_name".tr, hintText: 'eric.thomson@gmail.com'.tr),
              SizedBox(height: 15,),
              Container(
                height: 52,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Theme.of(context).hintColor,width: 1),
                ),
                child: CountryCodePicker(
                  showFlagMain: true,
                  alignLeft: true,
                  flagWidth: 30,
                  dialogBackgroundColor: Theme.of(context).cardColor,
                  onChanged: (countryCode) {},
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
              SizedBox(
                height: 15,
              ),
              Container(
                height: 52,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: Theme.of(context).hintColor,width: 1),
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '+ 91 ' "85236996320",
                      hintStyle: interMedium.copyWith(
                          color: Theme.of(context).disabledColor,
                          fontSize: Dimensions.paddingSizeSmallExtra)),
                ),
              ),
              CustomTextField(title: "referral_code".tr, hintText: 'enter_your_referral_code'.tr),
              SizedBox(height: 30,),
              CustomButton(
                  radius: 10,
                  title: 'submit'.tr, onPressed: (){
                Get.toNamed(RouteHelper.otpScreen);
              })




            ],
          ),
        ),
      ),
    );
  }
}
