import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/screens/bottom_navigation/bottom_navigation.dart';

class PaymentCompletedScreen extends StatelessWidget {
  const PaymentCompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: Get.height  * 0.15,),
             Center(
               child:
               Text("successfully_placed".tr,
                 textAlign: TextAlign.center,
                 style: interMedium.copyWith(
                 color: Theme.of(context).cardColor,
                 fontSize: 28
               ),),
             ),
              SizedBox(height: 20,),
              Text("order_placed".tr,
                textAlign: TextAlign.center,
                style: interMedium.copyWith(
                  color: Theme.of(context).cardColor,
                  fontSize: 14
              ),),
              Image.asset(Images.orderCompletedPng,height: 238,width: 170,),
              SizedBox(height: 60,),
              CustomButton(title: "back_to_home".tr,radius: 10, onPressed: (){
                Get.to(BottomNavigationBarScreen());
              })

            ],
          ),
        ),
      ),
    );
  }
}
