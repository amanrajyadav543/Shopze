import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class DeliveryMenWidget extends StatelessWidget {
  const DeliveryMenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 70,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          border: Border.all(color: Theme.of(context).disabledColor,width: 0.05),
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                ClipRect(child: Image.asset(Images.categoryPng,width: 65,height: 65,fit: BoxFit.cover,),),
                SizedBox(width: 15,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Sonu Kumar".tr,style: interSemiBold.copyWith(
                        color: Theme.of(context).disabledColor,
                        fontSize: 16
                    ),),
                    SizedBox(height: 5,),
                    Text("Shopze delivery partner".tr,style: interMedium.copyWith(
                        color: Theme.of(context).hintColor,
                        fontSize: 12
                    ),),

                  ],
                )

              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8,right: 5),
              child: Image.asset(Images.callIcon,height: 50,width: 50,),
            )
          ],
        ),
      ),
    );
  }
}
