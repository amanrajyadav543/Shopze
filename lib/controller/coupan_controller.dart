import 'package:get/get.dart';
import 'package:shopzy_grocery_user/data/api/api_checker.dart';
import 'package:shopzy_grocery_user/data/model/response/coupon_model.dart';
import 'package:shopzy_grocery_user/data/repository/coupan_repo.dart';

class CouponController extends GetxController implements GetxService {
  final CouponRepo couponRepo;
  CouponController({required this.couponRepo});

   List<Coupons>?_couponList;
  List<Coupons>? _coupon;
  double _discount = 0.0;
  bool _isLoading = false;

   List<Coupons>? get couponList=>_couponList;
  List<Coupons>? get coupon=>_coupon;
  double get discount => _discount;
  bool get isLoading=>_isLoading;

  Future<void> getCouponList() async {
    _isLoading = true;
    update();
    Response response = await couponRepo.getCouponList(0);
    if (response.statusCode == 200) {
      _couponList = [];
      _couponList?.addAll(CouponModel.fromJson(response.body).coupons!);
      _isLoading = false;
      update();
    } else {
      ApiChecker.checkApi(response);
    }
  }
  Future<double> applyCoupon(String coupon) async {
    _isLoading = true;
    update();
    Response response = await couponRepo.applyCoupon(coupon);
    if (response.statusCode == 200) {
       _coupon!.addAll(CouponModel.fromJson(response.body).coupons!);

    } else {

      ApiChecker.checkApi(response);
    }
    _isLoading = false;
    update();
    return _discount ;
  }



}
