import 'dart:convert';

Jokes gameFromJson(String str) => Jokes.fromJson(json.decode(str));

String gameToJson(Jokes data) => json.encode(data.toJson());

class Jokes {
  String text;

  Jokes({
    required this.text,
  });

  factory Jokes.fromJson(Map<String, dynamic> json) => Jokes(
        text: json["text"] as String,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
