import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/category_controller.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';

class CategoryWidget extends StatefulWidget {
  final  String? categoryName;
  final String?  categoryImage;
  const CategoryWidget({super.key,  this.categoryName,  this.categoryImage});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      width: 90,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRect(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 1,
                    ),
                  ),
                  child: Image.network(
                    "${widget.categoryImage}",
                    height: 86,
                    width: 86,
                    fit: BoxFit.cover,
                  )),
            ),
            Text(
            "${ widget.categoryName}",
              textAlign: TextAlign.center,
              style: interMedium.copyWith(
                  color: Theme.of(context).disabledColor, fontSize: 12),
            )
          ],
        )

    );
  }
}
