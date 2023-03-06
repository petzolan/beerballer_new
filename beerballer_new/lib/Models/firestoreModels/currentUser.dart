import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

CurrUser currentUserFromJson(String str) => CurrUser.fromJson(json.decode(str));

String currentUserToJson(CurrUser data) => json.encode(data.toJson());

class CurrUser {
  String email;
  Collection collections;
  // ignore: non_constant_identifier_names
  String user_id;
  // ignore: non_constant_identifier_names
  String? referenceId;

  CurrUser({
    required this.email,
    // ignore: non_constant_identifier_names
    required this.collections,
    required this.user_id,
    // ignore: non_constant_identifier_names
    this.referenceId,
  });

  factory CurrUser.fromSnapshot(DocumentSnapshot snapshot) {
    final newGame = CurrUser.fromJson(snapshot.data() as Map<String, dynamic>);
    newGame.referenceId = snapshot.reference.id;
    return newGame;
  }

  factory CurrUser.fromJson(Map<String, dynamic> json) => CurrUser(
        email: json["email"] as String,
        collections: Collection.fromJson(json["user_collections"]),
        user_id: json["user_id"] as String,
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "user_id": user_id,
        "user_collections": collections.collectionMap,
      };
}

class Collection {
  Map<String, dynamic> collectionMap;

  Collection({required this.collectionMap});

  factory Collection.fromJson(Map<String,  dynamic> json) {
    print(json);
    Map<String, dynamic> temp = Map.from(json);
    return Collection(collectionMap: temp);
  }

  @override
  String toString() {
    for (var item in collectionMap.keys) {
      print("key: " + item + "\n");
    }
    return "done";
  }

  Map<String, dynamic> toJson() => {
        "user_collections": this.collectionMap,
      };
}
