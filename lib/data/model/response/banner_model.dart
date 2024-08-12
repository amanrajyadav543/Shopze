class BannerModel {
  bool? success;
  List<Banner>? banner;

  BannerModel({this.success, this.banner});

  BannerModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['banner'] != null) {
      banner = <Banner>[];
      json['banner'].forEach((v) {
        banner!.add(Banner.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (banner != null) {
      data['banner'] = banner!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banner {
  int? id;
  String? type;
  String? name;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Banner(
      {this.id,
        this.type,
        this.name,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.imageUrl});

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['image_url'] = imageUrl;
    return data;
  }
}
