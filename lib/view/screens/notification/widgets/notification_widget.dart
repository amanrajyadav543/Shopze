import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return             Column(
      children: [
        Row(
          children: [
            ClipRect(
              child: Image.asset(Images.categoryPng,width: 60,height: 60,),
            ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Celebrate Navratri",style: interMedium.copyWith(
                    color: Theme.of(context).disabledColor,fontSize: 15
                ),),
                SizedBox(
                  width: Get.width * 0.7,
                  child: Text("Stock up on all your favorite essentials and special treats for Navratri celebrations at unbeatable prices.start shopping and make ...",
                    maxLines : 2 ,textAlign : TextAlign.start,style: interMedium.copyWith(
                        color: Theme.of(context).hintColor,fontSize: 9
                    ),),
                ),
              ],
            )
          ],
        ),
        Divider(color: Theme.of(context).hintColor,)
      ],
    )
    ;
  }
}
