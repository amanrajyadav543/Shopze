import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class CustomSeeAllButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const CustomSeeAllButton({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: interSemiBold.copyWith(
            color: Theme.of(context).disabledColor,
            fontSize: 16
          ),),
          GestureDetector(
            onTap: onPressed,
            child: Text("see_all".tr,style: interSemiBold.copyWith(
              color: Theme.of(context).primaryColorDark,
              fontSize: 14
            ),),
          ),
        ],
      ),
    );
  }
}
