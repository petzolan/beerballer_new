import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

EventItem shopItemFromJson(String str) => EventItem.fromJson(json.decode(str));

String shopItemToJson(EventItem data) => json.encode(data.toJson());

class EventItem {
  String category;
  String location;
  String name;
  String weblink;
  String? referenceId;

  EventItem({
    required this.category,
    required this.location,
    required this.name,
    required this.weblink,
    this.referenceId,
  });

  factory EventItem.fromSnapshot(DocumentSnapshot snapshot) {
    final newGame = EventItem.fromJson(snapshot.data() as Map<String, dynamic>);
    newGame.referenceId = snapshot.reference.id;
    return newGame;
  }

  factory EventItem.fromJson(Map<String, dynamic> json) => EventItem(
        category: json["category"] as String,
        location: json["location"] as String,
        name: json["name"] as String,
        weblink: json["weblink"] as String,
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "location": location,
        "name": name,
        "weblink": weblink,
      };
}
