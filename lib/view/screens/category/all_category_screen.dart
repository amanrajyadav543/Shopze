import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/category_controller.dart';
import 'package:shopzy_grocery_user/utils/app_constants.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_loader.dart';
import 'package:shopzy_grocery_user/view/screens/category/widget/category_widget.dart';
import 'package:shopzy_grocery_user/view/screens/category/widget/sub_category_widget.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  AllCategoryScreenState createState() => AllCategoryScreenState();
}

class AllCategoryScreenState extends State<AllCategoryScreen> {
  int? subCategoryId;

  @override
  void initState() {
    super.initState();
    Get.find<CategoryController>().getCategoryList(0);
    Get.find<CategoryController>().getSubCategoryList(0,4);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'all_category'.tr,
        ),
        body: GetBuilder<CategoryController>(
          builder: (categoryController) {
            return categoryController.categoryList != null
                ? categoryController.categoryList!.isNotEmpty
                    ? RefreshIndicator(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex:
                                    2, // Adjust the width ratio of category list
                                child: SizedBox(
                                  width: 90,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        categoryController.categoryList!.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          subCategoryId = categoryController
                                              .categoryList![index].id;
                                          print(subCategoryId);
                                          Get.find<CategoryController>().getSubCategoryList(0, subCategoryId!);
                                          // setState(() {});
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: CategoryWidget(
                                            categoryName: categoryController
                                                .categoryList![index].name,
                                            categoryImage:
                                                '${AppConstants.imageBaseurl}${categoryController.categoryList![index].image}',
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: GetBuilder<CategoryController>(
                                    builder: (categoryController) {
                                  return categoryController.subCategoryData !=null?GridView.builder(
                                    itemCount: categoryController.subCategoryData!.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 1,
                                      mainAxisSpacing: 1,
                                      childAspectRatio: 0.8,
                                    ),
                                    itemBuilder: (context, index) {
                                      return SubCategoryWidget(
                                        image: '${AppConstants.imageBaseurl}${categoryController.subCategoryData![index].image}',
                                        productName: categoryController
                                            .subCategoryData![index].name!,
                                        productId: categoryController.subCategoryData![index].id,
                                      ); // Remove const here
                                    },
                                  ):const CustomLoader();
                                }),
                              ),
                            ],
                          ),
                        ),
                        onRefresh: () async {
                          await categoryController.getCategoryList(0);
                        })
                    : Text("no_category_found".tr)
                : CustomLoader();
          },
        ));
  }

}
