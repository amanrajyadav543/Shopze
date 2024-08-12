// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shopzy_grocery_user/controller/auth_controller.dart';
// import 'package:shopzy_grocery_user/controller/cart_controller.dart';
// import 'package:shopzy_grocery_user/controller/favorite_controller.dart';
// import 'package:shopzy_grocery_user/data/model/response/ProductsBySubcategory_model.dart';
// import 'package:shopzy_grocery_user/data/model/response/cart_model.dart';
// import 'package:shopzy_grocery_user/data/model/response/productDetails_model.dart';
// import 'package:shopzy_grocery_user/helper/calculation.dart';
// import 'package:shopzy_grocery_user/utils/images.dart';
// import 'package:shopzy_grocery_user/utils/styles.dart';
// import 'package:shopzy_grocery_user/view/base/custom_image.dart';
// import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';
// import 'package:shopzy_grocery_user/view/screens/category/product_details.dart';
//
// class ItemsWidget extends StatefulWidget {
//   final ProductDetails productDetails;
//    const ItemsWidget({
//     super.key,
//    required this.productDetails,
//   });
//
//   @override
//   State<ItemsWidget> createState() => _FavouriteItemsWidgetState();
// }
//
// class _FavouriteItemsWidgetState extends State<ItemsWidget> {
//   @override
//   Widget build(BuildContext context) {
//
//     double discountedPrice = Calculation().calculateDiscountedPrice(
//         widget.productDetails.price!,
//         widget.productDetails.discount!,
//         widget.productDetails.discountType);
//     return GestureDetector(
//       onTap: () {
//         Get.to(ProductDetailsScreen(
//           productId: widget.productDetails.id,
//         ));
//       },
//       child: Container(
//         // height: 235,
//         width: 185,
//         decoration: BoxDecoration(
//             color: Theme.of(context).colorScheme.error,
//             borderRadius: BorderRadius.circular(10)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 ClipRect(
//                     child: CustomImage(
//                   image: "${widget.productDetails.imageUrl}",
//                   height: 130,
//                 )),
//                 Positioned(
//                   top: 30,
//                   left: 0,
//                   child: Container(
//                     height: 18,
//                     width: 60,
//                     decoration: BoxDecoration(
//                         color: Theme.of(context).primaryColorDark,
//                         borderRadius: const BorderRadius.only(
//                             topRight: Radius.circular(4),
//                             bottomRight: Radius.circular(4))),
//                     child: Center(
//                       child: Text(
//                         "${"save".tr} ${widget.productDetails.discount} %",
//                         style: interMedium.copyWith(
//                             color: Theme.of(context).cardColor, fontSize: 8),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                     top: 20,
//                     right: 10,
//                     child: GetBuilder<FavoriteController>(
//                       builder: (favoriteController) {
//                         bool isFavrouite =
//                             favoriteController.favProductIdList != null
//                                 ? favoriteController.favProductIdList!
//                                     .contains(widget.productDetails.id)
//                                 : false;
//                         return InkWell(
//                             onTap: () {
//                               if (Get.find<AuthController>().isLoggedIn()) {
//                                 isFavrouite
//                                     ? favoriteController.removeFromFavList(
//                                         widget.productDetails.id!)
//                                     : favoriteController.addToFavList(
//                                         widget.productDetails.id);
//                               } else {
//                                 showCustomSnackBar('you_are_not_logged_in'.tr);
//                               }
//                             },
//                             child: isFavrouite
//                                 ? Image.asset(
//                                     Images.emptyHeartPng,
//                                     width: 28,
//                                     height: 28,
//                                   )
//                                 : Image.asset(
//                                     Images.redHeart,
//                                     width: 28,
//                                     height: 28,
//                                     color: Colors.red,
//                                   ));
//                       },
//                     ))
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "${widget.productDetails.name}",
//                     style: interMedium.copyWith(
//                         color: Theme.of(context).disabledColor, fontSize: 12),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     "Tk ${widget.productDetails.price}",
//                     style: interMedium.copyWith(
//                         decoration: TextDecoration.lineThrough,
//                         decorationColor: Colors.red,
//                         decorationThickness: 1,
//                         color: Colors.red,
//                         fontSize: 12),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Tk $discountedPrice",
//                         style: interMedium.copyWith(
//                             color: Theme.of(context).disabledColor,
//                             fontSize: 14),
//                       ),
//                       GetBuilder<CartController>(builder: (cartController) {
//                         CartModel cartModel = CartModel(
//                             widget.productDetails.price,
//                             widget.productDetails.discount,
//                             discountedPrice,
//                             1,
//                             widget.productDetails as Product?);
//                         return GestureDetector(
//                           onTap: () {
//                             cartController.addToCart(cartModel, null);
//                           },
//                           child: Image.asset(
//                             Images.addButtonPng,
//                             height: 28,
//                             width: 28,
//                           ),
//                         );
//                       })
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/auth_controller.dart';
import 'package:shopzy_grocery_user/controller/favorite_controller.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_image.dart';
import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';
import 'package:shopzy_grocery_user/view/screens/category/product_details.dart';

