import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/coupan_controller.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/screens/cart/widgets/coupon_widget.dart';
import 'package:shopzy_grocery_user/view/screens/cart/widgets/my_cart_item.dart';
import 'package:shopzy_grocery_user/view/screens/checkout/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
@override
void initState(){
  super.initState();
  Get.find<CouponController>().getCouponList();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "my_cart".tr,
        cart: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: GetBuilder<CouponController>(builder: (couponController){
                return Column(
                  children: [
                    const SizedBox(height: 20,),
                    const MyCartItemWidget(),
                    const SizedBox(height: 30,),
                    const CouponWidget(),
                    const SizedBox(height: 10,),
                    InkWell(
                      onTap: () {
                       couponController.couponList!=null?print(couponController.couponList!.length):print("NO DATA");
                      },
                      child: Text("see_coupons".tr,style: interMedium.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 14
                      ),),
                    ),
                    const SizedBox(height: 40,),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            const BoxShadow(
                                color: Colors.black12,
                                offset: Offset(0,4),
                                blurRadius: 4
                            )
                          ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("items_price".tr,style: interMedium.copyWith(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 16
                                ),),
                                Text("TK 765".tr,style: interMedium.copyWith(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 16
                                ),),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("coupon_discount".tr,style: interMedium.copyWith(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 16
                                ),),
                                Text("TK 765".tr,style: interMedium.copyWith(
                                    color: Theme.of(context).hintColor,
                                    fontSize: 16
                                ),),
                              ],
                            ),
                            const SizedBox(height: 10,),
                            const Divider(),


                          ],
                        ),
                      ),
                    )

                  ],
                );
              },),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Text("total_amount".tr,style: interMedium.copyWith(
                         color: Theme.of(context).primaryColorLight,
                         fontSize: 18
                       ),),
                       Text("TK 765".tr,style: interMedium.copyWith(
                         color: Theme.of(context).disabledColor,
                         fontSize: 18
                       ),),
                      ],
                    )),
                Expanded(child: CustomButton(title: "check_out".tr,onPressed: (){
                  Get.to(const CheckOutScreen());
                },radius: 10,))
              ],
            ),
          )

        ],
      ),
    );
  }
}


