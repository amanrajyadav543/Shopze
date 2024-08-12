import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class MyCartItemWidget extends StatelessWidget {
  const MyCartItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0,4),
                blurRadius: 4
            ),
          ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRect(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Image.asset(Images.categoryPng,height: 120,width : Get.width * 0.31,fit: BoxFit.fitHeight,)
                // CustomImage(
                //   width: 120,
                //   height: 160,
                //   image: '',
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width * 0.5,
                  child: Text("Basics 500 W Nutri Blender with 3 Settings",style: interMedium.copyWith(
                      color: Theme.of(context).disabledColor,
                      fontSize: 12
                  ),),
                ),
                SizedBox(height: 5,),
                Text("Fruits & nut",style: interMedium.copyWith(
                    fontSize: 12,color: Theme.of(context).hintColor
                ),),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text("Tk 845",style: interMedium.copyWith(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: Colors.red,
                            decorationThickness: 1,
                            color: Colors.red,
                            fontSize: 12
                        ),),
                        SizedBox(height: 5,),
                        Text("Tk 765",style: interMedium.copyWith(
                            color: Theme.of(context).disabledColor,
                            fontSize: 14
                        ),),
                      ],
                    ),
                    SizedBox(width: Get.width * 0.1,),
                    Row(
                      children: [
                        Image.asset(Images.deleteIcon,height: 29,width: 29,),
                        SizedBox(width: 5,),
                        Text("1",style: interMedium.copyWith(color: Theme.of(context).disabledColor,fontSize: 25),),
                        SizedBox(width: 5,),
                        Image.asset(Images.addButtonPng,height: 29,width: 29,),
                      ],
                    )
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