class ItemsWidget extends StatefulWidget {
  final String? productName;
  final String? productImage;
  final int? productId;
  final String? description;
  final String? price;
  final String? discount;
  final String? discount_type;
  final String? units;
  final String? status;
  final List<dynamic>? variants;
  final String? stock;
  final String? image_url;
  final List<dynamic>? category_id;
  final List<dynamic>? subcategory_id;

  const ItemsWidget({
    super.key,
    this.productName,
    this.productImage,
    this.description,
    this.price,
    this.discount,
    this.discount_type,
    this.units,
    this.status,
    this.variants,
    this.stock,
    this.image_url,
    this.category_id,
    this.subcategory_id,
    this.productId,
  });

  @override
  State<ItemsWidget> createState() => _FavouriteItemsWidgetState();
}

double calculateDiscountedPrice(double actualPrice, double discountPercentage) {
  return actualPrice - (actualPrice * discountPercentage / 100);
}

class _FavouriteItemsWidgetState extends State<ItemsWidget> {
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductDetailsScreen(
          productId: widget.productId,
        ));
      },
      child: Container(
        // height: 235,
        width: 185,
        decoration: BoxDecoration(
            color: Theme.of(context).errorColor,
            // border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRect(
                  //  child:Image.asset(Images.bannerPng,height: 130,),
                    child: CustomImage(
                      image: "${widget.image_url}",
                      height: 130,
                    )),
                Positioned(
                  top: 30,
                  left: 0,
                  child: Container(
                    height: 18,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            bottomRight: Radius.circular(4))),
                    child: Center(
                      child: Text(
                        "${"save".tr} ${widget.discount} %",
                        style: interMedium.copyWith(
                            color: Theme.of(context).cardColor, fontSize: 8),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 20,
                    right: 10,
                    child: GetBuilder<FavoriteController>(
                      builder: (favoriteController) {
                        bool _isFavrouite =
                        favoriteController.favProductIdList != null
                            ? favoriteController.favProductIdList!
                            .contains(widget.productId)
                            : false;
                        return InkWell(
                            onTap: () {
                              if (Get.find<AuthController>().isLoggedIn()) {
                                _isFavrouite
                                    ? favoriteController
                                    .removeFromFavList(widget.productId!)
                                    : favoriteController
                                    .addToFavList(widget.productId);
                              } else {
                                showCustomSnackBar('you_are_not_logged_in'.tr);
                              }
                            },
                            child: _isFavrouite
                                ? Image.asset(
                              Images.emptyHeartPng,
                              width: 28,
                              height: 28,
                            )
                                : Image.asset(
                              Images.redHeart,
                              width: 28,
                              height: 28,
                              color: Colors.red,
                            ));
                      },
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.productName}",
                    style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor, fontSize: 12),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Tk ${widget.price}",
                    style: interMedium.copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                        decorationThickness: 1,
                        color: Colors.red,
                        fontSize: 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tk ${calculateDiscountedPrice(double.parse(widget.price!), double.parse(widget.discount!))}",
                        style: interMedium.copyWith(
                            color: Theme.of(context).disabledColor,
                            fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Image.asset(
                          Images.addButtonPng,
                          height: 28,
                          width: 28,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
