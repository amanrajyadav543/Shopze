// class AddressModel {
//   Addresses? addresses;
//
//   AddressModel({this.addresses});
//
//   AddressModel.fromJson(Map<String, dynamic> json) {
//     addresses = json['addresses'] != null
//         ? Addresses.fromJson(json['addresses'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (addresses != null) {
//       data['addresses'] = addresses!.toJson();
//     }
//     return data;
//   }
// }
//
// class Addresses {
//   int? currentPage;
//   List<Data>? data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   List<Links>? links;
//   Null? nextPageUrl;
//   String? path;
//   int? perPage;
//   Null? prevPageUrl;
//   int? to;
//   int? total;
//
//   Addresses(
//       {this.currentPage,
//         this.data,
//         this.firstPageUrl,
//         this.from,
//         this.lastPage,
//         this.lastPageUrl,
//         this.links,
//         this.nextPageUrl,
//         this.path,
//         this.perPage,
//         this.prevPageUrl,
//         this.to,
//         this.total});
//
//   Addresses.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     if (json['links'] != null) {
//       links = <Links>[];
//       json['links'].forEach((v) {
//         links!.add(Links.fromJson(v));
//       });
//     }
//     nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['current_page'] = currentPage;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['first_page_url'] = firstPageUrl;
//     data['from'] = from;
//     data['last_page'] = lastPage;
//     data['last_page_url'] = lastPageUrl;
//     if (links != null) {
//       data['links'] = links!.map((v) => v.toJson()).toList();
//     }
//     data['next_page_url'] = nextPageUrl;
//     data['path'] = path;
//     data['per_page'] = perPage;
//     data['prev_page_url'] = prevPageUrl;
//     data['to'] = to;
//     data['total'] = total;
//     return data;
//   }
// }
//
// class Data {
//   int? id;
//   String? addressType;
//   String? contactPersonNumber;
//   String? address;
//   String? latitude;
//   String? longitude;
//   int? userId;
//   Null? contactPersonName;
//   String? personEmailAddress;
//   String? createdAt;
//   String? updatedAt;
//
//   Data(
//       {this.id,
//         this.addressType,
//         this.contactPersonNumber,
//         this.address,
//         this.latitude,
//         this.longitude,
//         this.userId,
//         this.contactPersonName,
//         this.personEmailAddress,
//         this.createdAt,
//         this.updatedAt});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     addressType = json['address_type'];
//     contactPersonNumber = json['contact_person_number'];
//     address = json['address'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     userId = json['user_id'];
//     contactPersonName = json['contact_person_name'];
//     personEmailAddress = json['person_email_address'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['address_type'] = addressType;
//     data['contact_person_number'] = contactPersonNumber;
//     data['address'] = address;
//     data['latitude'] = latitude;
//     data['longitude'] = longitude;
//     data['user_id'] = userId;
//     data['contact_person_name'] = contactPersonName;
//     data['person_email_address'] = personEmailAddress;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
//
// class Links {
//   String? url;
//   String? label;
//   bool? active;
//
//   Links({this.url, this.label, this.active});
//
//   Links.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['url'] = url;
//     data['label'] = label;
//     data['active'] = active;
//     return data;
//   }
// }

class AddressModel {
  Addresses? addresses;

  AddressModel({this.addresses});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addresses = json['addresses'] != null
        ? new Addresses.fromJson(json['addresses'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addresses != null) {
      data['addresses'] = this.addresses!.toJson();
    }
    return data;
  }
}

class Addresses {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Addresses(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Addresses.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? addressType;
  String? contactPersonNumber;
  String? address;
  String? latitude;
  String? longitude;
  int? userId;
  String? contactPersonName;
  String? personEmailAddress;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.addressType,
        this.contactPersonNumber,
        this.address,
        this.latitude,
        this.longitude,
        this.userId,
        this.contactPersonName,
        this.personEmailAddress,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressType = json['address_type'];
    contactPersonNumber = json['contact_person_number'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    userId = json['user_id'];
    contactPersonName = json['contact_person_name'];
    personEmailAddress = json['person_email_address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address_type'] = this.addressType;
    data['contact_person_number'] = this.contactPersonNumber;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['user_id'] = this.userId;
    data['contact_person_name'] = this.contactPersonName;
    data['person_email_address'] = this.personEmailAddress;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
