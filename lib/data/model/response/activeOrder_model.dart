class ActiveOrderModel {
  bool? success;
  List<Orders>? orders;
  String? limit;
  String? offset;

  ActiveOrderModel({this.success, this.orders, this.limit, this.offset});

  ActiveOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(new Orders.fromJson(v));
      });
    }
    limit = json['limit'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    return data;
  }
}

class Orders {
  int? id;
  int? orderAmount;
  int? productId;
  String? deliveryAddress;
  String? billingAddress;
  Null? deliveryManId;
  int? deliveryCharge;
  int? userId;
  int? paymentStatus;
  String? orderStatus;
  String? status;
  String? updatedAt;
  String? createdAt;
  String? paymentMethod;

  Orders(
      {this.id,
        this.orderAmount,
        this.productId,
        this.deliveryAddress,
        this.billingAddress,
        this.deliveryManId,
        this.deliveryCharge,
        this.userId,
        this.paymentStatus,
        this.orderStatus,
        this.status,
        this.updatedAt,
        this.createdAt,
        this.paymentMethod});

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderAmount = json['order_amount'];
    productId = json['product_id'];
    deliveryAddress = json['delivery_address'];
    billingAddress = json['billing_address'];
    deliveryManId = json['delivery_man_id'];
    deliveryCharge = json['delivery_charge'];
    userId = json['user_id'];
    paymentStatus = json['payment_status'];
    orderStatus = json['order_status'];
    status = json['status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    paymentMethod = json['payment_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_amount'] = this.orderAmount;
    data['product_id'] = this.productId;
    data['delivery_address'] = this.deliveryAddress;
    data['billing_address'] = this.billingAddress;
    data['delivery_man_id'] = this.deliveryManId;
    data['delivery_charge'] = this.deliveryCharge;
    data['user_id'] = this.userId;
    data['payment_status'] = this.paymentStatus;
    data['order_status'] = this.orderStatus;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['payment_method'] = this.paymentMethod;
    return data;
  }
}
