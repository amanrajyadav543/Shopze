class UserProfileModel {
  bool? success;
  User? user;

  UserProfileModel({this.success, this.user});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? emailVerifiedAt;
  Null? googleLogin;
  Null? facebookLogin;
  String? createdAt;
  String? updatedAt;
  Null? profileImage;
  String? country;
  String? referralCode;
  String? profileImageUrl;

  User(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.emailVerifiedAt,
        this.googleLogin,
        this.facebookLogin,
        this.createdAt,
        this.updatedAt,
        this.profileImage,
        this.country,
        this.referralCode,
        this.profileImageUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    emailVerifiedAt = json['email_verified_at'];
    googleLogin = json['google_login'];
    facebookLogin = json['facebook_login'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImage = json['profile_image'];
    country = json['country'];
    referralCode = json['referral_code'];
    profileImageUrl = json['profile_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_number'] = this.phoneNumber;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['google_login'] = this.googleLogin;
    data['facebook_login'] = this.facebookLogin;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_image'] = this.profileImage;
    data['country'] = this.country;
    data['referral_code'] = this.referralCode;
    data['profile_image_url'] = this.profileImageUrl;
    return data;
  }
}
