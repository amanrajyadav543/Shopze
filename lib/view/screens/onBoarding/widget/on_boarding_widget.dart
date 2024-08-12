import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/dimensions.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class OnBoardingWidget extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  const OnBoardingWidget(
      {super.key,
        required this.image,
        required this.title,
        required this.subtitle});

  @override
  State<OnBoardingWidget> createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
            child: Image.asset(widget.image,height: Get.height * 0.4,width: Get.width * 0.6,)),
        const SizedBox(
          height: 50,
        ),
       Container(
         decoration: BoxDecoration(
           color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
         ),
         child: Padding(
           padding: const EdgeInsets.only(top: 50,left: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               Text(
                 widget.title,
                 style: interSemiBold.copyWith(
                   fontSize: Dimensions.fontSizeExtraLarge,
                   color:  Theme.of(context).disabledColor,
                 ),
               ),
               const SizedBox(
                 height: 20,
               ),
               Text(
                 widget.subtitle,
                 style: interMedium.copyWith(
                     height: 1.50,
                     color:  Theme.of(context).hintColor,
                     fontSize: Dimensions.fontSizeSmall),
               ),
               SizedBox(height: 10,),
             ],
           ),
         ),
       )
      ],
    );
  }
}