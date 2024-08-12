import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/screens/bottom_navigation/bottom_navigation.dart';
import 'package:shopzy_grocery_user/view/screens/home_screen/home_screen.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 40,),
                  Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.paddingSizeSMALL),
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        border: Border.all(color: Theme.of(context).disabledColor),
                        borderRadius:
                        BorderRadius.circular(Dimensions.radiusDefault)),
                    child: Row(children: [
                      Icon(Icons.location_on,
                          size: 25, color: Theme.of(context).hintColor),
                      const SizedBox(width: Dimensions.paddingSizeExtraSmall),
                      Expanded(
                        child: Text(
                          'WEGP+827, Subhash Nagar, jwalapur...',
                          style: interMedium.copyWith(
                              fontSize: Dimensions.fontSizeExtraSmall),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: Dimensions.paddingSizeSMALL),
                      Icon(Icons.search,
                          size: 25,
                          color: Theme.of(context).textTheme.bodyLarge!.color),
                    ]),
                  ),
                  SizedBox(height: 40,),
                  CustomButton(title: "pick_location".tr, onPressed: (){
                    Get.to(BottomNavigationBarScreen());
                  },radius: 10,),
                ],
              ),

            ],
          )),
      ),
    );
  }
}
