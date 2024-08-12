import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
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
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                ClipRect(
                  child: Image.asset(Images.categoryPng,width: 120,),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.55,
                      child: Text('Kellogg’s Muesli Fruit Nut & Seeds 750g | 12-in-1 Breakfast cerials'.tr,style: interMedium.copyWith(
                          color: Theme.of(context).disabledColor,
                          fontSize: 12
                      ),),
                    ),
                    Text('Tk 765'.tr,style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor,
                        fontSize: 14
                    ),),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      itemSize: 25,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        size: 5,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),



                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Theme.of(context).hintColor,width: 0.5)
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                    hintText: 'please_your_review'.tr,
                    hintStyle: interRegular.copyWith(
                        color: Theme.of(context).hintColor
                    )
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
