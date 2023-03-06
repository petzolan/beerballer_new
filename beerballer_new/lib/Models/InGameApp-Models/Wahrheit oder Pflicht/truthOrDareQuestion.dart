import 'dart:convert';
import 'package:beerballer_new/Models/InGameApp-Models/Wahrheit%20oder%20Pflicht/typeOfQuestion.dart';

TruthOrDareQuestion gameFromJson(String str) =>
    TruthOrDareQuestion.fromJson(json.decode(str));

String gameToJson(TruthOrDareQuestion data) => json.encode(data.toJson());

class TruthOrDareQuestion {
  String text;
  TypeOfQuestion questiontype;

  TruthOrDareQuestion({
    required this.text,
    required this.questiontype,
  });

  factory TruthOrDareQuestion.fromJson(Map<String, dynamic> json) =>
      TruthOrDareQuestion(
        text: json["text"] as String,
        questiontype: getTypeEnum(json["questiontype"]),
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "questiontype": getType(questiontype),
      };
}

String getType(TypeOfQuestion gen) {
  switch (gen) {
    case TypeOfQuestion.dare:
      return "dare";
    case TypeOfQuestion.truth:
      return "truth";
  }
}

TypeOfQuestion getTypeEnum(String gen) {
  for (TypeOfQuestion candidate in TypeOfQuestion.values) {
    if (gen == getType(candidate)) return candidate;
  }
  return TypeOfQuestion.truth;
}
