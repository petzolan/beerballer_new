import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

Game gameFromJson(String str) => Game.fromJson(json.decode(str));

String gameToJson(Game data) => json.encode(data.toJson());

class Game {
  String gameCategory;
  String gameName;
  int amountLiked;
  String playerNumber;
  String gameDuration;
  Materials materials;
  String funFactor;
  String drunknessFac;
  String difficulty;
  String dirtyFactor;
  List<String> explanations;
  // ignore: non_constant_identifier_names
  List<String> likes_user_ids;
  // ignore: non_constant_identifier_names
  List<String> dislikes_user_ids;
  // ignore: non_constant_identifier_names
  List<String> favorite_of_users;
  List<String> tags;

  String imagePath;
  String? referenceId;

  Game({
    required this.gameCategory,
    required this.gameName,
    required this.amountLiked,
    required this.playerNumber,
    required this.gameDuration,
    required this.materials,
    required this.funFactor,
    required this.drunknessFac,
    required this.difficulty,
    required this.dirtyFactor,
    required this.explanations,
    // ignore: non_constant_identifier_names
    required this.likes_user_ids,
    // ignore: non_constant_identifier_names
    required this.dislikes_user_ids,
    // ignore: non_constant_identifier_names
    required this.favorite_of_users,
    required this.tags,
    required this.imagePath,
    this.referenceId,
  });

  factory Game.fromSnapshot(DocumentSnapshot snapshot) {
    final newGame = Game.fromJson(snapshot.data() as Map<String, dynamic>);
    newGame.referenceId = snapshot.reference.id;
    return newGame;
  }

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        gameCategory: json["game_category"] as String,
        gameName: json["game_name"] as String,
        amountLiked: json["amount_liked"] as int,
        playerNumber: json["player_number"] as String,
        gameDuration: json["game_duration"] as String,
        materials: Materials.fromJson(json['materials']),
        funFactor: json["fun_factor"] as String,
        drunknessFac: json["drunkness_factor"] as String,
        difficulty: json["difficulty"] as String,
        dirtyFactor: json["dirty_factor"] as String,
        explanations: List<String>.from(
          json["explanations"].map((x) => x),
        ),
        likes_user_ids: List<String>.from(
          json["likes_user_ids"].map((x) => x),
        ),
        dislikes_user_ids: List<String>.from(
          json["dislikes_user_ids"].map((x) => x),
        ),
        favorite_of_users: List<String>.from(
          json["favorite_of_users"].map((x) => x),
        ),
        tags: List<String>.from(
          json["tags"].map((x) => x),
        ),
        imagePath: json["image_url"] as String,
      );

  Map<String, dynamic> toJson() => {
        "game_category": gameCategory,
        "game_name": gameName,
        "amount_liked": amountLiked,
        "player_number": playerNumber,
        "game_duration": gameDuration,
        "materials": materials.toJson(),
        "fun_factor": funFactor,
        "drunkness_factor": drunknessFac,
        "difficulty": difficulty,
        "dirty_factor": dirtyFactor,
        "explanations": List<String>.from(
          explanations.map((x) => x),
        ),
        "likes_user_ids": List<String>.from(
          likes_user_ids.map((x) => x),
        ),
        "dislikes_user_ids": List<String>.from(
          dislikes_user_ids.map((x) => x),
        ),
        "favorite_of_users": List<String>.from(
          favorite_of_users.map((x) => x),
        ),
        "tags": List<String>.from(
          tags.map((x) => x),
        ),
        "image_url": imagePath,
      };
}

class Materials {
  Map<String, dynamic> materialMap;

  Materials({required this.materialMap});

  factory Materials.fromJson(Map<dynamic, dynamic> json) {
    Map<String, dynamic> temp = Map.from(json);
    return Materials(materialMap: temp);
  }

  Map<String, dynamic> toJson() => {
        "materials": this.materialMap,
      };
}
