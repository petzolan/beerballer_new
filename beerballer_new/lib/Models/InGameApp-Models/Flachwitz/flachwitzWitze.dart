import 'dart:convert';
import 'package:beerballer_new/Models/InGameApp-Models/Flachwitz/jokes.dart';

class FlachwitzWitze {}

var items = jsonDecode(jsonAsString)["jokes"] as List;
List<Jokes> jokes =
    items.map((game) => Jokes.fromJson(game)).toList();

const jsonAsString = '''
{
	"jokes":
			[
	{
		"text": "An der Zürcher Langstrasse wurde gestern ein Sarg gefunden. Man hat ihn aber nicht öffnen können. War wohl ein Zuhälter drin."
	},
	{
		"text": "Ein Stein und ein Brett treffen aufeinander. Sagt der Stein «Ich bin ein Stein». Sagt das Brett: «Wenn du ein Stein bist, bin ich Brett Pitt.»"
	},
	{
		"text": "Sagt der Pessimist: «Schlimmer gehts nicht!». Darauf der Optimist: «Doch!»"
	},
	{
		"text": "Wie nennt man ein Rudel aggressiver Wölfe? Wolfgang."
	},
	{
		"text": "Warum können Skelette schlecht lügen? Weil sie leicht zu durchschauen sind."
	},
	{
		"text": "Woraus wurde Jesus' Haus gebaut? Aus Jerusa-Lehm."
	},
	{
		"text": "Was lebt in der Savanne und ist immer sauber? Eine Hygiäne."
	},
	{
		"text": "Wie heisst ein Spanier ohne Auto? Carlos."
	},
	{
		"text": "Kommt ein Einarmiger in einen Secondhandladen."
	},
    {
		"text": "Was passiert, wenn man Cola und Bier gleichzeitig trinkt? Man colabiert."
	},
    {
		"text": "Nach einer langen Partynacht mit Schuhen im Bett aufwachen - der gestiefelte Kater."
	},
    {
		"text": "Hab gestern versucht, einem Rothaarigen Witze über Rothaarige zu erzählen. Er fand es nicht so lustig und dann Ginger."
	},
    {
		"text": "Ich habe beim Bäcker angerufen, doch da ging nur die Mehlbox dran."
	},
    {
		"text": "Hab gehört Bushido will AirBerlin kaufen. Die neue Fluggesellschaft soll dann Airsguterjunge heißen."
	},
    {
		"text": "Neben mir wohnt eine indische Familie. Mir ist gerade erst aufgefallen, dass ihr WLAN „Indernet“ heißt."
	},
    {
		"text": "Da ich immer hungrig bin, habe ich mir nun Spaghetti um den Wecker gewickelt. So habe ich endlich rund um die Uhr essen."
	},
    {
		"text": "„Ich hab jetzt schon tagelang nicht mehr geschlafen“ – „Bist du da nicht total am Ende?“ – „Nein, nachts schlaf ich ja gut.“"
	},
    {
		"text": "Hab mir Sorgen um meine Freundin gemacht. Sie schmiert mir Senf ins Gesicht und fragt: „Biste jetzt besenftigt?“"
	},
    {
		"text": "Was ist schwarz-weiß und sitzt auf der Schaukel? – Ein Schwinguin."
	},
    {
		"text": "Wie nennt man ein helles Mammut? – Hellmut."
	},
    {
		"text": "Was haben Frauen und Handgranaten gemeinsam? – Wenn du den Ring abziehst, ist dein Haus weg."
	},
    {
		"text": "Was ist gesund und kräftig und spielt den Beleidigten? – Ein Schmollkornbrot."
	},
    {
		"text": "Ich habe einen Joghurt fallen gelassen. Er war nicht mehr haltbar."
	},
    {
		"text": "Wisst ihr was der Hammer ist? – Ein Werkzeug."
	},
    {
		"text": "Sie: „Und was ist so dein Lieblingsfilm?“ Er: „Tesafilm ist ein echt guter Streifen.“"
	},
    {
		"text": "Ich esse nicht jede Sorte Chips. Ich bin da sehr pringelig."
	},
    {
		"text": "Meine Oma ist jetzt Türsteher, wir nennen sie nun Hilde-Guard."
	},
    {
		"text": "Was ist süß und hangelt sich von Tortenstück zu Tortenstück? – Ein Tarzipan."
	},
    {
		"text": "Welches Getränk trinken Firmenchefs? — Leitungswasser"
	},
    {
		"text": "Was sagt ein Origami-Lehrer zu seinem Schüler? — „Das kannste knicken.“"
	},
    {
		"text": "Was ist gelb und schießt? Eine Banone!"
	},
    {
		"text": "Wie heißt das intelligenteste Gemüse? — Schlaubergine."
	},
    {
		"text": "Was ist groß, grau und kann telefonieren? — Ein Telefant"
	},
    {
		"text": "Was ist gelb und hüpft durch den Wald? — Der Postfrosch"
	},
    {
		"text": "Sagt der Pessimist „Schlimmer geht nicht!“ — Sagt der Optimist: „Doch!“"
	},
    {
		"text": "Was bestellt ein Maulwurf im Restaurant? — Ein Drei-Gänge-Menü."
	},
    {
		"text": "Wie nennt man den Flur eines Iglus? — Eisdiele!"
	},
    {
		"text": "Was macht ein schwuler Wurm im Salat? — Er schmeisst die Schnecken raus."
	},
    {
		"text": "Lehrer:  „Ich sehe heute viele die nicht da sind“"
	},
    {
		"text": "Der Polizist zum Autofahrer: „Ich muss sie mit zum Alkoholtest nehmen!“ — „Prima. In welcher Kneipe fangen wir an?“"
	},
    {
		"text": "Wie heißen dem Jesus seine Fußballschuhe? — Die Christstollen"
	},
    {
		"text": "Wenn ich kommentiere, dann kommen Tiere."
	},
    {
		"text": "Was schmeckt wie Zucker und kann singen? — Stevia Naidoo."
	},
    {
		"text": "Was sagt ein Betrunkener, der sich noch nicht entschieden hat? — Ich schwanke noch!"
	},
    {
		"text": "Jemand schlägt auf einen Förderturm ein. Warum? — Er will die Zeche prellen!"
	},
    {
		"text": "Was macht ein Wikinger auf einem Eisberg? Frieren."
	},
    {
		"text": "Nachts, wenn alles schläft, ist meist keiner mehr wach"
	},
    {
		"text": "Einen Ball zu treten ist eine Sache; ihn zu knuddeln eine ganz andere."
	},
    {
		"text": "Nach dem Sex: „Woran denkst du?“ — „Kennst du nicht.“"
	},
    {
		"text": "Sagt der Hefeteig zu seinem Freund: „Also ich weiß nicht, wie's bei dir ist, aber ich geh in meiner Arbeit so richtig auf!“"
	},
    {
		"text": "Was ist grün und wird auf Knopfdruck rot? Ein Frosch im Mixer"
	},
    {
		"text": "Sag mal, ist dieser Fisch immer so nervig? — Ja er ist ein Stör!"
	},
    {
		"text": "Was sitzt im Baum und weint? — Eine Heule."
	},
    {
		"text": "Wie heißt der vegetarische Bruder von Bruce Lee? — Brocco Lee."
	},
    {
		"text": "Was ist das Leibgericht der Elektriker? — Kabeljau."
	}
]
}
''';
