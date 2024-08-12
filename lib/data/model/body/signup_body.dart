class SignUpBody {
  String? first_name;
  String? last_name;
  String? password;
  String? country;
  String? phone_number;
  String? email;
  String? referral_code;

  SignUpBody(
      {this.first_name,
      this.last_name,
      this.password,
      this.country,
      this.phone_number,
      this.email = '',
      this.referral_code = ''});

  SignUpBody.fromJson(Map<String, dynamic> json) {
    first_name = json['first_name'];
    last_name = json['last_name'];
    password = json['password'];
    country = json['country'];
    phone_number = json['phone_number'];
    email = json['email'];
    referral_code = json['referral_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['password'] = password;
    data['country'] = country;
    data['phone_number'] = phone_number;
    data['email'] = email;
    data['referral_code'] = referral_code;
    return data;
  }
}
