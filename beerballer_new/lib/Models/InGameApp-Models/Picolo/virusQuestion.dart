import 'dart:convert';
import 'package:beerballer_new/Models/InGameApp-Models/Picolo/virus.dart';
import 'package:beerballer_new/Models/InGameApp-Models/Wahrheit%20oder%20Pflicht/truthOrDareQuestion.dart';

class VirusQuestion {}

var items = jsonDecode(jsonAsString)["virusQuestions"] as List;
List<Virus> virus =
    items.map((game) => Virus.fromJson(game)).toList();

const jsonAsString = '''
{
	"virusQuestions":
			[
  {
    "text": "PLAYER ist unsichtbar, es ist allen verboten ihn/sie anzugucken oder anzusprechen",
    "aufloser": "PLAYER ist wieder sichtbar!"
  },
  {
    "text": "PLAYER Zeitansage! Du musst jede Minute die Uhrzeit ansagen. 2 Strafschlücke für jedes mal, wenn du es vergisst!",
    "aufloser": "PLAYER kann aufhören die Zeit anzusagen!"
  },
  {
    "text": "Dein rechter Nachbar darf dir einen Spitznamen geben. Jeder, der dich mit deinem richtigen Namen anspricht, trinkt jeweils einen Schluck.",
    "aufloser": "PLAYER darf wieder normal angesprochen werden."
  },
  {
    "text": "Alle Mitspieler dürfen PLAYER keine Fragen beantworten. Jeder, der antwortet muss einen Schluck trinken.",
    "aufloser": "PLAYERs Fragen dürfen wieder beantwortet werden."
  },
   {
    "text": "Du bekommst die Penis-Karte. Irgendwann im Laufe des Spiels, drarfst du Penis schreien. Der letzte, der dann auch Penis schreit, muss sein Getränk exen. ",
    "aufloser": "PLAYERs Fragen dürfen wieder beantwortet werden."
  },
  {
    "text": "PLAYER, darf nur noch mit Links trinken. Für jeden Schluck mit der rechten Hand, trinkst du noch einen Extra-Schluck.",
    "aufloser": "PLAYER darf wieder mit Rechts trinken."
  },
  {
    "text": "PLAYER, der Boden ist Lava! Berühren deine Füße den Boden, musst du 5 Schlücke trinken.",
    "aufloser": "PLAYER darf wieder den Boden berühren."
  },
  {
    "text": "PLAYER, ist Zoodirektor. Du kannst jeder Zeit jemanden bestimmen, der/ die ein von dir gewähltes Tiergeräusch nachmachen muss.",
    "aufloser": "PLAYER ist kein Zoodirektor mehr!"
  },
  {
    "text": "PLAYER, du bist für die nächsten zwei Runden die Dancing Queen. Fängst du an zu tanzen, müssen alle mittanzen. Der Letzte bekommt 2 Strafschlücke.",
    "aufloser": "PLAYER ist nicht mehr due Dancing Queen."
  }
]
}
''';
