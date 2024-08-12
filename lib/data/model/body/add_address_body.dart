class AddAddressBody {
  String? address_type;
  String? contact_person_number;
  String? contact_person_name;
  String? latitude;
  String? longitude;
  String? person_email_address;
  String? house_no;
  String? flat_no;
  String? street_address;
  String? nearby_landmark;


  AddAddressBody(
      {this.address_type,
        this.contact_person_number,
        this.contact_person_name,
        this.latitude,
        this.longitude,
        this.person_email_address,
        this.house_no,
        this.flat_no,
        this.street_address,
        this.nearby_landmark,

      });

  AddAddressBody.fromJson(Map<String, dynamic> json) {
    address_type = json['address_type'];
    contact_person_number = json['contact_person_number'];
    contact_person_name = json['contact_person_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    person_email_address = json['person_email_address'];
    house_no = json['house_no'];
    flat_no = json['flat_no'];
    street_address = json['street_address'];
    nearby_landmark = json['nearby_landmark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['address_type'] = address_type;
    data['contact_person_number'] = contact_person_number;
    data['contact_person_name'] = contact_person_name;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['person_email_address'] = person_email_address;
    data['house_no'] = house_no;
    data['flat_no'] = flat_no;
    data['street_address'] = street_address;
    data['nearby_landmark'] = nearby_landmark;
    return data;
  }
}
