import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget  {
  final String title;
  final bool cart;
  final bool backButton;
  final bool personSupport;
  const CustomAppBar({super.key, required this.title,  this.cart = false,  this.backButton = true,  this.personSupport = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 5,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: interSemiBold.copyWith(
            fontSize: Dimensions.fontSizeLarge,
            color: Theme.of(context).disabledColor),
      ),
      leading: backButton ? IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 25,
            color: Theme.of(context).disabledColor,
          )) : SizedBox(),
      actions: [
        cart ?   Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: (){},
            child: Image.asset(Images.cartPng,height: 35,width: 35,)
          ),
        ) : SizedBox.shrink(),
       personSupport ? Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
              onTap: (){},
              child: Image.asset(Images.personSupportPng,height: 35,width: 35,)
          ),
        ) : SizedBox(),
      ],
    );
  }

  @override
  Size get preferredSize => Size(Get.width, 50);
}