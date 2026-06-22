class AddressModel {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final GeoModel geo;

  const AddressModel({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      street: json['street'] as String? ?? '',
      suite: json['suite'] as String? ?? '',
      city: json['city'] as String? ?? '',
      zipcode: json['zipcode'] as String? ?? '',
      geo: GeoModel.fromJson(json['geo'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() => {
    'street': street,
    'suite': suite,
    'city': city,
    'zipcode': zipcode,
    'geo': geo.toJson(),
  };
}

class GeoModel {
  final String lat;
  final String lng;

  const GeoModel({required this.lat, required this.lng});

  factory GeoModel.fromJson(Map<String, dynamic> json) {
    return GeoModel(
      lat: json['lat'] as String? ?? '',
      lng: json['lng'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}

class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  const CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json['name'] as String? ?? '',
      catchPhrase: json['catchPhrase'] as String? ?? '',
      bs: json['bs'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'catchPhrase': catchPhrase,
    'bs': bs,
  };
}

class UserModel {
  final int id;
  final String name;
  final String username;
  final String email;
  final AddressModel address;
  final String phone;
  final String website;
  final CompanyModel company;

  const UserModel({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: AddressModel.fromJson(
        json['address'] as Map<String, dynamic>? ?? {},
      ),
      phone: json['phone'] as String? ?? '',
      website: json['website'] as String? ?? '',
      company: CompanyModel.fromJson(
        json['company'] as Map<String, dynamic>? ?? {},
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'username': username,
    'email': email,
    'address': address.toJson(),
    'phone': phone,
    'website': website,
    'company': company.toJson(),
  };
}
