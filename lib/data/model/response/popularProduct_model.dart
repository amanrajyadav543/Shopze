class PopularProductModel {
  bool? success;
  List<PopularProduct>? popularProduct;
  String? limit;
  String? offset;

  PopularProductModel({this.success, this.popularProduct, this.limit, this.offset});

  PopularProductModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['product'] != null) {
      popularProduct = <PopularProduct>[];
      json['product'].forEach((v) {
        popularProduct!.add(new PopularProduct.fromJson(v));
      });
    }
    limit = json['limit'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.popularProduct != null) {
      data['product'] = this.popularProduct!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    return data;
  }
}

class PopularProduct {
  int? id;
  String? name;
  String? description;
  String? thumbnail;
  Null? image;
  String? price;
  String? discount;
  String? discountType;
 // String? units;
  int? status;
  List<Variants>? variants;
  List<String>? categoryId;
  List<String>? subcategoryId;
  Null? searchingKeywords;
  int? stock;
  String? imageUrl;

  PopularProduct(
      {this.id,
        this.name,
        this.description,
        this.thumbnail,
        this.image,
        this.price,
        this.discount,
        this.discountType,
      //  this.units,
        this.status,
        this.variants,
        this.categoryId,
        this.subcategoryId,
        this.searchingKeywords,
        this.stock,
        this.imageUrl});

  PopularProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'];
    image = json['image'];
    price = json['price'];
    discount = json['discount'];
    discountType = json['discount_type'];
    //units = json['units'];
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
   // data['units'] = this.units;
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
