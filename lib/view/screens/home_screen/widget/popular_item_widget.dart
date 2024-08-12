
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/auth_controller.dart';
import 'package:shopzy_grocery_user/controller/category_controller.dart';
import 'package:shopzy_grocery_user/controller/favorite_controller.dart';
import 'package:shopzy_grocery_user/data/model/response/productDetails_model.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_image.dart';
import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';

class PopularItemsWidget extends StatefulWidget {
  final double? width;
  final bool? favourite;
  final String? productName;
  final String? image;
  final String? actualPrice;
  final int? productId;
  final int index;
  final String? discountPercentage;

  const PopularItemsWidget({
    super.key,
    this.width = 320,
    this.favourite = false,
    this.productName,
    this.image,
    this.actualPrice,
    this.discountPercentage, this.productId, required this.index,
  });

  @override
  State<PopularItemsWidget> createState() => _PopularItemsWidgetState();
}

class _PopularItemsWidgetState extends State<PopularItemsWidget> {
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return
      GestureDetector(
        onTap: (){
       //   Get.to(ProductDetailsScreen());
        },
        child: Container(
          // height: 235,
          width: 185,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [

                  CustomImage(image: '${widget.image}', height:130 ,fit: BoxFit.fill,),
                  Positioned(
                    top: 30,
                    left: 0,
                    child:
                    Container(
                      height: 18,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorDark,
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(4),bottomRight: Radius.circular(4))
                      ),
                      child: Center(
                        child: Text(
                          "${"save".tr} 10.5 %",style: interMedium.copyWith(
                            color: Theme.of(context).cardColor,
                            fontSize: 8
                        ),
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
                    Text("${widget.productName}",style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor,
                        fontSize: 12
                    ),),
                    SizedBox(height: 5,),
                    Text("Tk 845",style: interMedium.copyWith(
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                        decorationThickness: 1,
                        color: Colors.red,
                        fontSize: 12
                    ),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tk 765",style: interMedium.copyWith(
                            color: Theme.of(context).disabledColor,
                            fontSize: 14
                        ),),
                        GestureDetector(
                          onTap: (){},
                          child: Image.asset(Images.addButtonPng,height: 28,width: 28,),
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
