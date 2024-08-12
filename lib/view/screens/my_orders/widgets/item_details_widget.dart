import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class ItemDetailWidget extends StatelessWidget {
  const ItemDetailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        child: Row(
          children: [
            ClipRect(
              child: Image.asset(Images.categoryPng,height: 75,width: 100,),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width * 0.6,
                  child:
                  Text("Kellogg’s Muesli Fruit Nut & Seeds 750g | 12-in-1 Breakfast cerials",style: interMedium.copyWith(
                      color: Theme.of(context).disabledColor,fontSize: 12
                  ),),
                ),
                Text("Fruits & nut",style: interMedium.copyWith(
                    color: Theme.of(context).hintColor,fontSize: 10
                ),),
                Row(
                  children: [
                    Text("Tk 765",style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor,fontSize: 12
                    ),),
                    SizedBox(width: Get.width * 0.22,),
                    Text("${"quantity".tr} : 2",style: interSemiBold.copyWith(
                        color: Theme.of(context).hintColor,fontSize: 16
                    ),),

                  ],
                )


              ],
            )
          ],
        ),
      ),
    );
  }
}
