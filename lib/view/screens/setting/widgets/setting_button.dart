import 'package:flutter/material.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class SettingButtons extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onPressed;
  final bool divider ;
  final bool notification ;
  const SettingButtons({super.key, required this.title, required this.image, required this.onPressed,  this.divider = true,  this.notification = false});

  @override
  Widget build(BuildContext context) {
    return                         GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.only(top: 15,left: 15,right: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(image,height: 25,width: 25,),
                      SizedBox(width: 10,),
                      Text(
                        title,
                        style: interRegular.copyWith(
                            color: Theme.of(context).disabledColor,
                            fontSize: 16),
                      ),

                    ],
                  ),
                  notification ? Switch(value: true, onChanged: (index){

                  }) : SizedBox()


                ],
              ),
              SizedBox(height: 5,),
              divider ? Divider(color: Theme.of(context).hintColor,endIndent: 15,indent: 0,thickness: 1.5,) : SizedBox(),
              divider ? SizedBox() : SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    )
    ;
  }
}
