import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

CategoryItem gameFromJson(String str) =>
    CategoryItem.fromJson(json.decode(str));

String gameToJson(CategoryItem data) => json.encode(data.toJson());

class CategoryItem {
  String name;
  List<String> categories;
  String? referenceId;

  CategoryItem({
    required this.name,
    required this.categories,
    this.referenceId,
  });

  factory CategoryItem.fromSnapshot(QueryDocumentSnapshot<dynamic>  snapshot) {
    final newGame =
        CategoryItem.fromJson(snapshot.data() as Map<String, dynamic>);
    newGame.referenceId = snapshot.reference.id;
    return newGame;
  }

  factory CategoryItem.fromJson(Map<String, dynamic> json) => CategoryItem(
        name: json["name"] as String,
        categories: List<String>.from(
          json["categories"].map((x) => x),
        ),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "categories": List<String>.from(
          categories.map((x) => x),
        ),
      };
}
