import 'dart:convert';

GuessingQuestion gameFromJson(String str) =>
    GuessingQuestion.fromJson(json.decode(str));

String gameToJson(GuessingQuestion data) => json.encode(data.toJson());

class GuessingQuestion {
  String text;
  String answer;

  GuessingQuestion({
    required this.text,
    required this.answer,
  });

  factory GuessingQuestion.fromJson(Map<String, dynamic> json) =>
      GuessingQuestion(
        text: json["text"] as String,
        answer: json["answer"] as String,
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "answer": answer,
      };
}
