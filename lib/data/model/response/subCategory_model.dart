class SubcategoryModel {
  bool? success;
  List<Subcategory>? subcategory;
  String? limit;
  String? offset;

  SubcategoryModel({this.success, this.subcategory, this.limit, this.offset});

  SubcategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['subcategory'] != null) {
      subcategory = <Subcategory>[];
      json['subcategory'].forEach((v) {
        subcategory!.add(new Subcategory.fromJson(v));
      });
    }
    limit = json['limit'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    return data;
  }
}

class Subcategory {
  int? id;
  String? name;
  String? image;
  String? imageUrl;

  Subcategory({this.id, this.name, this.image, this.imageUrl});

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
