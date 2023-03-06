import 'dart:convert';
import 'package:beerballer_new/Models/InGameApp-Models/Wer%20w%C3%BCrde%20eher/whoWoulQuestion.dart';

class WhoWould {}

var items = jsonDecode(jsonAsString)["whoWould"] as List;
List<WhoWoulQuestion> whoWould =
    items.map((game) => WhoWoulQuestion.fromJson(game)).toList();

const jsonAsString = '''
{
	"whoWould":
			[
	{
		"text": "niemals Emotionen fühlen oder niemals Emotionen zeigen können?"
	},
	{
		"text": "wollen, dass jede Katze, die verloren geht, in deiner Wohnung landet oder alle Socken, die in der Waschmaschine verloren gehen, zu dir nach Hause teleportiert werden?"
	},
	{
		"text": "jetzt 1 Millionen Euro bekommen oder in 10 Jahren 10 Millionen?"
	},
	{
		"text": "70% mehr Geld verdienen oder nur noch die Hälfte arbeiten müssen?"
	},
	{
		"text": "unglaublich reich sein, aber an Depressionen leiden oder arm und glücklich sein?"
	},
	{
		"text": "die Zeit zurückspulen oder vorspulen?"
	},
	{
		"text": "wissen wollen, wann du stirbst oder wie du stirbst?"
	},
	{
		"text": "den Klimawandel stoppen oder alle Kriege auf der Erde beenden?"
	},
	{
		"text": "ein Fisch oder ein Vogel sein?"
	},
    {
		"text": "den Welthunger beenden oder jeden Menschen auf der Erde eine kostenlose Gesundheitsversorgung bieten?"
	},
    {
		"text": "den Präsidenten oder den Papst töten?"
	},
    {
		"text": "dein ganzes Geld oder alle deine Fotos verlieren?"
	},
    {
		"text": "die Zukunft oder die Vergangenheit verändern können?"
	},
    {
		"text": "auswandern und nie mehr zurückkommen oder nie mehr verreisen dürfen?"
	},
    {
		"text": "eine Wohltätigkeitsorganisation verklagen und gewinnen oder eine korrupte Organisation verklagen und verlieren?"
	},
    {
		"text": "in Isolation leben oder dich einmal im Monat deiner größten Angst stellen?"
	},
    {
		"text": "nie mehr ein Buch lesen oder nie mehr Musik hören?"
	},
    {
		"text": "deinen besten Freund wegen eines Verbrechens, das er begangen hat, verraten, oder wegen des Verbrechens, das ein Fremder begangen hat, ins Gefängnis gehen?"
	},
    {
		"text": "eine erfüllte Karriere oder ein erfülltes Sexleben haben?"
	},
    {
		"text": "Krebs heilen oder den Hunger in Afrika besiegen?"
	},
    {
		"text": "eine unschuldige Person töten oder fünf Personen, die geringfügige Verbrechen begangen haben?"
	},
    {
		"text": "der Erste oder der Letzte sein, der von deinen Freunden stirbt?"
	},
    {
		"text": "an Gott glauben oder auf Gott verzichten und Milliardär sein?"
	},
    {
		"text": "viel Geld verdienen in einem Job, den du hasst oder wenig verdienen in einem Job, den du liebst?"
	},
    {
		"text": "extrem intelligent sein oder von jedem Menschen auf der Erde verehrt werden?"
	},
    {
		"text": "die Gedanken von allen Menschen lesen oder andere Menschen mit deinen Gedanken manipulieren können?"
	},
    {
		"text": "in einer Beziehung mit jemandem sein, der nie diskutiert, oder mit jemandem, der dich nie umarmt?"
	},
    {
		"text": "ein Kind haben, das extrem intelligent, aber unsozial ist, oder ein Kind, das nicht das klügste, aber sehr sozial und freundlich ist?"
	},
    {
		"text": "einen Partner haben, der von dir besessen ist oder dich betrügt?"
	},
    {
		"text": "vergessen, wer du bist oder wer alle anderen in deinem Leben sind?"
	},
    {
		"text": "für Sex bezahlen oder für Sex bezahlt werden?"
	},
    {
		"text": "mit deinen Freunden eine Orgie feiern oder mit Fremden, die du nie wieder siehst?"
	},
    {
		"text": "beim Betrügen erwischt werden oder deinen Partner beim Betrügen erwischen?"
	},
    {
		"text": "einen Lapdance geben oder einen bekommen?"
	},
    {
		"text": "mit einer älteren oder einer jüngeren Person schlafen?"
	},
    {
		"text": "einen Harry Potter-Marathon oder einen Herr der Ringe-Marathon schauen?"
	},
    {
		"text": "ein Superheld oder ein Bösewicht sein?"
	},
    {
		"text": "ein Leben lang mit deiner großen Liebe zusammen sein oder ein Leben lang reich sein?"
	},
    {
		"text": "deinen Schlüssel oder dein Handy verlieren?"
	},
    {
		"text": "mit jemandem verheiratet sein, den du nicht liebst, oder der dich nicht liebt?"
	},
    {
		"text": "nie mehr eine Hose tragen können oder nie mehr ein Oberteil?"
	},
    {
		"text": "jeden Tag dasselbe essen oder jeden Tag etwas anderes essen für den Rest deines Lebens?"
	},
    {
		"text": "alle Sprachen oder alle Tiere verstehen können?"
	},
    {
		"text": "Dinge real werden lassen, indem du sie zeichnest oder Dinge verschwinden lassen, indem du sie einfach wegradierst?"
	},
    {
		"text": "eine Nacktschnecke oder eine Giraffe als Haustier halten?"
	},
    {
		"text": "Dauerhaft singen oder dauerhaft tanzen müssen?"
	},
    {
		"text": "Sterben, wenn du nicht alle 12 Stunden einer Person einen Klaps auf den Hintern gibst, oder sterben, wenn du nicht alle zwei Jahre jemanden tötest?"
	},
    {
		"text": "menschlichen Kot recyceln oder mit gefährlichen und explosiven Chemikalien arbeiten?"
	},
    {
		"text": "mit deinem Chef schlafen, um befördert zu werden oder auf die Beförderung verzichten?"
	},
    {
		"text": "Einen Tag mit einem geliebten verstorbenen verbringen oder einen Tag im Jahr 3001 erkunden?"
	},
    {
		"text": "Nur Wasser trinken oder nie wieder Kekse essen?"
	},
    {
		"text": "10 Jahre obdachlos sein und dann für immer reich oder immer in der unteren Mittelklasse sein?"
	},
    {
		"text": "deinem Chef oder deinen Eltern ein Sexy Pic schicken?"
	},
    {
		"text": "bevorzugen, dass alle Pflanzen schreien, wenn du sie schneidest oder alle Tiere um ihr Leben betteln, bevor sie getötet werden?"
	},
    {
		"text": "jedes Mal, wenn du eine Seite umblätterst, einen Schnitt am Finger bekommen oder dir bei jedem essen auf die Zunge beißen? (Von jetzt an werde ich nur noch E-Books lesen )"
	},
    {
		"text": "dein Handy zerstören oder deinen besten Freund schlagen?"
	},
    {
		"text": "mit jemandem schlafen der sich nicht die Zähne putz oder mit jemandem der sich nicht wäscht?"
	},
    {
		"text": "alle deine Schamhaare mit einer Pinzette entfernen oder einen Fingernagel mit einer Zange herausziehen?"
	},
    {
		"text": "dein Google-Suchverlauf oder deine WhatsApp-Chatverläufe allen zeigen?"
	}
]
}
''';
