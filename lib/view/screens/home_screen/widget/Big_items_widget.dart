import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/utils/images.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_image.dart';

class BigItemsWidget extends StatefulWidget {
  final double? width;
  final bool? favourite;
  final String? productName;
  final String? image;
  final String? actualPrice;
  final String? discountPercentage;

  const BigItemsWidget({
    super.key,
    this.width = 320,
    this.favourite = false,
    this.productName,
    this.image,
    this.actualPrice,
    this.discountPercentage,
  });

  @override
  State<BigItemsWidget> createState() => _BigItemsWidgetState();
}

class _BigItemsWidgetState extends State<BigItemsWidget> {
  @override
  void initState() {
    super.initState();
  }

  double calculateDiscountedPrice(
      double actualPrice, double discountPercentage) {
    return actualPrice - (actualPrice * discountPercentage/100);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.error,
          border:
              Border.all(color: Theme.of(context).disabledColor, width: 0.01),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Stack(
            children: [
              SizedBox(
                width: 10,
              ),
              CustomImage(image: '${widget.image}', height:130 , width: 165,),

              widget.favourite!
                  ? SizedBox()
                  : Positioned(
                      bottom: 10,
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
                            "${"save".tr} ${widget.discountPercentage} %",
                            style: interMedium.copyWith(
                                color: Theme.of(context).cardColor,
                                fontSize: 8),
                          ),
                        ),
                      ),
                    ),
              Positioned(
                  top: 20,
                  right: 0,
                  child: Image.asset(
                    widget.favourite!
                        ? Images.filledIcon
                        : Images.emptyHeartPng,
                    width: 28,
                    height: 28,
                  ))
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: widget.favourite! ? Get.width * 0.4 : 135,
                child: Text(
                  "${widget.productName}",
                  style: interMedium.copyWith(
                      color: Theme.of(context).disabledColor, fontSize: 12),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Tk ${widget.actualPrice}",
                style: interMedium.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red,
                    decorationThickness: 1,
                    color: Colors.red,
                    fontSize: 12),
              ),
              Text(
                "Tk ${calculateDiscountedPrice(double.parse(widget.actualPrice!),double.parse(widget.discountPercentage!))}",
                style: interMedium.copyWith(
                    color: Theme.of(context).disabledColor, fontSize: 14),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.favourite!
                      ? Container(
                          height: 18,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(4),
                                  bottomRight: Radius.circular(4))),
                          child: Center(
                            child: Text(
                              "${"save".tr} 10.5 %",
                              style: interMedium.copyWith(
                                  color: Theme.of(context).cardColor,
                                  fontSize: 8),
                            ),
                          ),
                        )
                      : SizedBox(),
                  SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    Images.starPng,
                    height: 28,
                    width: 28,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "4.8",
                    style: interMedium.copyWith(
                        color: Theme.of(context).disabledColor, fontSize: 12),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      Images.addButtonPng,
                      height: 28,
                      width: 28,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
