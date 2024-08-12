import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_dialogbox.dart';
import 'package:shopzy_grocery_user/view/screens/address/address.dart';
import 'package:shopzy_grocery_user/view/screens/help_support/help_support.dart';
import 'package:shopzy_grocery_user/view/screens/notification/notification.dart';
import 'package:shopzy_grocery_user/view/screens/profile/profile.dart';
import 'package:shopzy_grocery_user/view/screens/setting/widgets/setting_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 162,
              decoration:
                  BoxDecoration(color: Theme.of(context).backgroundColor),
              child: Padding(
                padding: const EdgeInsets.only(top: 30,left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        Images.placeHolderImage,
                        height: 65,
                        width: 65,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Eric Thomson",
                          style: interSemiBold.copyWith(
                              color: Theme.of(context).disabledColor,
                              fontSize: 18),
                        ),
                        Text(
                          "+880 8882871801",
                          style: interMedium.copyWith(
                              color: Theme.of(context).hintColor, fontSize: 16),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "general".tr,
                      style: interSemiBold.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Theme.of(context).disabledColor,width: 0.07),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 4),
                              blurRadius: 4)
                        ]),
                    child: Column(
                      children: [
                        SettingButtons(
                          title: 'my_profile'.tr,
                          image: Images.profileImage,
                          onPressed: () {
                            Get.to( ProfileScreen());
                          },
                        ),
                        SettingButtons(
                          title: 'my_address'.tr,
                          image: Images.myAddressPng,
                          onPressed: () {
                            Get.to(const AddressScreen());
                          },
                        ),
                        SettingButtons(
                          title: 'blintz_wallet'.tr,
                          image: Images.myAddressPng,
                          onPressed: () {},
                        ),
                        SettingButtons(
                          title: 'notification'.tr,
                          image: Images.notificationIcon,
                          notification: true,
                          divider: false,
                          onPressed: () {
                            Get.to(NotificationScreen());
                            Get.dialog(CustomDialogBox(title: 'disable_notification'.tr
                              , description: 'turning_off_notification'.tr, onPressed: () {  }, image: Images.notificationDisableImage,
                            ));

                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "promotional".tr,
                      style: interSemiBold.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Theme.of(context).disabledColor,width: 0.07),

                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 4),
                              blurRadius: 4)
                        ]),
                    child: Column(
                      children: [
                        SettingButtons(
                          title: 'coupon'.tr,
                          image: Images.couponIcon,
                          onPressed: () {},
                        ),
                        SettingButtons(
                          title: 'refer_earn'.tr,
                          image: Images.referEarnIcon,
                          divider: false,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "other_information".tr,
                      style: interSemiBold.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: Theme.of(context).disabledColor,width: 0.07),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 4),
                              blurRadius: 4)
                        ]),
                    child: Column(
                      children: [
                        SettingButtons(
                          title: 'help_support'.tr,
                          image: Images.helpSupportIcon,
                          onPressed: () {
                            Get.to(HelpSupportScreen());
                          },
                        ),
                        SettingButtons(
                          title: 'about_us'.tr,
                          image: Images.aboutUsPng,
                          onPressed: () {},
                        ),
                        SettingButtons(
                          title: 'terms_condition'.tr,
                          image: Images.termsConditionPng,
                          onPressed: () {},
                        ),
                        SettingButtons(
                          title: 'cancellation_policy'.tr,
                          image: Images.cancellationPolicy,
                          onPressed: () {},
                        ),
                        SettingButtons(
                          title: 'refund_policy'.tr,
                          image: Images.refundPolicy,
                          divider: false,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      "my_account".tr,
                      style: interSemiBold.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 18),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Theme.of(context).disabledColor,width: 0.07),

                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              offset: Offset(0, 4),
                              blurRadius: 4)
                        ]),
                    child: Column(
                      children: [
                        SettingButtons(
                          title: 'logout'.tr,
                          image: Images.logoutIcon,
                          onPressed: () {
                            Get.dialog(CustomDialogBox(title: 'logout_account'.tr
                              , description: 'need_to_sign'.tr, onPressed: () {  }, image: Images.logoutImage,
                            ));

                          },
                        ),
                        SettingButtons(
                          title: 'delete_account'.tr,
                          image: Images.deleteAccountIcon,
                          divider: false,
                          onPressed: () {
                            Get.dialog(CustomDialogBox(title: 'delete_accounts'.tr
                              , description: 'remove_information'.tr, onPressed: () {  }, image: Images.deleteAccountImage,
                            ));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
