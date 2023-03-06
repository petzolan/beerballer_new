import 'dart:convert';
import 'package:beerballer_new/Models/InGameApp-Models/Flachwitz/jokes.dart';

class Piccolo {}

var items = jsonDecode(jsonAsString)["piccoloAufgaben"] as List;
List<Jokes> piccoloAufgaben =
    items.map((game) => Jokes.fromJson(game)).toList();

const jsonAsString = '''
{
	"piccoloAufgaben":
			[
	{
		"text": "Der/die Erste, der/die die Füße von PLAYER berührt verteilt 5 Schlücke"
  },
	{
		"text": "PLAYER, gib 2 Strafen der Person, die du am besten kennst"
	},
	{
		"text": "Alle Personen, die älter als 19 sind müssen trinken”"
	},
	{
		"text": "Es ist nicht mehr erlaubt, Namen zu nennen, nur noch Spitznamen"
	},
	{
		"text": "Der letzte, der seine Hände nach oben wirft trinkt"
	},
	{
		"text": "Alle, die mehr Beziehungen als One-Night-Stands hatten müssen trinken"
	},
	{
		"text": "PLAYER, poste ein Gruppenfoto in deiner Instagram Story und markiere @beerballer "
	},
	{
		"text": "PLAYER, trinke die Anzahl an Schlücke des Altersunterschieds zwischen dir und der ältersten Person, mit der du geschlafen hast. "
	},
	{
		"text": "PLAYER, würdest du lieber Sex mit einer Ziege haben, ohne dass es jemand weiß oder keinen Sex mit einer Ziege haben, aber jeder denkt, dass du es getan hast"
	},
    {
		"text": "Die letzte Person, die den Boden berührt trinkt zwei"
	},
    {
		"text": "PLAYER, würdest du lieber die Liebe deines Lebens treffen oder im Lotto gewinnen?"
	},
    {
		"text": "Alle die kleiner sind als 1,70 bekommen 2 Strafschlücke"
	},
    {
		"text": "Die erste Person, die etwas Weißes im Raum findet darf zwei Strafschlücke verteilen."
	},
    {
		"text": "PLAYER beginnt ein Lied zu singen, der Reihe nach muss jeder das Lied weitersinden, bis jemand verliert und zwei Strafschlücke bekommt"
	},
    {
		"text": "PLAYER, zeige die letzten 5 Fotos von deiner Galerie oder trinke fünf Strafschlücke"
	},
    {
		"text": "Lieber Huhn oder Rind? Alle stimmen gleichzeitig ab, die Verlierer bekommen 3 Strafshots "
	},
    {
		"text": "Lieber alle Spinnen und Insekten mit einem Blick töten oder eine Flamme am Zeigefinger aufflammen lassen können? Wählt gleichzeitig, die Verlierer erhalten 4 Strafschlücke."
	},
    {
		"text": "Hast du dich schon einmal epiliert? Wählt gleichzeitig, die Verlierer erhalten 2 Strafschlücke."
	},
    {
		"text": "Nennt nacheinander Begriffe zum Thema 'Computerteile'. PLAYER beginnt. Der Verlierer erhält 2 Strafschlücke."
	},
    {
		"text": "Alle, die noch nie zuvor Beer Pong gespielt haben, bekommen 4 Strafschlücke."
	},
    {
		"text": "Alle, die heute schon auf Youtube waren, bekommen 2 Schlücke."
	},
    {
		"text": "Alle, die heute schon auf Facebook waren, bekommen 2 Schlücke."
	},
    {
		"text": "Alle, die heute schon auf Tik Tok waren, bekommen 2 Schlücke."
	},
    {
		"text": "Alle, die heute schon auf BeReal waren, bekommen 2 Schlücke."
	},
    {
		"text": "Alle Frauen mit kurzen Haaren und Männer mit Glatze dürfen sich revanchieren. Verteilt jeweils 3 Schlücke."
	},
    {
		"text": "PLAYER Zeitansage! Du musst jede Minute die Uhrzeit ansagen. 2 Strafschlücke für jedes mal, wenn du es vergisst!"
	},
    {
		"text": "PLAYER, Wähle etwas, das du magst, alle Spieler, die das nicht mögen, bekommen 2 Strafschlücke. Wird keiner bestraft, bekommst du 3 Strafschlücke."
	},
    {
		"text": "PLAYER, Sag eine Qualität von jedem deiner Mitspieler und bekomme jedes Mal eine Strafe."
	},
    {
		"text": "PLAYER, Verteile so viele Strafen, wie du weiße Kleidungsstücke trägst "
	},
    {
		"text": "Bekomme 2 Strafschlücke, wenn du schon einmal schwarz gearbeitet hast"
	},
  {
		"text": "Zeigt die Uhr eine gerade Zeit an, erhalten alle Spieler 4 Schlück, ansonsten verteilt PLAYER 4 Schlücke"
	},
    {
		"text": "Buchstabiert den Nachnamen der Person, die links von dir sitzt. 2 Strafschlücke, wenn ihr einen Fehler macht. PLAYER beginnt."
	},
  {
		"text": "PLAYER verteilt so viele Schlücke, wie er/ sie Geschwister hat."
	},
    {
		"text": "Lieber ein Bankkonto mit 1 Milliarde Euro haben oder 3 Wünsche ohne Geld erfüllen? Stimmt gleichzeitig ab. Die Verlierer erhalten 5 Schlücke. "
	},
    {
		"text": "PLAYER, Mache ein Selfie mit einem Spieler deiner Wahl und trinke mit ihm 4 Schlücke."
	},
  {
		"text": "Alle die ein Samsung Handy haben, trinken 3 Schlücke."
	},
    {
		"text": "Alle, die heute schon Kaffee getrunken haben, dürfen 2 Schlücke verteilen."
	},
  {
		"text": "PLAYER, umarme eine Person, deiner Wahl und gönnt euch beide 4 Schlücke."
	},
    {
		"text": "Männerrunde! Alle Männer trinken einen Schluck."
	},
  {
		"text": "Mädelsrunde! Alle Frauen trinken einen Schluck."
	},
    {
		"text": "PLAYER, zwinge einen Raucher zwei seiner Zigaretten kaputt zu machen. Macht der Spieler es nicht, muss er 5 Schlücke trinken. Gibt es keinen Raucher, musst du selbst 5 Schlücke trinken."
	},
  {
		"text": "Wer als letztes eine Brust berührt, muss 2 Schlücke trinken."
	},
    {
		"text": "Jeder, der eine Jeans Hose trägt, darf 3 Schlücke verteilen."
	},
  {
		"text": "PLAYER, Du bist eine Runde lang immun und musst nichts trinken."
	},
    {
		"text": "PLAYER, wirf eine Münze. Bei Kopf verteilst du 5 Schlücke. Bei Zahl erhältst du die Schlücke. "
	},
  {
		"text": "PLAYER, denke dir eine Regel aus. Diese gilt bis zum Ende des Spiels. Wird diese gebrochen, muss der Spieler 3 Schlücke trinken. "
	},
    {
		"text": "Wer als letzter seinen Daumen auf dem Tisch hat, muss 4 Schlücke trinken."
	},
  {
		"text": "Alle, die eine kurze Hose tragen, dürfen 3 Schlücke verteilen. Hat keiner eine kurze Hose an, trinken alle 2 Schlücke."
	},
    {
		"text": "Alle, die schon einmal ein Tinder-Date hatten, dürfen 3 Schlücke verteilen."
	},
  {
		"text": "Zählt im Uhrzeigersinn bis 21. Jeder, der eine Zahl erwischt, die eine 7 enthält oder durch 7 teilbar ist, trinkt einen Schluck."
	},
  {
		"text": "Jeder, der blonde Haare hat, trinkt einen Schluck."
	},
    {
		"text": "Bestimne eine Person, die sich selbst eine Backpfeife geben muss. Macht die Person es nicht, muss diese 3 Schlücke trinken. Anonsten trinkst du 3 Schlücke."
	},
  {
		"text": "Jeder, mit mehr als 90% Akku, darf 5 Schlücke verteilen."
	},
    {
		"text": "Teile dein Alter durch 2. So viele Schlücke darfst du verteilen."
	},
  {
		"text": "Alle, die schon alle 3 Hangover-Teile gesehen haben, dürfen 2 Schlücke verteilen."
	},
  {
		"text": "PLAYER, diese Runde dürfen deine Mitspieler dir keine Fragen beantworten. Jeder, der antwortet muss einen Schluck trinken."
	},
  {
		"text": "PLAYER, gib einer Person deiner Wahl ein High-Five. Jetzt dürft ihr beide einen Schluck trinken."
	},
  {
		"text": "PLAYER, erzähle deinen besten Witz. Alle Spieler, die du zum Lachen bringst, müssen einen Schluck trinken. Lacht keiner, darfst du dir 3 Schlücke genehmigen."
	},
  {
		"text": "Alle Rechtshänder trinken einen Schluck."
	},
  {
		"text": "PLAYER, wähle eine Person aus mit der du Schere-Stein-Papier spielst. Der Verlierer trinkt 3 Schlücke. Der Gewinner darf 3 verteilen."
	},
    {
		"text": "PLAYER, tausche ein Kleidungsstück mit einem Mitspieler deiner Wahl. Weigert sich der Spieler, trinkt er 5 Schlücke."
	},
  {
		"text": "Nennt im Uhrzeigersinn 'Dinge, von denen die meisten Leute träumen, sie zu machen.' PLAYER beginnt."
	},
  {
		"text": "PLAYER, wähle eine Person, die die Hand in deine Unterwäsche schieben soll. 2 Schlücke, wenn ihr euch weigert."
	},
    {
		"text": "PLAYER, lass dich von einem Spieler in den Hintern kneifen oder trinke 3 Schlücke."
	},
  {
		"text": "Alle, die schon einmal von dem Partner eines Freundes fantasiert haben, trinken 5 Schlücke."
	},
  {
		"text": "Einmal im Kreis, jeder wählt eine Person, die einen Schluck trinken muss. PLAYER beginnt."
	},
    {
		"text": "PLAYER, wähle eine Person, die eine Stelle deines Körpers abschlabbern muss. Weigert sich einer von euch, müsst ihr beide 2 Schlücke trinken. "
	},
  {
		"text": "PLAYER, du musst 5 Sekunden lang einen Stepptanz vorführen. Weigerst du dich, musst du 5 Schlücke trinken."
	},
  {
		"text": "Trink 4 Schlücke, wenn du morgen eine feierbar Anti Kater Brause brauchst, um dich von heute zu erholen."
	},
    {
		"text": "Alle, die schon einmal einen Dildo in der Hand hatten, trinken 2 Schlücke."
	},
  {
		"text": "PLAYER, lass dich von einer Person deiner Wahl im Nacken, küssen. Weigert sich einer von euch, müsst ihr beide 4 Schlücke trinken."
	},
  {
		"text": "Alle, die nicht twerken können, trinken 4 Schlücke."
	},
    {
		"text": "Prost! Alle Spieler trinken einen Schluck."
	},
  {
		"text": "PLAYER, lass dir von einem Mitspieler deiner Wahl einen Knutschfleck machen. Du entscheidest wo. Weigert sich einer von euch beiden, trinkt ihr beide 3 Schlücke."
	},
  {
		"text": "Lieber eine Woche lang alle Sexfantasien ausleben oder dieselbe Fantasie ein Jahr lang? Stimmt gleichzeitig ab. Die Verlierer trinken 3 Schlücke."
	},
    {
		"text": "PLAYER, bestimmt einen Mitspieler, den du am intelligentesten findest. Diese muss 3 Schlücke trinken."
	},
  {
		"text": "PLAYER, mache einen Handstand oder trinke 2 Schlücke."
	},
  {
		"text": "Wahrheit oder Pflicht! Spielt einmal im Kreis. Jeder stellt seinem rechten Nachbar die Frage 'Wahrheit oder Pflicht'. 5 Schlücke, wenn sich ein Spieler weigert. "
	},
    {
		"text": "Nennt im Uhrzeigersinn andere Begriffe für das Wort 'Furz'. Weiß einer Spieler nichts oder wiederholt etwas, trinkt dieser 4 Schlücke."
	},
  {
		"text": "Nennt im Uhrzeigersinn andere Begriffe für das Wort 'Penis'. Weiß einer Spieler nichts oder wiederholt etwas, trinkt dieser 6 Schlücke."
	},
    {
		"text": "PLAYER, sei für die nächsten beiden Runden ein braves Hündchen. Gibt man dir einen Befehl, den man auch einem Hund geben würde, führe ihn aus oder trinke 3 Schlücke. "
	},
  {
		"text": "Derjenige, der zuerst seinen Arsch zeigt, verteilt 5 Schlücke."
	},
  {
		"text": "Trinke 2 Schlücke, wenn du dich schon einmal in der Öffentlichkeit befummelt hast."
	},
  {
		"text": "PLAYER, schließe die Augen. Die anderen Spieler geben dir etwas zu trinken, dass du erraten musst. Rätst du richtig, darfst du 7 Schlücke verteilen. Liegst du falsch, trinkst du selbst 4 Schlücke."
	},
  {
		"text": "PLAYER, erzähle eine peinlich Geschichte über einen Mitspieler oder trinke 5 Schlücke."
	},
    {
		"text": "Wählt die Person unter euch aus, die regelmäßig vor allen anderen auf der Paty einschläft. Die Person trinkt 4 Schlücke."
	},
  {
		"text": "PLAYER, du darfst so viele Schlücke verteilen, wie du Sex Partner hattest. Willst du es nicht sagen, musst du selbst 5 Schlücke trinken."
	},
  {
		"text": "PLAYER, trinke 3 Schlücke, wenn dein erstes Mal nicht gut war."
	},
    {
		"text": "Nennt nacheinander 'Beleidigungen mit Tiernamen'. Weiß einer Spieler nichts oder wiederholt etwas, trinkt dieser 4 Schlücke."
	},
  {
		"text": "PLAYER, stelle einer Person deiner Wahl eine schlüpfrige Frage. Antwortet die Person nicht, muss sie 5 Schlücke trinken."
	},
  {
		"text": "PLAYER, erhält 5 Schlücke. Dein linker Nachbar einen Schluck weniger usw. bis ihr bei 0 Schlücken ankommt."
	},
    {
		"text": "Der Spieler mit dem meisten Bargeld darf 3 Schlücke verteilen."
	},
  {
		"text": "Der Spieler, der als erstes ein Münze auf den Tisch legt, darf 2 Schlücke verteilen."
	},
  {
		"text": "PLAYER, spiel das zuletzt gehörte Lied auf deinem Handy. Wenn die Mehrheit der Spieler das Lied nicht mag, trinke 3 Schlücke."
	},
    {
		"text": "Alle, die ein E im Vornamen haben, dürfen 2 Schlücke verteilen."
	},
  {
		"text": "Zählt von drei runter und zeigt auf die betrunkenste Person des Abends. Diese darf dann 4 Schlücke verteilen."
	},
  {
		"text": "Alle Singles dürfen 2 Schlücke trinken."
	},
    {
		"text": "Nennt im Uhrzeigersinn andere Begriffe für das Wort 'Sex. Weiß einer Spieler nichts oder wiederholt etwas, trinkt dieser 4 Schlücke."
	},
  {
		"text": "Alle, die schon einmal in der Öffentlichkeit gepinkelt haben, trinken einen Schluck."
	},
  {
		"text": "Alle, die sich schon einmal mit einer Pflanze den Arsch abgewischt haben, trinken einen Schluck."
	},
    {
		"text": "PLAYER, schick eine Whatsapp an die letzte Person, mit der du geschrieben hast. Deine Mitspieler entscheiden über den Inhalt der Nachricht. Weigerst du dich, musst du 5 Schlücke trinken."
	},
  {
		"text": "PLAYER, verteile an jeden deiner Mitspieler ein Kompliment sowie einen Schluck."
	},
    {
		"text": "PLAYER, tanz wie ein Roboter oder trinke 3 Schlücke."
	},
  {
		"text": "PLAYER, muss die nächsten zwei Runden nur auf einem Bein stehen. Fällt der Spieler um, muss er 4 Schlücke trinken."
	},
  {
		"text": "Jeder darf nacheinander so viele Schlücke verteilen, wie seine Anzahl an Vornamen. PLAYER beginnt."
	},
    {
		"text": "PLAYER, erhalte 2 Schlücke, wenn du schon einmal beim Sex erwischt wurdest."
	},
  {
		"text": "Stimmt gleichzeitig ab! Lieber am Wochenende in eine Kneipe oder in einen Club? Die Verlierer trinken einen Schluck."
	},
  {
		"text": "PLAYER, pfeiff mit vollem Mund einen Song. Die Anderen müssen raten. Der Gewinner darf 4 Schlücke verteilen."
	}
]
}
''';
