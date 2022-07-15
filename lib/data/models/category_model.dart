// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  @override
  List<Object> get props => [name, imageUrl];

  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  static Category fromSnapshot(DocumentSnapshot snap) {
    Category category =
        Category(name: snap["name"], imageUrl: snap["imageUrl"]);

    return category;
  }


  
  
  Category copyWith({
    String? name,
    String? imageUrl,
  }) {
    return Category(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
