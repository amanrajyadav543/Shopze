import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';
import 'package:shopzy_grocery_user/view/screens/notification/widgets/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'notification'.tr,
      ),
      body: CustomGradient(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text("28 Oct 2014",style: interMedium.copyWith(
                  color: Theme.of(context).hintColor,fontSize: 14
                ) ,),
              ),
              NotificationWidget(),
              NotificationWidget(),
              NotificationWidget(),
              NotificationWidget(),
              NotificationWidget(),
              NotificationWidget(),
              NotificationWidget(),

            ],
          ),
        ),
      ),
    );
  }
}
