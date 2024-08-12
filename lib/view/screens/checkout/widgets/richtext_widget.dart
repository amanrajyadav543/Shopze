import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class RichTextWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const RichTextWidget({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return                             RichText(text: TextSpan(
        style: interRegular.copyWith(
            color: Theme.of(context).hintColor,
            fontSize: 14
        ),
        text: '$title' + " : ",
        children: [
          TextSpan(
              style: interRegular.copyWith(
                  color: Theme.of(context).disabledColor,
                  fontSize: 14
              ),
              text: subtitle
          )
        ]
    ));

  }
}
