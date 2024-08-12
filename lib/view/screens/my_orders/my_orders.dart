import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_gradient.dart';
import 'package:shopzy_grocery_user/view/screens/my_orders/order_details.dart';
import 'package:shopzy_grocery_user/view/screens/my_orders/widgets/active_order_widget.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with TickerProviderStateMixin {

  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'my_orders'.tr,
      ),
      body: CustomGradient(
        child:
        Column(
          children: [
            SizedBox(height: 10,),
            DefaultTabController(length: tabController.length,
                child: TabBar(
                  controller: tabController,
              indicatorColor: Theme.of(context).primaryColorLight,
              unselectedLabelColor: Get.theme.hintColor,
              labelColor: Get.theme.primaryColorLight,
              // indicator: const BoxDecoration(),
              tabs: [
                Text(
                  "active_orders".tr,
                  style: interMedium.copyWith(
                      fontSize: Dimensions.fontSizeDefault),
                ),
                Text(
                  "previous_order".tr,
                  style: interMedium.copyWith(
                      fontSize: Dimensions.fontSizeDefault),
                ),

              ],
            )),
            SizedBox(height: 20,),
            Expanded(child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                      itemCount: 10,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                  return ActiveOrderWidget(index: index,route:(){
                    Get.to(OrderDetailsScreen());
                  },
                  );
                   }),
                ListView.builder(
                      itemCount: 10,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                  return ActiveOrderWidget(index: index,previousOrder: true, route:(){
                    Get.to(OrderDetailsScreen(previousOrder: true,));
                  },
                      );

                }),

              ],
            ))

          ],
        ),
      ),
    );
  }
}

