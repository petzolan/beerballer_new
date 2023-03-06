import 'dart:convert';
import 'package:beerballer_new/Models/InGameApp-Models/Flachwitz/jokes.dart';

class IchHabNochNie {}

var items = jsonDecode(jsonAsString)["ichHabNochNieFragen"] as List;
List<Jokes> ichHabNochNieFragen =
    items.map((game) => Jokes.fromJson(game)).toList();

const jsonAsString = '''
{
	"ichHabNochNieFragen":
			[
	{
		"text": "... längliche Lebensmittel (Gurke, Karotte etc.) zur Selbstbefriedigung benutzt."
  },
	{
		"text": "... im Suff ein Straßenschild geklaut."
	},
	{
		"text": "... beim Sex gedacht “wann ist es endlich vorbei”"
	},
	{
		"text": "... Ich hab mir noch nie besoffen etwas gebrochen."
	},
	{
		"text": "... einen Anruf eines Elternteils weggedrückt, weil ich gerade Sex hatte"
	},
	{
		"text": "... über die Anzahl meiner Sexualpartner gelogen"
	},
	{
		"text": "... schon beim Vortrinken gekotzt."
	},
	{
		"text": "... Probleme mit der Polizei gehabt."
	},
	{
		"text": "... die Bar verlassen, ohne zu bezahlen."
	},
    {
		"text": "... jemanden wegen seines Penis ausgelacht."
	},
    {
		"text": "... mehr als eine Packung Kippen an einem Abend geraucht."
	},
    {
		"text": "... mit einer minderjährigen Person geschlafen (als ich selbst bereits über 18 war)."
	},
    {
		"text": "... Drogen gekauft."
	},
    {
		"text": "... eine Person, die ich kenne, auf einer Pornoseite gesehen."
	},
    {
		"text": "... anderen beim Sex zugehört/zugeschaut."
	},
    {
		"text": "...  einen Porno geguckt, bei dem ich danach gedacht hab “was ist verkehrt mit mir”."
	},
    {
		"text": "... jemandem auf die Füße geguckt und fand es geil."
	},
    {
		"text": "... Sex mit dem/der Ex gehabt."
	},
    {
		"text": "... harte Drogen genommen (Koks, MDMA, LSD etc.)."
	},
    {
		"text": "... nie krankgemeldet, weil ich keinen Bock auf meine Arbeit hatte."
	},
    {
		"text": "... nie auf ein Date eingelassen, einfach aus dem Grund, weil ich nicht bezahlen wollte."
	},
    {
		"text": "... eine Hausarbeit abgegeben, die ich eigentlich nicht selbst geschrieben habe."
	},
    {
		"text": "... meine(n) PartnerIn betrogen."
	},
    {
		"text": "... gestrippt."
	},
    {
		"text": "... ein oder mehrere Kleidungsstücke bei meinem ONS vergessen."
	},
    {
		"text": "... versucht auf TikTok viral zu gehen."
	},
    {
		"text": "... nach einer wilden Nacht irgendwo draußen aufgewacht."
	},
    {
		"text": "... morgens, mittags und abends Essen bestellt, weil ich zu faul zum Kochen war."
	},
    {
		"text": "... von einem Alkohol so hart gekotzt, dass ich ihn bis heute nicht trinken kann."
	},
    {
		"text": "... betrunken Auto gefahren ."
	},
    {
		"text": "... (Ich wurde noch nie) nicht in den Club gelassen, weil ich zu voll war"
	}
]
}
''';
