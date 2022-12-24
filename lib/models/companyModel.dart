import 'dart:convert';

class Company {
  String? id;
  String name;
  String address;
  double? rank;
  String logo;
  String phone;
  String email;
  String? password;
  String? role;
  Company(
      {this.id,
      required this.name,
      required this.address,
      this.rank,
      required this.logo,
      required this.phone,
      required this.email,
      this.password,
      this.role});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'rank': rank,
      'logo': logo,
      'phone': phone,
      'email': email,
      'password': password,
      'role': role
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
        id: map['id'],
        name: map['name'] ?? '',
        address: map['address'] ?? '',
        rank: map['rank'] ?? 0,
        logo: map['logo'] ?? '',
        phone: map['phone'] ?? '',
        email: map['email'] ?? '',
        password: map['password'],
        role: map['role']);
  }

  String toJson() => json.encode(toMap());
  @override
  String toString() {
    return '{id: $id,name: $name,address: $address,rank:$rank,logo: $logo,phone:$phone,email: $email}';
  }

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source));
}
