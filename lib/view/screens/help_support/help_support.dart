import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'help_support'.tr,
      ),
      body: CustomGradient(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
               Center(child: Image.asset(Images.helpSupportPng,height: 90,width: 280,)),
              SizedBox(height: 20,),
              Text('contact_us'.tr,style: interMedium.copyWith(
                  color: Theme.of(context).disabledColor,
                  fontSize: 18
              ),),
              SizedBox(height: 20,),
              Text('send_mail'.tr,style: interRegular.copyWith(
                  color: Theme.of(context).hintColor,
                  fontSize: 14
              ),),
              Text('support.shopze@blitz-sol.com'.tr,style: interMedium.copyWith(
                  color: Theme.of(context).disabledColor,
                  fontSize: 16
              ),),
              SizedBox(height: 20,),
              Text('typically_the'.tr,style: interRegular.copyWith(
                  color: Theme.of(context).hintColor,
                  fontSize: 14
              ),),
              SizedBox(height: 10,),
              Text('contact_phone'.tr,style: interMedium.copyWith(
                  color: Theme.of(context).disabledColor,
                  fontSize: 16
              ),),              SizedBox(height: 10,),

              Text('care_number'.tr,style: interMedium.copyWith(
                  color: Theme.of(context).disabledColor,
                  fontSize: 12
              ),),
              SizedBox(height: 10,),

              Text('++880 88287180'.tr,style: interMedium.copyWith(
                  color: Theme.of(context).disabledColor,
                  fontSize: 16
              ),),
              SizedBox(height: 10,),

              Text('talk_with'.tr,style: interMedium.copyWith(
                  color: Theme.of(context).disabledColor,
                  fontSize: 14
              ),),
              SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(child : GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(Images.emailIcon,height: 24,width: 24,),
                          SizedBox(width: 10,),
                          Text('email'.tr,style: interSemiBold.copyWith(
                            fontSize: 18,color: Theme.of(context).errorColor
                          ),)
                        ],
                      ),
                    ),
                  )),
                  SizedBox(width: 15,),
                  Expanded(child : GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorLight,
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(Images.helpCallPng,height: 24,width: 24,),
                          SizedBox(width: 10,),
                          Text('call'.tr,style: interSemiBold.copyWith(
                            fontSize: 18,color: Theme.of(context).errorColor
                          ),)
                        ],
                      ),
                    ),
                  )),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
