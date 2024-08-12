class ProductDetailModel {
  bool? success;
  ProductDetails? productDetails;
  List<GetProReview>? getProReview;

  ProductDetailModel({this.success, this.productDetails, this.getProReview});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    productDetails =
    json['product'] != null ? new ProductDetails.fromJson(json['product']) : null;
    if (json['get_pro_review'] != null) {
      getProReview = <GetProReview>[];
      json['get_pro_review'].forEach((v) {
        getProReview!.add(new GetProReview.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.productDetails != null) {
      data['product'] = this.productDetails!.toJson();
    }
    if (this.getProReview != null) {
      data['get_pro_review'] =
          this.getProReview!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductDetails {
  int? id;
  String? name;
  String? description;
  String? thumbnail;
  String? image;
  double? price;
  double? discount;
  String? discountType;
  int? units;
  int? status;
  List<Variants>? variants;
  List<String>? categoryId;
  List<String>? subcategoryId;
  String? searchingKeywords;
  int? stock;
  String? imageUrl;

  ProductDetails(
      {this.id,
        this.name,
        this.description,
        this.thumbnail,
        this.image,
        this.price,
        this.discount,
        this.discountType,
        this.units,
        this.status,
        this.variants,
        this.categoryId,
        this.subcategoryId,
        this.searchingKeywords,
        this.stock,
        this.imageUrl});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    price = json['price'].toDouble();
    discount = json['discount'].toDouble();
    discountType = json['discount_type'];
    // units = json['units'];
    status = json['status'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    categoryId = json['category_id'].cast<String>();
    subcategoryId = json['subcategory_id'].cast<String>();
    searchingKeywords = json['searching_keywords'];
    stock = json['stock'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['thumbnail'] = this.thumbnail;
    data['image'] = this.image;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    data['units'] = this.units;
    data['status'] = this.status;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    data['category_id'] = this.categoryId;
    data['subcategory_id'] = this.subcategoryId;
    data['searching_keywords'] = this.searchingKeywords;
    data['stock'] = this.stock;
    data['image_url'] = this.imageUrl;
    return data;
  }
}

class Variants {
  String? priceVariant;
  String? stocksVariant;
  String? attributeVariant;

  Variants({this.priceVariant, this.stocksVariant, this.attributeVariant});

  Variants.fromJson(Map<String, dynamic> json) {
    priceVariant = json['price_variant'];
    stocksVariant = json['stocks_variant'];
    attributeVariant = json['attribute_variant'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price_variant'] = this.priceVariant;
    data['stocks_variant'] = this.stocksVariant;
    data['attribute_variant'] = this.attributeVariant;
    return data;
  }
}

class GetProReview {
  int? id;
  int? userId;
  int? productId;
  int? rating;
  String? review;
  String? createdAt;
  String? updatedAt;

  GetProReview(
      {this.id,
        this.userId,
        this.productId,
        this.rating,
        this.review,
        this.createdAt,
        this.updatedAt});

  GetProReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    rating = json['rating'];
    review = json['review'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['rating'] = this.rating;
    data['review'] = this.review;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
