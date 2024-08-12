class UserInfoModel {
  int? id;
  String? name;
  String? first_name;
  String? last_Name;
  String? email;
  String? image;
  String? phone;
  String? password;
  String? refCode;

  UserInfoModel(
      {this.id,
        this.name,
        this.first_name,
        this.last_Name,
        this.email,
        this.image,
        this.phone,
        this.password,
        this.refCode,
      });

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name=json['name'];
    first_name = json['f_name'];
    last_Name = json['l_name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    password = json['password'];
    refCode = json['ref_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name']=name;
    data['first_name'] = first_name;
    data['last_name'] = last_Name;
    data['email'] = email;
    data['image'] = image;
    data['phone'] = phone;
    data['password'] = password;
    data['ref_code'] = refCode;
    return data;
  }
}
