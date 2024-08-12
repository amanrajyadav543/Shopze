import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';
import 'package:shopzy_grocery_user/view/screens/my_orders/widgets/delivery_men_widget.dart';
import 'package:shopzy_grocery_user/view/screens/my_orders/widgets/order_placed_widget.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'order_tracking'.tr,
      ),
      body: CustomGradient(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DeliveryMenWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "order_id".tr + " : ",
                    style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor, fontSize: 16),
                  ),
                  Text(
                    "ORD6218731262".tr,
                    style: interMedium.copyWith(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "delivery_pin".tr + " : ",
                    style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor, fontSize: 16),
                  ),
                  Text(
                    "ORD6218731262".tr,
                    style: interMedium.copyWith(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "This unique delivery code is what you'll provide to your delivery partner upon receiving your items."
                        .tr ,style: interMedium.copyWith(
                height: 1.50,
                    color: Theme.of(context).hintColor, fontSize: 11),
              ),
              SizedBox(
                height: 30,
              ),
              OrderPlacedWidget(
                title: 'order_pl'.tr,
                subtitle: 'successfully_placed'.tr,
                image: Images.orderPlacedIcon,
                time: '12:29 PM',
              ),
              OrderPlacedWidget(
                title: 'order_confirmed'.tr,
                subtitle: 'successfully_placed_confirm'.tr,
                image: Images.orderConfirmedIcon,
                time: '12:29 PM',
              ),
              OrderPlacedWidget(
                title: 'order_dispatched'.tr,
                subtitle: 'successfully_placed_dispatched'.tr,
                image: Images.orderDispatchedIcon,
                time: '12:29 PM',
              ),
              OrderPlacedWidget(
                title: 'handover'.tr,
                subtitle: 'successfully_placed_handover'.tr,
                image: Images.handoverImage,
                time: '12:29 PM',
              ),
              OrderPlacedWidget(
                onTheWay : true,
                title: 'on_the_way'.tr,
                subtitle: 'arrived_to_you'.tr,
                image: Images.onTheWayIcon,
                time: '12:29 PM',
              ),
              SizedBox(height: 40,),
              CustomButton(title: "view_on_map".tr, onPressed: (){},radius: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
