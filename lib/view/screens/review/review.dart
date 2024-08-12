import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_dialogbox.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';
import 'package:shopzy_grocery_user/view/screens/review/widgets/review_widget.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'submit_review'.tr,
      ),
      body: CustomGradient(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      ReviewWidget(),
                      ReviewWidget(),
                    ],
                  ),
                ),
              ),
              CustomButton(title: "submit_review".tr,radius: 10, onPressed: (){
                Get.dialog(CustomDialogBox(title: 'are_submit_review'.tr
                  , description: 'feedback_valuable'.tr, onPressed: () {  }, image: Images.logoutImage,
                ));

              })
            ],
          ),
        ),

      ),
    );
  }
}

