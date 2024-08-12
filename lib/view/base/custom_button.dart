
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double fontSize;
  final double height;
  final double radius;
  final bool cancel;
  final bool color;
  final bool trackOrder ;
  const CustomButton(
      {super.key,
        required this.title,
        required this.onPressed,
        this.fontSize = 18,
        this.height = 58,
        this.cancel = false,
        this.radius = 30, this.color = false,  this.trackOrder = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:
      Container(
        height: height,
        decoration: BoxDecoration(
          color: color ? Theme.of(context).primaryColor:Get.theme.primaryColorLight,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal:trackOrder ? 0: Dimensions.paddingSizeSmallExtra),
            child: Text(
              title,
              style: interSemiBold.copyWith(
                  color: cancel ? Get.theme.disabledColor : Get.theme.cardColor,
                  fontSize: fontSize),
            ),
          ),
        ),
      ),
    );
  }
}
