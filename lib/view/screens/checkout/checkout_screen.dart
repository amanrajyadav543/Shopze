import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_textfield.dart';
import 'package:shopzy_grocery_user/view/screens/checkout/widgets/richtext_widget.dart';
import 'package:shopzy_grocery_user/view/screens/payment/payment_screen.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int selectedRadio = 1;
  int selectedDelivery = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "checkout".tr,
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                Text("delivered_for".tr,style: interMedium.copyWith(
                    color: Theme.of(context).disabledColor,
                    fontSize: 18
                ),),
                  Row(
                    children: [
                      Row(
                        children: [
                          Radio(
                            activeColor: Theme.of(context).primaryColorDark,
                            value: 1,
                            groupValue: selectedRadio,
                            onChanged: (index) {
                              setState(() {
                                selectedRadio = index!;
                              });
                            },
                          ),
                          Text(
                            "for_myself".tr,
                            style: interMedium.copyWith(
                              color: selectedRadio == 1
                                  ? Theme.of(context).primaryColorLight
                                  : Theme.of(context).hintColor,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: [
                          Radio(
                            activeColor: Theme.of(context).primaryColorDark,
                            value: 2,
                            groupValue: selectedRadio,
                            onChanged: (index) {
                              setState(() {
                                selectedRadio = index!;
                              });
                            },
                          ),
                          Text(
                            "other".tr,
                            style: interMedium.copyWith(
                              color: selectedRadio == 2
                                  ? Theme.of(context).primaryColorLight
                                  : Theme.of(context).hintColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("select_delivery_address".tr,style: interMedium.copyWith(
                          color: Theme.of(context).disabledColor,
                          fontSize: 16
                      ),),
                      Text("add_new".tr,style: interMedium.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 16
                      ),),
                    ],
                  ),
                  SizedBox(height: 20,),
               selectedRadio == 2 ?    Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
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
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(child: CustomTextField(title: '',hintText: 'enter_sender_name'.tr,radius: 10,titleRequired: true,)),
                              SizedBox(width: 15,),
                              Expanded(child: CustomTextField(title: '',hintText: 'enter_sender_number'.tr,radius: 10,titleRequired: true,)),
                            ],
                          ),
                          CustomTextField(title: '',hintText: "${'receipt_note'.tr} : ",radius: 10,titleRequired: true,height: 100,maxLines: 5,)
                        ],
                      ),
                    ),

                  ) : SizedBox(),
                  SizedBox(height: 20,),
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
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
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(Images.deliveryVehiclePng,height: 28,width: 28,),
                                   SizedBox(width: 15,),
                                  Text("delivery_information".tr,style: interMedium.copyWith(
                                      color: Theme.of(context).disabledColor,
                                      fontSize: 16
                                  ),),
                                ],
                              ),
                              Image.asset(Images.editAddressPng,height: 26,width: 26,),
              
                            ],
                          ),
                          SizedBox(height: 15,),
                          Container(
                            height: 70,
                            decoration: BoxDecoration(
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
                                      Text("home".tr,style: interMedium.copyWith(
                                        color: Theme.of(context).disabledColor,
                                        fontSize: 16
                                      ),),
                                      SizedBox(height: 6,),
                                      Row(
                                        children: [
                                          Image.asset(Images.goggleMapPng,height: 15,width: 15,),
                                          SizedBox(width: 10,),
                                          Text("Q9G7 + H4F, Mirpur Road, Dhaka, Bangladesh".tr,style: interRegular.copyWith(
                                              color: Theme.of(context).disabledColor,
                                              fontSize: 10
                                          ),),
              
              
                                        ],
                                      )
                                    ],
                                  ),
                                  Icon(Icons.keyboard_arrow_down_outlined,size: 30,)
                                ],
                              ),
                            ),
                          ),
              
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
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
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("delivery_time".tr,style: interMedium.copyWith(
                              color: Theme.of(context).disabledColor,
                              fontSize: 16
                          ),),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Theme.of(context).primaryColorDark,
                                    value: 1,
                                    groupValue: selectedDelivery,
                                    onChanged: (index) {
                                      setState(() {
                                        selectedDelivery = index!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "quick_delivery".tr,
                                    style: interRegular.copyWith(
                                      color: selectedDelivery == 1
                                          ? Theme.of(context).primaryColorLight
                                          : Theme.of(context).hintColor,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Theme.of(context).primaryColorDark,
                                    value: 2,
                                    groupValue: selectedDelivery,
                                    onChanged: (index) {
                                      setState(() {
                                        selectedDelivery = index!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "schedule_delivery".tr,
                                    style: interRegular.copyWith(
                                      color: selectedDelivery == 2
                                          ? Theme.of(context).primaryColorLight
                                          : Theme.of(context).hintColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Theme.of(context).primaryColorDark,
                                    value: 1,
                                    groupValue: selectedDelivery,
                                    onChanged: (index) {
                                      setState(() {
                                        selectedDelivery = index!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "10 a.m to 12 p.m".tr,
                                    style: interRegular.copyWith(
                                      fontSize: 12,
                                      color: selectedDelivery == 1
                                          ? Theme.of(context).primaryColorLight
                                          : Theme.of(context).hintColor,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    activeColor: Theme.of(context).primaryColorDark,
                                    value: 2,
                                    groupValue: selectedDelivery,
                                    onChanged: (index) {
                                      setState(() {
                                        selectedDelivery = index!;
                                      });
                                    },
                                  ),
                                  Text(
                                    "10 a.m to 12 p.m".tr,
                                    style: interRegular.copyWith(
                                      fontSize: 12,
                                      color: selectedDelivery == 2
                                          ? Theme.of(context).primaryColorLight
                                          : Theme.of(context).hintColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
              
              
              
              
              
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
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
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("additional_delivery_note".tr,style: interMedium.copyWith(
                              color: Theme.of(context).disabledColor,
                              fontSize: 16
                          ),),
                          CustomTextField(title: '', hintText: 'Ex:- Delivery to the front door',height: 100,maxLines: 5,radius: 10,),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("subtotal".tr,style: interMedium.copyWith(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 16
                              ),),
                              Text("TK 765".tr,style: interMedium.copyWith(
                                  color: Theme.of(context).disabledColor,
                                  fontSize: 16
                              ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("delivery_charges".tr,style: interMedium.copyWith(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 16
                              ),),
                              Text("TK 765".tr,style: interMedium.copyWith(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 16
                              ),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(),
              
              
                        ],
                      ),
                    ),
                  )
              
              
              
              
              
              
              
                ],),
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
                Expanded(child: CustomButton(title: "payment".tr,onPressed: (){
                  Get.to(PaymentScreen());
                },radius: 10,))
              ],
            ),
          )


        ],
      ),
    );
  }
}
