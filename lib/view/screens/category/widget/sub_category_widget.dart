import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_image.dart';
import 'package:shopzy_grocery_user/view/screens/category/subcategory_screen.dart';

class SubCategoryWidget extends StatefulWidget {
  final String? image;
  final String? productName;
  final int? productId;
  final VoidCallback? onPressed;

  const SubCategoryWidget(
      {super.key,
      this.image,
      this.productName,
      this.productId, this.onPressed});

  @override
  State<SubCategoryWidget> createState() => _SubCategoryWidgetState();
}

class _SubCategoryWidgetState extends State<SubCategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(SubCategoryScreen(subcategoryId: widget.productId,));
      },
     // onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        width: 75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRect(
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1,
                    ),
                  ),
                  child:

                      CustomImage(
                    image: '${widget.image}',
                    height: 75,
                    width: 75,
                    fit: BoxFit.cover,
                  )),
            ),
            Text(
              "${widget.productName}",
              textAlign: TextAlign.center,
              style: interMedium.copyWith(
                  color: Theme.of(context).disabledColor, fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
