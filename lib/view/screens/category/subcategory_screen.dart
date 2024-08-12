

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/category_controller.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_loader.dart';
import 'package:shopzy_grocery_user/view/screens/category/widget/item_widget.dart';

class SubCategoryScreen extends StatefulWidget {
  final int? subcategoryId;

  const SubCategoryScreen({super.key, this.subcategoryId});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  @override
  void initState() {
    super.initState();
    Get.find<CategoryController>()
        .getProductBySubCategory(0, widget.subcategoryId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.error,
      appBar: const CustomAppBar(
        title: "milk",
      ),
      body: GetBuilder<CategoryController>(
        builder: (categoryController) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Expanded(
              child: categoryController.productList != null
                  ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: categoryController.productList!.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ItemsWidget(
                    productName:
                    categoryController.productList![index].name,
                    productId:categoryController.productList![index].id ,
                    image_url:
                    categoryController.productList![index].imageUrl,
                    discount:categoryController.productList![index].discount,
                    price: categoryController.productList![index].price,
                  );
                },
              )
                  : const CustomLoader(),
            ),
          );
        },
      ),
    );
  }
}
