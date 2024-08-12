import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';
import 'package:shopzy_grocery_user/view/screens/my_orders/order_trackscreen.dart';
import 'package:shopzy_grocery_user/view/screens/my_orders/widgets/item_details_widget.dart';
import 'package:shopzy_grocery_user/view/screens/review/review.dart';

class OrderDetailsScreen extends StatelessWidget {
  final bool previousOrder;
  const OrderDetailsScreen({super.key,  this.previousOrder = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'order_details'.tr,
      ),
      body: CustomGradient(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("order_status".tr,style: interMedium.copyWith(
                              color: Theme.of(context).disabledColor,
                              fontSize: 16
                          ),),
                          Text("confirmed".tr,style: interMedium.copyWith(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16
                          ),),

                        ],
                      ),
                      const SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("expected_delivery".tr,style: interMedium.copyWith(
                              color: Theme.of(context).disabledColor,
                              fontSize: 16
                          ),),
                          Text("20 Jul 2024 , 04:34 PM".tr,style: interMedium.copyWith(
                              color: Theme.of(context).primaryColorLight,
                              fontSize: 14
                          ),),

                        ],
                      ),
                      const SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: Theme.of(context).disabledColor,width: 0.05),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 4),
                            blurRadius: 4
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("item_details".tr,style: interMedium.copyWith(
                                color: Theme.of(context).disabledColor,
                                fontSize: 16
                            ),),
                            Divider(color: Theme.of(context).hintColor,),
                            const SizedBox(height: 10,),
                            const ItemDetailWidget(),
                            const ItemDetailWidget(),
                          ],
                        ),
                      ),
                    ),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Theme.of(context).disabledColor,width: 0.05),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 4),
                                  blurRadius: 4
                              )
                            ]
                        ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("order_details".tr,style: interMedium.copyWith(
                                color: Theme.of(context).disabledColor,
                                fontSize: 16
                            ),),
                            Divider(color: Theme.of(context).hintColor,),
                            Text("${"order_id".tr} : ",style: interMedium.copyWith(
                                color: Theme.of(context).disabledColor,
                                fontSize: 14
                            ),),
                            Text("ORD6218731262".tr,style: interMedium.copyWith(
                                color: Theme.of(context).hintColor,
                                fontSize: 13
                            ),),
                            const SizedBox(height: 10,),
                            Text("payment_mode".tr,style: interMedium.copyWith(
                                color: Theme.of(context).disabledColor,
                                fontSize: 14
                            ),),
                            Text("cod".tr,style: interMedium.copyWith(
                                color: Theme.of(context).hintColor,
                                fontSize: 13
                            ),),
                            const SizedBox(height: 10,),
                            Text("order_for".tr,style: interMedium.copyWith(
                                color: Theme.of(context).disabledColor,
                                fontSize: 14
                            ),),
                            Text("MySelf , Eric , +880 287180128".tr,style: interMedium.copyWith(
                                color: Theme.of(context).hintColor,
                                fontSize: 13
                            ),),
                            const SizedBox(height: 10,),
                            Text("deliver".tr,style: interMedium.copyWith(
                                color: Theme.of(context).disabledColor,
                                fontSize: 14
                            ),),
                            Text("Floor 2nd, Dn, st, Q9G7 + H4F, Mirpur Road, Dhaka, Bangladesh".tr,style: interMedium.copyWith(
                                color: Theme.of(context).hintColor,
                                fontSize: 13
                            ),),
                            const SizedBox(height: 10,),
                            Text("order_place".tr,style: interMedium.copyWith(
                                color: Theme.of(context).disabledColor,
                                fontSize: 14
                            ),),
                            Text("20 Jul 2024 , 02:26 PM".tr,style: interMedium.copyWith(
                                color: Theme.of(context).hintColor,
                                fontSize: 13
                            ),),




                          ],
                        ),
                      ),
                      ),
                      const SizedBox(height: 20,),
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            border: Border.all(color: Theme.of(context).disabledColor,width: 0.05),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 4),
                                  blurRadius: 4
                              )
                            ]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("billing_details".tr,style: interMedium.copyWith(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 16
                              ),),
                              Divider(color: Theme.of(context).hintColor,),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("items_price".tr,style: interMedium.copyWith(
                                      color: Theme.of(context).disabledColor,
                                      fontSize: 14
                                  ),),
                                  Text("TK 75266".tr,style: interMedium.copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 14
                                  ),),


                                ],
                              ),
                              const SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("delivery_charge".tr,style: interMedium.copyWith(
                                      color: Theme.of(context).disabledColor,
                                      fontSize: 14
                                  ),),
                                  Text("TK 75266".tr,style: interMedium.copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 14
                                  ),),


                                ],
                              ),
                              const SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("coupon_discount".tr,style: interMedium.copyWith(
                                      color: Theme.of(context).disabledColor,
                                      fontSize: 14
                                  ),),
                                  Text("TK 75266".tr,style: interMedium.copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 14
                                  ),),


                                ],
                              ),
                              const SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("wallet_discount".tr,style: interMedium.copyWith(
                                      color: Theme.of(context).disabledColor,
                                      fontSize: 14
                                  ),),
                                  Text("TK 75266".tr,style: interMedium.copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 14
                                  ),),


                                ],
                              ),
                              Divider(color: Theme.of(context).hintColor,),
                              const SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("total_amount".tr,style: interSemiBold.copyWith(
                                      color: Theme.of(context).primaryColorLight,
                                      fontSize: 16
                                  ),),
                                  Text("TK 75266".tr,style: interSemiBold.copyWith(
                                      color: Theme.of(context).primaryColorLight,
                                      fontSize: 16
                                  ),),


                                ],
                              ),

                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 50,),
                    ],
                  ),
                ),
              ),
              previousOrder ?  Padding(
                padding: const EdgeInsets.only(right: 10,bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: TextButton(
                      onPressed: (){
                        Get.to(const ReviewScreen());
                      },
                      child:
                      Text('submit_review'.tr,style: interSemiBold.copyWith(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 18
                      ),),
                    )),
                    Expanded(child:              CustomButton(title: 'repeat_order'.tr, onPressed: (){
                      Get.to(const OrderTrackingScreen());
                    },radius: 10,fontSize: 16,))
                  ],
                ),
              ) :CustomButton(title: 'track_order'.tr, onPressed: (){
                Get.to(const OrderTrackingScreen());
              },radius: 10,fontSize: 16,)
            ],
          ),
        ),
      ),
    );
  }
}

