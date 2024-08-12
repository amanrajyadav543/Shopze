import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class PaymentWidget extends StatefulWidget {
  final String title;
  final String image;
  final Widget widget;
  const PaymentWidget({super.key, required this.title, required this.image, required this.widget});

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
  @override
  Widget build(BuildContext context) {
    return                 Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 4),
                blurRadius: 4
            )
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(widget.image,height: 36,width: 36,),
                SizedBox(width: 15,),
                Text(widget.title.tr,style: interMedium.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: 16
                ),),

              ],
            ),
            widget.widget,

          ],
        ),
      ),
    );

  }
}
