import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';

class CustomDialogBox extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;
  final String image;
  const CustomDialogBox(
      {super.key,
        required this.title,
        required this.description,
        required this.onPressed, required this.image,});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
            color: Get.theme.cardColor,
            borderRadius:
            BorderRadius.circular(Dimensions.paddingSizeSmallExtra)),
        height: 400,
        child: Column(
          children: [
            const SizedBox(
              height: Dimensions.heightExtraLarge,
            ),
            Image.asset(
              image,
              height: 140,
              width: 140,
            ),
            const SizedBox(
              height: Dimensions.paddingSizeSMALL,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: interMedium.copyWith(
                  color: Get.theme.disabledColor,
                  fontSize: Dimensions.fontSizeLarge),
            ),
            const SizedBox(
              height: Dimensions.paddingSizeDefaultSmall,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: interRegular.copyWith(
                    color: Get.theme.hintColor,
                    fontSize: Dimensions.fontSizeExtraSmall),
              ),
            ),
            SizedBox(
              height: Dimensions.heightExtraLarge,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.heightExtraLarge),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(color: Get.theme.primaryColorLight),
                          borderRadius: BorderRadius.circular(Dimensions.paddingSizeSMALL),
                        ),
                        child: Center(
                          child: Text(
                            'cancel'.tr,
                            style: interMedium.copyWith(
                                color: Get.theme.disabledColor, fontSize: 14),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: CustomButton(
                        radius: 10,
                        height: 45,
                        fontSize: 14,
                        title: 'confirm'.tr,
                        onPressed: onPressed,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}