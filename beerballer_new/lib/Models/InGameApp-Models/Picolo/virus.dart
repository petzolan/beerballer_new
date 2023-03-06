import 'dart:convert';

Virus virusFromJson(String str) => Virus.fromJson(json.decode(str));

String virusToJson(Virus data) => json.encode(data.toJson());

class Virus {
  String text;
  String aufloser;

  Virus({
    required this.text,
    required this.aufloser,
  });

  factory Virus.fromJson(Map<String, dynamic> json) => Virus(
        text: json["text"] as String,
        aufloser: json["aufloser"] as String
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "aufloser": aufloser
      };
}
