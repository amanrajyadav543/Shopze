import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/order_controller.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_loader.dart';
import 'package:shopzy_grocery_user/view/screens/my_orders/order_details.dart';

class ActiveOrderWidget extends StatelessWidget {
  final bool previousOrder;
  final VoidCallback route;
  final index;
  const ActiveOrderWidget({
    super.key,  this.previousOrder = false, required this.route,required this.index
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderController>(builder: (orderController){
      return orderController.activeOrder !=null? GestureDetector(
        onTap: route,
        child: Container(
          // height:110,
          margin: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border.all(color: Theme.of(context).disabledColor,width: 0.05),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 4),
                    blurRadius: 10
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRect(
                      child: Image.asset(Images.categoryPng,width: 124,height: 93,),
                    ),
                    Container(
                      width: 124,
                      height: 93,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.black.withOpacity(0.5)],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,left: 10,
                      child: Text("2 ${"items".tr}",style: interMedium.copyWith(
                          color: Theme.of(context).errorColor,
                          fontSize: 20
                      ),),
                    )
                  ],
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${"order_id".tr}: #${orderController.activeOrder![index].id}",style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor,
                        fontSize: 16
                    ),),
                    SizedBox(height: 5,),
                    Text("20 jul 2024 , 02:26 PM".tr,style: interMedium.copyWith(
                        color: Theme.of(context).hintColor,
                        fontSize: 13
                    ),),
                    SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("confirmed".tr,style: interMedium.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14
                        ),),
                        SizedBox(width: Get.width * 0.05,),
                        previousOrder  ? SizedBox():  SizedBox(
                          width: 89,
                          child: CustomButton(
                            height: 27,
                            color: true,
                            trackOrder: true,
                            title: 'track_order'.tr, onPressed: (){
                            Get.to(OrderDetailsScreen());
                          },radius: 5,fontSize: 11,),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ):const CustomLoader();
    });
  }
}
