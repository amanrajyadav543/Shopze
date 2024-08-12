import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/screens/payment/payment_completed_screen.dart';
import 'package:shopzy_grocery_user/view/screens/payment/widgets/paymet_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool wallet = false;
  int payment = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'payment_method'.tr,
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "choose_payment".tr,
                    style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PaymentWidget(
                    title: 'Blitz Wallet (TK 50)',
                    image: Images.walletPng,
                    widget: Checkbox(
                      checkColor: Theme.of(context).primaryColorLight,
                        value: wallet,
                        onChanged: (index) {
                          setState(() {
                            wallet = index!;
                          });
                        }),
                  ),
                  Text(
                    "digital_payment".tr,
                    style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor, fontSize: 16),
                  ),
                  PaymentWidget(
                    title: 'razorpay'.tr,
                    image: Images.razorpayImage,
                    widget: Radio(
                        activeColor: Theme.of(context).primaryColorLight,
                        value: 1, groupValue: payment, onChanged: (index){
                      setState(() {
                        payment = index!;
                      });
                    })
                  ),
                  PaymentWidget(
                    title: 'paypal'.tr,
                    image: Images.paypalImage,
                    widget: Radio(
                        activeColor: Theme.of(context).primaryColorLight,
                
                        value: 2, groupValue: payment, onChanged: (index){
                      setState(() {
                        payment = index!;
                      });
                    })
                  ),
                  PaymentWidget(
                    title: 'stripe'.tr,
                    image: Images.stripeImage,
                    widget: Radio(
                        activeColor: Theme.of(context).primaryColorLight,
                
                        value: 3, groupValue: payment, onChanged: (index){
                      setState(() {
                        payment = index!;
                      });
                    })
                  ),
                  PaymentWidget(
                    title: 'paytm'.tr,
                    image: Images.paytmImage,
                    widget: Radio(
                      activeColor: Theme.of(context).primaryColorLight,
                        value: 4, groupValue: payment, onChanged: (index){
                      setState(() {
                        payment = index!;
                      });
                    })
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "pay_on_delivery".tr,
                    style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor, fontSize: 16),
                  ),
                  PaymentWidget(
                      title: 'cod'.tr,
                      image: Images.codImage,
                      widget: Radio(
                          activeColor: Theme.of(context).primaryColorLight,
                          value: 5, groupValue: payment, onChanged: (index){
                        setState(() {
                          payment = index!;
                        });
                      })
                  ),
                  SizedBox(height: 30,),
                  RichText(text: TextSpan(text: "read_agreed".tr,style: interRegular.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: 14,
                  ),children: [
                    TextSpan(text: "privacy_terms".tr,style: interMedium.copyWith(
                      height: 1.75,
                  color: Theme.of(context).primaryColorLight,
                    fontSize: 14,) )
                  ]),),                  SizedBox(height: 30,),







                ],
                            ),
                          ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "total_amount".tr,
                      style: interMedium.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 18),
                    ),
                    Text(
                      "TK 765".tr,
                      style: interMedium.copyWith(
                          color: Theme.of(context).disabledColor, fontSize: 18),
                    ),
                  ],
                )),
                Expanded(
                    child: CustomButton(
                  title: "place_order".tr,
                  fontSize: 16,
                  onPressed: () {
                    Get.to(PaymentCompletedScreen());
                  },
                  radius: 10,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
