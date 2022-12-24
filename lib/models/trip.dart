import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'companyModel.dart';

class Trip {
  String? id;
  String name;
  String location;
  String url;
  String description;
  Company company;
  bool isLiked;
  int liked_count;
  bool isBooked;
  Trip(
      {this.id,
      required this.name,
      required this.location,
      required this.url,
      required this.description,
      required this.company,
      this.isLiked = false,
      required this.liked_count,
      this.isBooked = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'url': url,
      'description': description,
      'company': company.toMap(),
      'isLiked': isLiked,
      'liked_count': liked_count,
      'isBookedMarked': isBooked
    };
  }

  Map<String, dynamic> toDBMap() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'url': url,
      'description': description,
      'company': company.toString(),
      'isLiked': isLiked ? 1 : 0,
      'liked_count': liked_count,
      'isBookedMarked': isBooked ? 1 : 0
    };
  }

  factory Trip.fromMap(Map<String, dynamic> map) {
    return Trip(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      url: map['url'],
      description: map['description'] ?? '',
      company: Company.fromMap(map['company']),
      isLiked: map['isLiked'],
      liked_count: map['liked_count'] ?? 0,
    );
  }
  factory Trip.fromDBMap(Map<String, dynamic> map) {
    return Trip(
        id: map['id'] ?? '',
        name: map['name'] ?? '',
        location: map['location'] ?? '',
        url: "http://localhost:8083/" + map['url'],
        description: map['description'] ?? '',
        company: Company.fromMap(jsonDecode(map['company'])),
        isLiked: map['isLiked'] == 1,
        liked_count: map['liked_count']?.toInt() ?? 0,
        isBooked: map['isBooked'] == 1);
  }

  String toJson() => json.encode(toMap());

  factory Trip.fromJson(String source) => Trip.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Trip(id: $id, name: $name, location: $location, url: $url, description: $description, isLiked: $isLiked)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Trip &&
        other.id == id &&
        other.name == name &&
        other.location == location &&
        other.url == url &&
        other.description == description &&
        other.isLiked == isLiked;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        location.hashCode ^
        url.hashCode ^
        description.hashCode ^
        isLiked.hashCode;
  }
}
