import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/cart_controller.dart';
import 'package:shopzy_grocery_user/controller/category_controller.dart';
import 'package:shopzy_grocery_user/data/model/response/ProductsBySubcategory_model.dart';
import 'package:shopzy_grocery_user/data/model/response/cart_model.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_appbar.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_image.dart';
import 'package:shopzy_grocery_user/view/base/custom_loader.dart';
import 'package:shopzy_grocery_user/view/screens/cart/cart_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int? productId;

  const ProductDetailsScreen({super.key, this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedRadio = 1;
  bool description = false;
  bool reviews = false;

  double calculateDiscountedPrice(
      double actualPrice, double discountPercentage) {
    return actualPrice - (actualPrice * discountPercentage / 100);
  }

  @override
  void initState() {
    super.initState();
    Get.find<CategoryController>().getProductDetails(0, widget.productId!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'product_details'.tr,
          cart: true,
        ),
        body: GetBuilder<CategoryController>(builder: (categoryController) {

          return categoryController.productDetails != null
              ? Column(
                  children: [
                    Stack(
                      children: [
                        ClipRect(
                            child: CustomImage(
                          image:
                              '${categoryController.productDetails?.imageUrl}',
                          height: 250,
                          fit: BoxFit.cover,
                        )),
                        Positioned(
                          right: 5,
                          top: 20,
                          child: Image.asset(
                            Images.emptyHeartPng,
                            height: 36,
                            width: 36,
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 20,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " ${categoryController.productDetails?.name}",
                                  style: interMedium.copyWith(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Tk ${categoryController.productDetails!.price}",
                                      style: interSemiBold.copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.red,
                                        decorationThickness: 1,
                                        color: Colors.red,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "Tk ${calculateDiscountedPrice(double.parse("${categoryController.productDetails!.price}"), double.parse("${categoryController.productDetails!.discount}"))}",
                                      style: interSemiBold.copyWith(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Container(
                                      height: 18,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${"save".tr} ${categoryController.productDetails!.discount} %",
                                          style: interMedium.copyWith(
                                            color: Theme.of(context).cardColor,
                                            fontSize: 8,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          Images.starPng,
                                          height: 26,
                                          width: 26,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "4.8",
                                          style: interSemiBold.copyWith(
                                            color:
                                                Theme.of(context).disabledColor,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "flavour_name".tr,
                                  style: interSemiBold.copyWith(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor: Theme.of(context)
                                              .primaryColorDark,
                                          value: 1,
                                          groupValue: selectedRadio,
                                          onChanged: (index) {
                                            setState(() {
                                              selectedRadio = index!;
                                            });
                                          },
                                        ),
                                        Text(
                                          "Fruit & Nut",
                                          style: interMedium.copyWith(
                                            color: selectedRadio == 1
                                                ? Theme.of(context)
                                                    .primaryColorLight
                                                : Theme.of(context).hintColor,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          activeColor: Theme.of(context)
                                              .primaryColorDark,
                                          value: 2,
                                          groupValue: selectedRadio,
                                          onChanged: (index) {
                                            setState(() {
                                              selectedRadio = index!;
                                            });
                                          },
                                        ),
                                        Text(
                                          "Nuts Delight",
                                          style: interMedium.copyWith(
                                            color: selectedRadio == 2
                                                ? Theme.of(context)
                                                    .primaryColorLight
                                                : Theme.of(context).hintColor,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Theme.of(context).hintColor,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "description".tr,
                                      style: interSemiBold.copyWith(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        fontSize: 14,
                                      ),
                                    ),
                                    description
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                description = false;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.keyboard_arrow_up,
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                            ),
                                          )
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                description = true;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                            ),
                                          ),
                                  ],
                                ),
                                Text(
                                  "about_this".tr,
                                  style: interMedium.copyWith(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${categoryController.productDetails!.description}",
                                  style: interRegular.copyWith(
                                    color: Theme.of(context).disabledColor,
                                    fontSize: 14,
                                  ),
                                ),
                                description
                                    ? Column(
                                        children: [
                                          Text(
                                            "${categoryController.productDetails!.description}",
                                            style: interRegular.copyWith(
                                              color: Theme.of(context)
                                                  .disabledColor,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  color: Theme.of(context).hintColor,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "reviews".tr,
                                      style: interSemiBold.copyWith(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                        fontSize: 14,
                                      ),
                                    ),
                                    reviews
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                reviews = false;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.keyboard_arrow_up,
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                            ),
                                          )
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                reviews = true;
                                              });
                                            },
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Theme.of(context)
                                                  .primaryColorLight,
                                            ),
                                          ),
                                  ],
                                ),
                                reviews
                                    ? SizedBox(
                                        height: 300,
                                        child: ListView.builder(
                                          itemCount:
                                              categoryController.getProReview !=
                                                      null
                                                  ? categoryController
                                                      .getProReview!.length
                                                  : 1,
                                          // Set the number of items in the ListView to 1
                                          itemBuilder: (context, index) {
                                            return categoryController
                                                        .getProReview !=
                                                    null
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Julien Hemen".tr,
                                                        style: interMedium
                                                            .copyWith(
                                                          color: Theme.of(
                                                                  context)
                                                              .disabledColor,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      RatingBar.builder(
                                                        initialRating: double.parse(
                                                            categoryController
                                                                .getProReview![
                                                                    index]
                                                                .rating as String),
                                                        minRating: 1,
                                                        itemSize: 20,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    4.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          size: 5,
                                                          color: Colors.amber,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {},
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        ".About this item Nourishing & Tasty Breakfast Cereal – Say Hi to a delightful POWER BREAKFAST, filled with goodness of 12 – multigrain, fruit, nut & super seeds, all in 1. This muesli breakfast will help you kick-start your mornings. All in all, it is a nourishing and tasty meal that will get you ready to seize your action-packed day.",
                                                        style: interRegular
                                                            .copyWith(
                                                          color: Theme.of(
                                                                  context)
                                                              .disabledColor,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  )
                                                : const Center(
                                                    child: Text(
                                                    "No Reviews",
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ));
                                          },
                                        ),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .primaryColorLight)),
                                child: Center(
                                    child: Icon(Icons.minimize,
                                        color: Theme.of(context)
                                            .primaryColorLight)),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .background),
                                child: Center(
                                    child: Text(
                                  "1",
                                  style: interSemiBold.copyWith(
                                      color: Theme.of(context).disabledColor),
                                )),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Theme.of(context)
                                            .primaryColorLight)),
                                child: Center(
                                    child: Icon(Icons.add,
                                        color: Theme.of(context)
                                            .primaryColorLight)),
                              ),
                            ],
                          )),

                          Expanded(child:  GetBuilder<CategoryController>(builder: (categoryController){
                            //if(categoryController.productDetails != null)
                            CartModel cartModel = CartModel(
                                double.parse("${categoryController.productDetails!.price}"),
                                double.parse("${categoryController.productDetails!.discount}"),
                                20,
                                1,
                                null
                            );
                            return CustomButton(
                              title: "add_to_cart".tr,
                              onPressed: () {
                                //  Get.to(const CartScreen());

                                Get.find<CartController>().addToCart(cartModel, null);
                              },
                              radius: 10,
                            );
                          },)
                            )
                        ],
                      ),
                    )
                  ],
                )
              : const CustomLoader();
        }));
  }
}

//
// CartModel cartModel = CartModel(
//     categoryController.productDetails!.price
//     as double?,
//     categoryController.productDetails!.discount
//     as double?,
//     20,
//     1,
//     categoryController.productDetails
//     as Product?);
