class FavoriteProductsModel {
  bool? success;
  List<FavoriteProducts>? favoriteProducts;
  String? limit;
  String? offset;

  FavoriteProductsModel(
      {this.success, this.favoriteProducts, this.limit, this.offset});

  FavoriteProductsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['favoriteProducts'] != null) {
      favoriteProducts = <FavoriteProducts>[];
      json['favoriteProducts'].forEach((v) {
        favoriteProducts!.add(new FavoriteProducts.fromJson(v));
      });
    }
    limit = json['limit'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.favoriteProducts != null) {
      data['favoriteProducts'] =
          this.favoriteProducts!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    return data;
  }
}

class FavoriteProducts {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  FavoriteProducts(
      {this.id, this.productId, this.userId, this.createdAt, this.updatedAt});

  FavoriteProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
