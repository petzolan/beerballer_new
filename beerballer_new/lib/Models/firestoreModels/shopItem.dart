import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

ShopItem shopItemFromJson(String str) => ShopItem.fromJson(json.decode(str));

String shopItemToJson(ShopItem data) => json.encode(data.toJson());

class ShopItem {
  String category;
  String description;
  String imagePath;
  String name;
  String price;
  String weblink;
  String details;
  String? referenceId;

  ShopItem({
    required this.category,
    required this.description,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.weblink,
    required this.details,
    this.referenceId,
  });

  factory ShopItem.fromSnapshot(DocumentSnapshot snapshot) {
    final newGame = ShopItem.fromJson(snapshot.data() as Map<String, dynamic>);
    newGame.referenceId = snapshot.reference.id;
    return newGame;
  }

  factory ShopItem.fromJson(Map<String, dynamic> json) => ShopItem(
        category: json["category"] as String,
        description: json["description"] as String,
        imagePath: json["image_path"] as String,
        name: json["name"] as String,
        price: json["price"] as String,
        weblink: json["weblink"] as String,
        details: json["details"] as String,
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "description": description,
        "image_path": imagePath,
        "name": name,
        "price": price,
        "weblink": weblink,
      };
}