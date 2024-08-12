import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopzy_grocery_user/controller/coupan_controller.dart';
import 'package:shopzy_grocery_user/utils/styles.dart';
import 'package:shopzy_grocery_user/view/base/custom_button.dart';
import 'package:shopzy_grocery_user/view/base/custom_snackbar.dart';

class CouponWidget extends StatefulWidget {
  const CouponWidget({
    super.key,
  });

  @override
  State<CouponWidget> createState() => _CouponWidgetState();
}

class _CouponWidgetState extends State<CouponWidget> {
  final TextEditingController _couponController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CouponController>(builder: (couponController){
      return DottedBorder(
        radius: Radius.circular(10),
        color: Theme.of(context).primaryColorLight,
        strokeWidth: 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10)
          ),
          height: 55,
          width: Get.width,
          child: TextField(
            controller: _couponController,
            decoration: InputDecoration(

                suffixIcon: SizedBox(
                    width: 125,
                    child: CustomButton(
                      fontSize: 15,
                      height: 45,
                      title: "apply".tr,onPressed: (){
                      _applyCoupon(couponController, _couponController.value.toString());
                    },radius: 8,)),
                contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                border: InputBorder.none,
                hintText: 'enter_coupon_code'.tr,
                hintStyle: interMedium.copyWith(
                    fontSize: 16,
                    color: Theme.of(context).hintColor
                )
            ),
          ),
        ),
      );
    });
  }
  void _applyCoupon(CouponController couponController, String coupon) async {
    String coupon = _couponController.text.trim();

    if (coupon.isEmpty) {
      showCustomSnackBar('enter_your_coupon'.tr);
    }
     else {
      couponController.applyCoupon(coupon).then((status) async {
        if (status.hashCode==200) {
          showCustomSnackBar("coupan Applied");
         } else {
          showCustomSnackBar("coupan faild");
        }
      });
    }
  }
}
