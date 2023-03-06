import 'dart:convert';

Aussage gameFromJson(String str) => Aussage.fromJson(json.decode(str));

String gameToJson(Aussage data) => json.encode(data.toJson());

class Aussage {
  String text;

  Aussage({
    required this.text,
  });

  factory Aussage.fromJson(Map<String, dynamic> json) => Aussage(
        text: json["text"] as String,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
