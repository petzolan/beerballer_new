import 'dart:convert';
import 'package:beerballer_new/Models/InGameApp-Models/Sch%C3%A4tzen/guessingQuestion.dart';

class GuessingQuestions {}

var items = jsonDecode(jsonAsString)["guessingQuestions"] as List;
List<GuessingQuestion> guessingQuestions =
    items.map((game) => GuessingQuestion.fromJson(game)).toList();

const jsonAsString = '''
{
	"guessingQuestions":
			[
	{
		"text": "Wie viele Buchstaben hat der längste Ortsname in Europa?",
		"answer": "58"
	},
	{
		"text": "Wie viel Prozent aller Notfallpatienten in Deutschland sind alkoholisiert?",
		"answer": "ca. 50%"
	},
	{
		"text": "Wie viele Deutsche heißen mit Nachnamen Schimmelpfennig?",
		"answer": "3.130"
	},
	{
		"text": "Der Kosmonaut Waleri Poljakow verbrachte die längste Zeit am Stück im All. Wie viele Tage?",
		"answer": "438"
	},
	{
		"text": "Bei welcher Höhe liegt der Weltrekord für den höchsten Sprung eines Schweins?",
		"answer": "70 cm"
	},
	{
		"text": "Wie hoch ist die durchschnittliche Lebenserwartung eines neugeborenen Jungen in Deutschland?",
		"answer": "77,2 Jahre"
	},
	{
		"text": "Der Spielfilm `Ghandi` ist der Film mit den meisten Statisten aller Zeiten. Wie viele sind in der Schlussszene zu sehen?",
		"answer": "300.000"
	},
	{
		"text": "Wie viel Liter Wasser werden zur Herstellung eines Liters Coca-Cola benötigt?",
		"answer": "2,6 Liter"
	},
	{
		"text": "Wie viele Entscheidungen trifft ein Mensch pro Tag?", 
		"answer": "20.000"
	},
    {
		"text": "Wie viele Ergebnisse liefert die Suche nach dem Wort Liebe bei Google?", 
		"answer": "ca. 109.000.000"
	},
    {
		"text": "Wie viele Münz- und Karten-Telefonzellen gibt es noch in Deutschland?",
		"answer": "23.000"
	},
    {
		"text": "Wie viele Einweg-Kaffeebecher werden in Deutschland pro Stunde entsorgt?", 
		"answer": "300.000"
	},
    {
		"text": "Was ist die Höchstgeschwindigkeit für Rolltreppen in der EU?",
		"answer": "2,7 km/h"
	},
    {
		"text": "Wie lange dauert der längste Linienflug der Welt?",
		"answer": "17 Stunden und 30 Minuten"
	},
    {
		"text": "Mit welcher Geschwindigkeit niest der Mensch?",
		"answer": "Über 160 km/h"
	},
    {
		"text": "Wieviele Legosteine bräuchte man für einen Turm von der Erde bis zum Mond?",
		"answer": "40 Milliarden"
	},
    {
		"text": "Wie viel Zeit verbringen Deutsche in ihrem Leben durschnittlich im Supermarkt?",
		"answer": "2 Jahre"
	},
    {
		"text": "Wie schwer kann eine Schönwetterwolke werden?",
		"answer": "bis zu 1.000 Tonnen"
	},
    {
		"text": "Wie viele Entenarten gibt es auf der Welt?", 
		"answer": "150"
	},
    {
		"text": "Wie viele Tage verbringt ein Deutscher in seinem Leben durchschnittlich auf dem Klo?",
		"answer": "230 Tage"
	},
    {
		"text": "Wie viele Sprachen werden auf der Welt gesprochen?",
		"answer": "6.500"
	},
    {
		"text": "Wie oft schauen wir pro Tag durchschnittlich auf das Handy?",
		"answer": "88 mal"
	},
    {
		"text": "Wie lange halten Ehen im Schnitt?",
		"answer": "15 Jahre"
	},
    {
		"text": "In welchen Jahr fand die Markteinführung der Playmobilfiguren statt?",
		"answer": "1974"
	},
    {
		"text": "Wie viele Stunden Videomaterial werden pro Minute weltweit bei Youtube hochgeladen?",
		"answer": "48 Stunden"
	},
    {
		"text": "Wie viele Weihnachtsbäume werden in Deutschland pro Jahr verkauft?",
		"answer": "30 Millionen"
	},
    {
		"text": "Wie viel Liter Bier werden in Deutschland pro Kopf jährlich getrunken?",
		"answer": "100 Liter Bier"
	},
    {
		"text": "Wie viele Würfelzucker sind in einem Liter Cola?",
		"answer": "33"
	},
    {
		"text": "Wie tief ist der Bodensee an seinem tiefsten Punkt?",
		"answer": "251 Meter"
	},
    {
		"text": "Wie hoch ist der Weltrekord im Dauerjodeln?",
		"answer": "15 Stunden und 11 Sekunden"
	},
    {
		"text": "Bei wie vielen Stunden liegt der Weltrekord im Wachbleiben?",
		"answer": "266 Stunden"
	},
    {
		"text": "Wie viele Liter Wasser kann ein Kamel in 15 Minuten zu sich nehmen und speichern?",
		"answer": "200 Liter"
	},
    {
		"text": "Wie hoch ist der Anteil des weltweiten Datenübertragungsvolumens der Sexindustrie?",
		"answer": "30%"
	},
    {
		"text": "Wie viele Entenarten gibt es auf der Welt?", 
		"answer": "150"
	},
    {
		"text": "Wie viele Kilokalorien hat ein Big Mac?", 
		"answer": "495 kcal"
	},
    {
		"text": "Wie hoch ist das Durchschnittsalter in Uganda?", 
		"answer": "15 Jahre"
	},
    {
		"text": "Wie viele Eier legt eine gute Legehenne pro Jahr?", 
		"answer": "290"
	},
    {
		"text": "Wie viele Tage seines Lebens verbringt ein Mann durchschnittlich mit rasieren?", 
		"answer": "140"
	},
    {
		"text": "Wie viele Einwohner hat Australiens Hauptstadt Canberra?", 
		"answer": "351.000"
	},
    {
		"text": "Wann wurde der FC Sheffield, der älteste heute noch existierende Fußballclub der Welt, gegründet?", 
		"answer": "1857"
	},
    {
		"text": "Bei wie vielen Stunden steht der aktuelle Rekord im Dauerbügeln?", 
		"answer": "58"
	},
    {
		"text": "Wie viele Sätze spricht Arnold Schwartenegger im ersten Teil von Terminator?", 
		"answer": "17"
	},
    {
		"text": "Wie viele Fragen stellt ein 4-jähriges Kind ca. jeden Tag?", 
		"answer": "400"
	},
    {
		"text": "Wie viele Muskeln hat der menschliche Körper?", 
		"answer": "656"
	},
    {
		"text": "Wie viele Blüten müssen Bienen für ein Kilo Honig anfliegen?", 
		"answer": "4 Millionen"
	},
    {
		"text": "Wie viele Radfahrer missachten in Münster pro Tag eine rote Ampel?", 
		"answer": "13.000"
	},
    {
		"text": "Wie viele Liter Tränen vergießt ein Mensch im Laufe seines Lebens durchschnittlich?", 
		"answer": "80 Liter"
	},
    {
		"text": "Bis wie viel Kilogramm geht das `Minifliegengewicht`, die leichteste Gewichtsklasse beim Boxen?", 
		"answer": "bis 47,627 kg"
	},
    {
		"text": "Wie viele Selbstporträts malte Rembrandt ungefähr?", 
		"answer": "60"
	},
    {
		"text": "Wie viele Zimmer hat das weiße Haus?", 
		"answer": "132"
	},
    {
		"text": "Wie viele Milliarden SMS wurden 2009 in Deutschland verschickt?", 
		"answer": "34,4 Mrd"
	},
    {
		"text": "Wie oft grillt jeder Deutsche durchschnittlich im Jahr?", 
		"answer": "13"
	},
    {
		"text": "Wie laut in Dezibel war der lauteste jemals gemessene Schrei eines Menschen?", 
		"answer": "129 dB"
	},
    {
		"text": "Wie viele Quadratkilometer erstreckt sich das Great Barrier Reef?", 
		"answer": "345.000 km²"
	},
    {
		"text": "Wie viele Ampeln gibt es in Bhutan?", 
		"answer": "0"
	},
    {
		"text": "Wie viel Prozent aller Gefangenen in Deutschland sind Frauen?", 
		"answer": "5,30%"
	},
    {
		"text": "Wie hoch ist das Brandenburger Tor (inklusive Quadriga)?", 
		"answer": "26 Meter"
	},
    {
		"text": "Wie oft grillt jeder Deutsche durchschnittlich im Jahr?", 
		"answer": "13"
	},
    {
		"text": "Wie viel Jahre bräuchte man, um jedes Museum in Deutschland einen Tag lang zu besuchen?", 
		"answer": "16"
	},
    {
		"text": "Um wie viele Menschen wächst die Weltbevölkerung jeden Tag?", 
		"answer": "228.155"
	},
    {
		"text": "Wie viele ´Berlin´ gibt es in der USA?", 
		"answer": "29"
	},
    {
		"text": "Wie viele Prozent aller Menschen sind Rechtshänder?", 
		"answer": "88%"
	},
    {
		"text": "Bis in welches Jahr war Frauenfußball beim DFB nicht zugelassen?", 
		"answer": "1970"
	},
    {
		"text": "Bei der Geburt hat ein Mensch ca. 300 Knochen und Knorpel. Wie viele hat man als Erwachsener?", 
		"answer": "206"
	},
    {
		"text": "Wie viele cm schrumpfen Frauen zwischen dem 40. und dem 70. Lebensjahr?", 
		"answer": "ca. 5 cm"
	},
    {
		"text": "Wie viele Füße haben Tausendfüßler maximal?", 
		"answer": "680"
	},
    {
		"text": "Für wie viele Dollar wurde der `Swoosh`, das Logo von Nike, von der Grafikdesignstudentin Carolyn Davidson entworfen?", 
		"answer": "35 Dollar"
	},
    {
		"text": "Wie viel Gramm wiegt ein Kolibri?", 
		"answer": "2 Gramm"
	},
    {
		"text": "Wie viel Prozent der weltweiten Literatur zum Thema Steuern wurde auf Deutsch veröffentlicht?", 
		"answer": "70%"
	},
    {
		"text": "Wie groß ist die Mindestgröße für Gefängniszellen in Europa in m²?", 
		"answer": "7 m²"
	},
    {
		"text": "Wie viel Liter Muttermilch trink ein Blauwallkalb am Tag?", 
		"answer": "bis zu 600 Liter"
	},
    {
		"text": "Wie viele Meter unterhalb des Meeresspiegels liegt das Kaspische Meer, der größte See der Erde?", 
		"answer": "28 Meter"
	},
    {
		"text": "Wie viele Euro kostet eine Hochzeit in Deutschland im Schnitt?", 
		"answer": "ca. 14.800€"
	},
    {
		"text": "Wie viele Menschen leben in der Mongolei pro Quadratkilometer", 
		"answer": "1,6"
	},
    {
		"text": "Wie viele Kandidaten haben sich für die 4. Staffel von DSDS beworben?", 
		"answer": "28.597"
	},
    {
		"text": "Bei wie vielen Sekunden liegt der Weltrekord im 100 Meter Lauf der über Hundertjährigen?", 
		"answer": "30,86 Sekunden"
	},
    {
		"text": "Wie hoch ist der höchste Berg Deutschlands, die Zugspitze?", 
		"answer": "2.962 Meter"
	},
    {
		"text": "Wie hoch ist der höchste Schornstein der Welt?", 
		"answer": "420 Meter"
	},
    {
		"text": "Wie viele Quadratkilometer groß ist Mikronesien?", 
		"answer": "702 km²"
	},
    {
		"text": "Wie hoch ist die Wahrscheinlichkeit, dass eine Frau Zwillinge gebärt?", 
		"answer": "1,8%"
	},
    {
		"text": "Wie viele Pkw waren am 01.01.2010 in Deutschland angemeldet?", 
		"answer": "41,7 Millionen"
	},
    {
		"text": "Wie hoch war die schnellste je mit einem Fahrrad gefahrene Geschwindigkeit?", 
		"answer": "268,8 km/h"
	},
    {
		"text": "Wie hoch ist die Wahrscheinlichkeit für einen Zwilling beim Poker?", 
		"answer": "42,30%"
	},
    {
		"text": "Wie viel Liter Wasser sind nötig, um das Rindfleisch für einen Hamburger zu erzeugen?", 
		"answer": "2.400 Liter"
	},
    {
		"text": "Wie viele Punkte darf jedes Land beim Eurovision Song Contest insgesamt verteilen?", 
		"answer": "58"
	},
    {
		"text": "Bei wie vielen Metern Tiefe liegt der Weltrekord im Tauchen ohne Sauerstoffgerät?", 
		"answer": "214 Meter"
	},
    {
		"text": "Wie viele Kilokalorien enthält eine Portionn Fish 'n Chips durchschnittlich?", 
		"answer": "ca. 1.000 kcal"
	},
    {
		"text": "Wie schnell war der härteste bisher gemessene Tennisaufschlag?", 
		"answer": "249,4 km/h"
	},
    {
		"text": "Wie oft wurde das Bundesverdienstkreuz bisher verliehen?", 
		"answer": "ca. 240.000 Mal"
	},
    {
		"text": "Zu wie viel Prozent besteht das menschliche Gehin aus Wasser?", 
		"answer": "80%"
	},
    {
		"text": "Wie viele Fahrräder werden durchschnittlich pro Jahr in der deutschen Fahrradhauptstadt Münster gestohlen?", 
		"answer": "5.400"
	},
    {
		"text": "Wie hoch ist der gesetzlich festgelegte Anteil an Fischgehalt pro Fischstäbchen?", 
		"answer": "65%"
	},
    {
		"text": "Wie viele Bakterienarten werden bei einem Zungenkuss ausgetauscht?", 
		"answer": "ca. 250"
	},
    {
		"text": "Wie viele Euro werden jährlich in den Tevi-Brunnen in Rom geworfen?", 
		"answer": "ca. 100.000€"
	},
    {
		"text": "Wie oft wurde das Bundesverdienstkreuz bisher verliehen?", 
		"answer": "ca. 240.000 Mal"
	},
    {
		"text": "Wie viele Stunden hielt es Weltrekordhalter Tony Wright ohne Schlaf aus?", 
		"answer": "266 Stunden"
	},
    {
		"text": "Wie schnell kann ein aus der Flasche herausploppender Sektkorken werden?", 
		"answer": "ca. 40 km/h"
	},
    {
		"text": "Wie viel wiegt ein neugeborenes Kängeru?", 
		"answer": "ca. 1 Gramm"
	},
    {
		"text": "Wie viele Inseln liegen in der Archipel Südostasiens?", 
		"answer": "ca. 20.000"
	},
    {
		"text": "Wie lang ist die längste Brücke der Welt?", 
		"answer": "164.800 Kilometer"
	},
    {
		"text": "Wie lange hing ein Gemälde von Henri Matrisse 1961 im Museum of Modern Art verkehrt herum, bevor es jemandem auffiel?", 
		"answer": "47 Tage"
	},
    {
		"text": "Wie viele Frauen küsst James Bond durchschnittlich pro Film?", 
		"answer": "3"
	},
    {
		"text": "Wie viele Staaten gibt es auf der Erde?", 
		"answer": "195"
	},
    {
		"text": "Wie lange dauerte der 100 jährige Krieg?", 
		"answer": "116 Jahre"
	},
    {
		"text": "Wie teuer ist `Clive Christian No 1`, das teuerste Parfüm der Welt, in 500 ml `Imperial Majesty`-Flakon?", 
		"answer": "116 Jahre"
	},
    {
		"text": "Wie viele Grashalme wachsen auf einem Fußballplatz?", 
		"answer": "178.500.000"
	},
    {
		"text": "Wie alt ist die Erde?", 
		"answer": "4,472 Mrd. Jahre"
	},
    {
		"text": "Wieviele aktive Nutzer hatte Facebook 2018?", 
		"answer": "1,3 Mrd."
	},
    {
		"text": "Wie viele Quadratmeter ist die USA groß?", 
		"answer": "9.834.000 qm"
	},
    {
		"text": "Wie lange braucht man, um bis zu einer Millarde zu zählen?", 
		"answer": "80 Jahre"
	},
    {
		"text": "Wie alt wurde der älteste Mensch?", 
		"answer": "122 Jahre und 164 Tage"
	},
    {
		"text": "Wie viele Prozent der Menschen sind bereit mit dem Flugzeug geflogen?", 
		"answer": "ca. 5%"
	},
    {
		"text": "Wie lange würde es dauern auf dem Äquator um die Erde zu spazieren?", 
		"answer": "557 Tage"
	},
    {
		"text": "Wie weit ist der Mond von der Erde entfernt?", 
		"answer": "384.400 Kilometer"
	},
    {
		"text": "Wie viele Tonnen Plastik landen pro Jahr in den Meeren?", 
		"answer": "10 Millionen Tonnen"
	},
    {
		"text": "Wie viel Prozent der Menschen leben in Asien?", 
		"answer": "60%"
	},
    {
		"text": "Wie lang ist das gesamte deutsche Straßennetz?", 
		"answer": "644.000 Kilometer"
	},
    {
		"text": "Wie viele Miglieder hat Paarship weltweit 2018?", 
		"answer": "11 Millionen"
	},
    {
		"text": "Wann wurde das erste FIFA Spiel veröffentlicht?", 
		"answer": "1993"
	},
    {
		"text": "Wie oft pro Jahr zwinkert ein durchschnittlicher Mensch pro Jahr?", 
		"answer": "über 84 Mio. mal"
	},
    {
		"text": "Wie lange ist eine ausgerollte Toilettenpapierrolle?", 
		"answer": "30 Meter"
	},
    {
		"text": "Wie viel Prozent der Weltbevölkerung hat noch nie telefoniert?", 
		"answer": "53%"
	},
    {
		"text": "Wie viele Hunde gibt es auf der Erde?", 
		"answer": "500 Millionen"
	},
    {
		"text": "Der wievielte amerikanische Präsident ist Trump?", 
		"answer": "45te"
	},
    {
		"text": "Wie viel Gramm Zucker hat ein Liter Coca Cola?", 
		"answer": "106 Gramm"
	}
]
}
''';
