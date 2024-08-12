class TopCategoryModel {
  bool? success;
  List<TopCategoryList>? category;
  String? limit;
  String? offset;

  TopCategoryModel({this.success, this.category, this.limit, this.offset});

  TopCategoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['category'] != null) {
      category = <TopCategoryList>[];
      json['category'].forEach((v) {
        category!.add(TopCategoryList.fromJson(v));
      });
    }
    limit = json['limit'];
    offset = json['offset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.category != null) {
      data['category'] = this.category!.map((v) => v.toJson()).toList();
    }
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    return data;
  }
}

class TopCategoryList {
  int? id;
  String? name;
  String? image;

  TopCategoryList({this.id, this.name, this.image});

  TopCategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
