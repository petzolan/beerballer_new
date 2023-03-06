import 'dart:convert';

WhoWoulQuestion gameFromJson(String str) =>
    WhoWoulQuestion.fromJson(json.decode(str));

String gameToJson(WhoWoulQuestion data) => json.encode(data.toJson());

class WhoWoulQuestion {
  String text;

  WhoWoulQuestion({
    required this.text,
  });

  factory WhoWoulQuestion.fromJson(Map<String, dynamic> json) =>
      WhoWoulQuestion(
        text: json["text"] as String,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
      };
}
