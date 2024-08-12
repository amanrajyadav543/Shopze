import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class AddressWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final void Function() onpress;
  const AddressWidget({super.key, required this.title, required this.subtitle, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: const EdgeInsets.only(top: 15),
      // height: 70,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Theme.of(context).hintColor,width: 0.5)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title.tr,style: interMedium.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: 16
                ),),
                const SizedBox(height: 6,),
                Row(
                  children: [
                    Image.asset(Images.goggleMapPng,height: 15,width: 15,),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width: Get.width * 0.71,
                      child: Text(subtitle.tr,style: interMedium.copyWith(
                          color: Theme.of(context).disabledColor,
                          fontSize: 12
                      ),),
                    ),


                  ],
                )
              ],
            ),
            InkWell(onTap:onpress,child: Image.asset(Images.deleteAddressPng,height: 30,width: 30,))
          ],
        ),
      ),
    );

  }
}


