import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class OrderPlacedWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  final String time;
  final bool onTheWay;
  const OrderPlacedWidget({super.key, required this.title, required this.subtitle, required this.image, required this.time,  this.onTheWay = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 48,child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(image,height: 34,width: 34,),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor,
                        fontSize: 14
                    ),),
                    Text(subtitle,style: interMedium.copyWith(
                        color: Theme.of(context).hintColor,
                        fontSize: 10
                    ),),

                  ],
                ),
              ],
            ),
            Text(time,style: interMedium.copyWith(
                color: Theme.of(context).disabledColor,
                fontSize: 10
            ),),




          ],
        ),),
        onTheWay ?  SizedBox():Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(Images.borderPng,height: 30,),
        )
      ],
    );
  }
}
