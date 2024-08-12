class CouponModel {
  bool? success;
  List<Coupons>? coupons;
  String? limit;
  String? offset;

  CouponModel({this.success, this.coupons, this.limit, this.offset});

  CouponModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['coupons'] != null) {
      coupons = <Coupons>[];
      json['coupons'].forEach((v) {
        coupons!.add(Coupons.fromJson(v));
      });
    }
    limit = json['limit'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (coupons != null) {
      data['coupons'] = coupons!.map((v) => v.toJson()).toList();
    }
    data['limit'] = limit;
    data['offset'] = offset;
    return data;
  }
}

class Coupons {
  int? id;
  String? couponName;
  String? code;
  int? limit;
  String? startDate;
  String? expireDate;
  String? discountType;
  String? discount;
  String? minPurchase;
  String? description;
  Coupons(
      {this.id,
        this.couponName,
        this.code,
        this.limit,
        this.startDate,
        this.expireDate,
        this.discountType,
        this.discount,
        this.minPurchase,
        this.description});

  Coupons.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    couponName = json['coupon_name'];
    code = json['code'];
    limit = json['limit'];
    startDate = json['start_date'];
    expireDate = json['expire_date'];
    discountType = json['discount_type'];
    discount = json['discount'];
    minPurchase = json['min_purchase'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['coupon_name'] = couponName;
    data['code'] = code;
    data['limit'] = limit;
    data['start_date'] = startDate;
    data['expire_date'] = expireDate;
    data['discount_type'] = discountType;
    data['discount'] = discount;
    data['min_purchase'] = minPurchase;
    data['description'] = description;
    return data;
  }
}
