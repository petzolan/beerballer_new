import 'dart:convert';

import 'package:beerballer_new/Models/InGameApp-Models/Wahrheit%20oder%20Pflicht/truthOrDareQuestion.dart';

class TruthOrDareQuestions {}

var items = jsonDecode(jsonAsString)["truthOrDareQuestions"] as List;
List<TruthOrDareQuestion> truthOrDareQuestions =
    items.map((game) => TruthOrDareQuestion.fromJson(game)).toList();

const jsonAsString = '''
{
	"truthOrDareQuestions":
			[
  {
    "text": "Wo & mit wem war dein erster Kuss?",
    "questiontype": "truth"
  },
  {
    "text": "Hast du schon einmal Drogen genommen? (außer Alkohol und Tabak)",
    "questiontype": "truth"
  },
  {
    "text": "Wer aus der Runde sollte am dringendsten zum Friseur?",
    "questiontype": "truth"
  },{
    "text": "Versuche deine Beine hinter den Kopf zu bekommen.",
    "questiontype": "dare"
  },{
    "text": "Füttere die Person rechts neben dir mit etwas Leckerem.",
    "questiontype": "dare"
  },{
    "text": "Verbringe eine Runde mit den Füßen nach oben, Kopf nach unten.",
    "questiontype": "dare"
  },{
    "text": "Wer war der Held deiner Kindheit?",
    "questiontype": "truth"
  },{
    "text": "Versuche für 10 Sekunden zu breakdancen",
    "questiontype": "dare"
  },{
    "text": "In welchen Star warst du früher unsterblich verknallt?",
    "questiontype": "truth"
  },{
    "text": "Was findest du an dem Spieler rechts von dir total blöd?",
    "questiontype": "truth"
  },{
    "text": "Spiele eine Szene aus deinem Lieblingsfilm nach.",
    "questiontype": "dare"
  },{
    "text": "Hast du einen Spitznamen?",
    "questiontype": "truth"
  },{
    "text": "Rufe jemanden an und wünsche ihm alles Gute zum Geburtstag.",
    "questiontype": "dare"
  },{
    "text": "Gib deinem Mitspieler zu deiner rechten einen Kuss.",
    "questiontype": "dare"
  },{
    "text": "Lecke einen Gegenstand im Raum ab.",
    "questiontype": "dare"
  },{
    "text": "Für welches deiner Vorurteile schämst du dich am meisten?",
    "questiontype": "truth"
  },{
    "text": "Wann hast du das erste Mal geraucht?",
    "questiontype": "truth"
  },{
    "text": "Flüstere lustvoll deinen Namen in das Ohr der links von dir sitzenden Person.",
    "questiontype": "dare"
  },{
    "text": "Was ist die schlimmste Straftat, die du jemals begangen hast?",
    "questiontype": "truth"
  },{
    "text": "Begrüße jeden im Raum mit einem Handschlag.",
    "questiontype": "dare"
  },{
    "text": "Öffne das Fenster, lehne dich heraus und singe lautstark die Nationalhymne.",
    "questiontype": "dare"
  },{
    "text": "Das nächste Mal, wenn du auf die Toilette musst, ruf deine Mutter an und halte das Gespräch aufrecht, während du auf dem Klo bist.",
    "questiontype": "dare"
  },{
    "text": "Küss die Ohrläppchen der links von dir sitzende Person.",
    "questiontype": "dare"
  },{
    "text": "Hast du jemals etwas von der Arbeit mitgehen lassen?",
    "questiontype": "truth"
  },{
    "text": "Welcher Person hier im Raum vertraust du am meisten?",
    "questiontype": "truth"
  },{
    "text": "Wen hast du zuletzt bei Facebook gestalkt?",
    "questiontype": "truth"
  },{
    "text": "Stell deinen Handywecker für den nächsten Morgen auf 6 Uhr!",
    "questiontype": "dare"
  },{
    "text": "Klicke auf Facebook bei drei Bilder deines ehemaligen Schwarms auf 'Gefällt mir'!",
    "questiontype": "dare"
  },{
    "text": "Rufe eine beliebige Nummer an und tu so, als hätte dich die Person angerufen und nicht umgekehrt.",
    "questiontype": "dare"
  },{
    "text": "Simuliere einen Affen für 1 Runde.",
    "questiontype": "dare"
  },{
    "text": "Mache den Moonwalk.",
    "questiontype": "dare"
  },{
    "text": "Lass dir von einem Spieler eine durchgehende Augenbraue aufmalen.",
    "questiontype": "dare"
  },{
    "text": "Rülpse das Alphabet.",
    "questiontype": "dare"
  },{
    "text": "Lecke deinen großen Zeh ab.",
    "questiontype": "dare"
  },{
    "text": "Poste ein Selfie in deiner Instagram Story.",
    "questiontype": "dare"
  },{
    "text": "Lass dir die Augen verbinden und erkenne einen Mitspieler blind.",
    "questiontype": "dare"
  },{
    "text": "Halte mit jemanden 5 Minuten Händchen.",
    "questiontype": "dare"
  },{
    "text": "Du darfst die nächsten 3 Minuten nur grinsen.",
    "questiontype": "dare"
  },{
    "text": "Wickle einen Spieler deiner Wahl mit Toilettenpapier ein.",
    "questiontype": "dare"
  },{
    "text": "Ziehe ein Kleidungsstück aus.",
    "questiontype": "dare"
  },{
    "text": "Mache alles, wozu du in den nächsten 3 Runden gebeten wirst.",
    "questiontype": "dare"
  },{
    "text": "Errate das Alter aller Spieler im Raum.",
    "questiontype": "dare"
  },{
    "text": "Lecke einen Gegenstand im Raum ab.",
    "questiontype": "dare"
  },{
    "text": "Lese die letzte Whatsapp Nachricht laut vor, die du bekommen hast.",
    "questiontype": "dare"
  },{
    "text": "Gib allen Spielern im Raum einen neuen Spitznamen.",
    "questiontype": "dare"
  },{
    "text": "Trage dein T-shirt für den Rest des Abends anderes herum.",
    "questiontype": "dare"
  },{
    "text": "Sende eine Nachricht mit 'Ich liebe dich' an drei Menschen.",
    "questiontype": "dare"
  },{
    "text": "Rufe eine Person an und gratuliere ihm zum Geburtstag.",
    "questiontype": "dare"
  },{
    "text": "Sitze bis zur nächsten Runde auf dem Schoß der Person, links von dir sitzt.",
    "questiontype": "dare"
  },{
    "text": "Öffne den Kühlschrank und nimm dir drei beliebige Getränke. Misch daraus einen Cocktail und probier ihn!",
    "questiontype": "dare"
  },{
    "text": "Es ist nun die umgekehrte Tageszeit für dich - und zwar den Rest des Spiels!",
    "questiontype": "dare"
  },{
    "text": "Du musst den Rest des Abends auf einem Bein hüpfen, wenn du wohin gehen möchtest!",
    "questiontype": "dare"
  },{
    "text": "Mache 20 Liegestützen!",
    "questiontype": "dare"
  },{
    "text": "Öfne das Fenster und versuch jemanden dazu zu bringen, dir zu zuwinken.",
    "questiontype": "dare"
  },{
    "text": "Für die nächsten 2 Runden musst du dich in Zeitlupe bewegen!",
    "questiontype": "dare"
  },{
    "text": "Begrüße jeden im Raum mit einem Handschlag.",
    "questiontype": "dare"
  },{
    "text": "Gruppenpflicht: Ext alle eure Getränke aus!",
    "questiontype": "dare"
  },{
    "text": "Singe dein Lieblingslied.",
    "questiontype": "dare"
  },{
    "text": "Sende eine E-Mail an das erste Jobangebot in der heutigen Zeitung.",    
    "questiontype": "dare"
  },{
    "text": "Ahme eine berühmte Persönlichkeit nach.",
    "questiontype": "dare"
  },{
    "text": "Sprich 5 Minuten lang mit Akzent.",
    "questiontype": "dare"
  },{
    "text": "Hebe den kleinsten Spieler im Raum hoch.",
    "questiontype": "dare"
  },{
    "text": "Zeige allen Spielern, was in deinem Geldbeutel ist.",
    "questiontype": "dare"
  },{
    "text": "Iss etwas, ohne deine Hände zu nutzen.",
    "questiontype": "dare"
  },{
    "text": "Von nun an, musst du allen Spielern der Gruppe Getränke holen.",
    "questiontype": "dare"
  },{
    "text": "Lecke die Wange deines rechten Sitznachbarn.",
    "questiontype": "dare"
  },{
    "text": "Zeige allen die letzten 10 Bildern auf deinem Handy.",
    "questiontype": "dare"
  },{
    "text": "Schweige die nächsten 5 Minuten.",
    "questiontype": "dare"
  },{
    "text": "Grunze wie ein Schwein.",
    "questiontype": "dare"
  },{
    "text": "Flirte jemanden im Raum an.",
    "questiontype": "dare"
  },{
    "text": "Iss einen Teelöfel Senf, Ketchup oder ähnliches.",
    "questiontype": "dare"
  },{
    "text": "Spiele einen Wutanfall.",
    "questiontype": "dare"
  },{
    "text": "Mache einen Kopfstand.",
    "questiontype": "dare"
  },{
    "text": "Umarme jeden im Raum.",
    "questiontype": "dare"
  },{
    "text": "Spreche 3 Runden nur Englisch.",
    "questiontype": "dare"
  },{
    "text": "Mache 20 Kniebeugen.",
    "questiontype": "dare"
  },{
    "text": "Rappe über einen beliebigen Mitspieler.",
    "questiontype": "dare"
  },{
    "text": "Sage ohne zu überlegen das 9er 1x1 auf.",
    "questiontype": "dare"
  },{
    "text": "Nenne 10 Synonyme für 'Liebe machen'.",
    "questiontype": "dare"
  },{
    "text": "Laufe einmal um das Haus.",
    "questiontype": "dare"
  },{
    "text": "Lasse dir von der Gruppe eine neue Frisur geben.",
    "questiontype": "dare"
  },{
    "text": "Trinke einen Shot aus einem Bauchnabel.",
    "questiontype": "dare"
  },{
    "text": "Sende eine Sprachnachricht mit einem Lied deiner Wahl an eine Person.",
    "questiontype": "dare"
  },{
    "text": "Gib einem Mitspieler eine Kopfmassage.",
    "questiontype": "dare"
  },{
    "text": "Mache eine Liebeserklärung an dein Getränk.",
    "questiontype": "dare"
  },{
    "text": "Tanze wie eine Ballerina.",
    "questiontype": "dare"
  },{
    "text": "Sage das Alphabet von hinten auf.",
    "questiontype": "dare"
  },{
    "text": "Wiederhole alles, was jemand am Tisch sagt.",
    "questiontype": "dare"
  },{
    "text": "Versuche ein Verkaufsgespräch über die Nase eines Mitspielers zu führen.",
    "questiontype": "dare"
  },{
    "text": "Boden ist Lava - du darfst den Boden das restliche Spiel nicht mehr berühren.",
    "questiontype": "dare"
  },{
    "text": "Schlage ein Rad.",
    "questiontype": "dare"
  },{
    "text": "Du hast eine gespaltene Persönlichkeit - streite mit dir selbst.",
    "questiontype": "dare"
  },{
    "text": "Mach dein Fenster auf und rufe hinaus: 'Ich bin großartig!'.",
    "questiontype": "dare"
  },{
    "text": "Sprich eine Minute lang in Babysprache.",
    "questiontype": "dare"
  },{
    "text": "Singe Atemlos von Helene Fischer.",
    "questiontype": "dare"
  },{
    "text": "Tue so als würdest du einen Laufsteg entlang gehen.",
    "questiontype": "dare"
  },{
    "text": "Die Gruppe muss entscheiden, was du dir als Hut aufsetzen sollst.",
    "questiontype": "dare"
  },{
    "text": "Mache einen Break Dance Move.",
    "questiontype": "dare"
  },{
    "text": "Kippe einen Shot in ein Bier und trinke dieses leer.",
    "questiontype": "dare"
  },{
    "text": "Trinke einen Shot während du einen Handstand machst.",
    "questiontype": "dare"
  },{
    "text": "Trinke 3 Shots!",
    "questiontype": "dare"
  },{
    "text": "Rufe die von dir zuletzt gewählte Nummer an und bitte die Person am anderen Ende darum, dich am nächsten Morgen um 7 Uhr zu wecken.",
    "questiontype": "dare"
  },{
    "text": "Flüstere für 3 Runden.",
    "questiontype": "dare"
  },{
    "text": "Lies die letzte E-Mail, die du zuletzt bekommen hast, laut vor.",
    "questiontype": "dare"
  },{
    "text": "Lass dich von der Person rechts von dir kitzeln!",
    "questiontype": "dare"
  },{
    "text": "Tausche dein T-shirt mit einem Mitspieler.",
    "questiontype": "dare"
  },{
    "text": "Lass dir von einer anderen Person im Raum ein Getränk mischen und trinke es dann!",
    "questiontype": "dare"
  },{
    "text": "Welche Person im Raum meinst du wird in 20 Jahren am erfolgreichsten sein?",
    "questiontype": "truth"
  },{
    "text": "Wann hast du das letzte Mal geweint?",
    "questiontype": "truth"
  },{
    "text": "Hattest du schon Mal beim ersten Date Sex?",
    "questiontype": "truth"
  },{
    "text": "Warst du jemals in zwei Personen gleichzeitig verliebt?",
    "questiontype": "truth"
  },{
    "text": "Auf was schaust du bei einer Person, an der du interessiert bist, als erstes?",
    "questiontype": "truth"
  },{
    "text": "Hast du jemals heimlich die SMS von jemand anderem gelesen?",
    "questiontype": "truth"
  },{
    "text": "In wen warst du zuletzt verliebt, ohne dass deine Liebe erwidert wurde?",
    "questiontype": "truth"
  },{
    "text": "Hast du jemals über dein Alter gelogen?",
    "questiontype": "truth"
  },{
    "text": "Hast du die Twilight-Filme gesehen oder die Bücher gelesen?",
    "questiontype": "truth"
  },{
    "text": "Was war der Grund für das Ende deiner ersten Beziehung?",
    "questiontype": "truth"
  },{
    "text": "Welches Körperteil magst du an dir am liebsten?",
    "questiontype": "truth"
  },{
    "text": "Wen hast du zuletzt in Facebook/Instagram gestalkt?",
    "questiontype": "truth"
  },{
    "text": "Welche Farbe hat deine Unterwäsche?",
    "questiontype": "truth"
  },{
    "text": "Was hast du als Letztes gekauft?",
    "questiontype": "truth"
  },{
    "text": "Hast du schon einmal gestrippt?",
    "questiontype": "truth"
  },{
    "text": "Hast du schon einmal einen One Night Stand bereut?",
    "questiontype": "truth"
  },{
    "text": "Welchen Disney-Charakter findest du am heißesten?",
    "questiontype": "truth"
  },{
    "text": "Welche zwei Personen in diesem Raum würden das schlechteste Paar abgeben?",
    "questiontype": "truth"
  },{
    "text": "Wurdest du schon mal betrogen?",
    "questiontype": "truth"
  },{
    "text": "Wie alt war die ältste Person, mit der du was hattest?",
    "questiontype": "truth"
  },{
    "text": "Wann warst du das letzte Mal nervös?",
    "questiontype": "truth"
  },{
    "text": "Was war das Peinlichste, was du jemals gemacht hast?",
    "questiontype": "truth"
  },{
    "text": "Wann hattest du dein erstes Mal?",
    "questiontype": "truth"
  },{
    "text": "Was ist dir lieber: Verlassen zu werden oder jemanden zu verlassen?",
    "questiontype": "truth"
  },{
    "text": "Welcher Junge oder welches Mädchen würden deine Eltern zum Ausflippen bringen, wenn du ihn oder sie mit nach Hause nehmen würdest?",
    "questiontype": "truth"
  },{
    "text": "Welche Drogen hast du schon genommen?",
    "questiontype": "truth"
  },{
    "text": "Wurdest du jemals gefeuert? Warum?",
    "questiontype": "truth"
  },{
    "text": "Hast du schon mal so getan, als wärst du betrunken?",
    "questiontype": "truth"
  },{
    "text": "Mit wem hattest du deinen ersten Kuss?",
    "questiontype": "truth"
  },{
    "text": "Welches ist das schlimmste Date, das du jemals hattest?",
    "questiontype": "truth"
  },{
    "text": "Wer aus dem Raum würde ein Wett-Trinken gegen HULK gewinnen?",
    "questiontype": "truth"
  },{
    "text": "Wenn du für den Rest deines Lebens nur noch in einer Stellung Sex haben könntest, welche Stellung wäre es?",
    "questiontype": "truth"
  },{
    "text": "Hat dich schon mal jemand beim Sex erwischt?",
    "questiontype": "truth"
  },{
    "text": "Hast du schon mal betrunken etwas an die Wand einer Toilette in einer Bar geschrieben?",
    "questiontype": "truth"
  },{
    "text": "Hast du schon einmal einen gefälschten Ausweis benutzt?",
    "questiontype": "truth"
  },{
    "text": "Was war dein peinlichstes Erlebnis als du betrunken warst?",
    "questiontype": "truth"
  },{
    "text": "Hast du jemals Nacktbilder verschickt?",
    "questiontype": "truth"
  },{
    "text": "Hattest du schon mal Sex im Wasser?",
    "questiontype": "truth"
  },{
    "text": "Hast du schon mal einen Porno gesehen?",
    "questiontype": "truth"
  },{
    "text": "Bist du schon einmal vor der Polizei weggelaufen?",
    "questiontype": "truth"
  },{
    "text": "Was ist das Schlimmste, dass du mit einem Kater aushalten musstest?",
    "questiontype": "truth"
  },{
    "text": "Hast du jemals einen Orgasmus vorgetäuscht?",
    "questiontype": "truth"
  },{
    "text": "Kam zu dir schon einmal die Polizei wegen Ruhestörung?",
    "questiontype": "truth"
  },{
    "text": "Was ist dein alkoholisches Lieblingsgetränk?",
    "questiontype": "truth"
  },{
    "text": "Mit wievielen Leuten hast du schon geschlafen?",
    "questiontype": "truth"
  },{
    "text": "Hast du schon mal jemanden beim Sex erwischt?",
    "questiontype": "truth"
  },{
    "text": "Warst du jemals an einer Schlägerei beteiligt?",
    "questiontype": "truth"
  },{
    "text": "Hast du schon einmal betrunken eine Nachricht geschrieben, die du am nächsten Morgen bereut hast?",
    "questiontype": "truth"
  },{
    "text": "Was war die unangenehmste Person, in der du jemals gewesen bist?",
    "questiontype": "truth"
  },{
    "text": "Warst du jemals auf Tinder?",
    "questiontype": "truth"
  },{
    "text": "Was war dein schlechtester Kuss?",
    "questiontype": "truth"
  },{
    "text": "Was war das romantischte, was je eine Person für dich gemacht hat?",
    "questiontype": "truth"
  },{
    "text": "Hast du schon einmal etwas im Internet bestellt, weil es dir zu peinlich war, im Laden zu kaufen?",
    "questiontype": "truth"
  },{
    "text": "Wann warst du das erste Mal betrunken?",
    "questiontype": "truth"
  },{
    "text": "Wie viele Tage am Stück hast du schon einmal durchgetrunken?",
    "questiontype": "truth"
  },{
    "text": "Welche schlechte Fernsehsendung schaust du dir heimlich gerne an?",
    "questiontype": "truth"
  },{
    "text": "Wer im Raum geht dir am meisten auf die Nerven?",
    "questiontype": "truth"
  },{
    "text": "Was war dein abenteuerlichste Urlaubserlebniss?",
    "questiontype": "truth"
  },{
    "text": "Was war das schlechteste Geschenk, was du jemals bekommen hast?",
    "questiontype": "truth"
  },{
    "text": "Was war das Dümmste was du jemals betrunken getan hast?",
    "questiontype": "truth"
  },{
    "text": "Hattest du schon einmal mit jemanden Sex auf dem Klo eines Clubs?",
    "questiontype": "truth"
  },{
    "text": "Was ist dein Geheimnis, um einen Kater zu bekämpfen?",
    "questiontype": "truth"
  },{
    "text": "Was war deine letzte gute Tat?",
    "questiontype": "truth"
  },{
    "text": "Was würdest du machen, wenn du nur noch 24 Stunden zu leben hättest?",
    "questiontype": "truth"
  },{
    "text": "Erzähle von einem Wutausbruch, für den du dich immer noch schämst.",
    "questiontype": "truth"
  },{
    "text": "Hast du schon einmal etwas gestohlen?",
    "questiontype": "truth"
  },{
    "text": "Wie lautete deine erste E-Mail Adresse?",
    "questiontype": "truth"
  },{
    "text": "Hast du einen zweiten Vornamen?",
    "questiontype": "truth"
  },{
    "text": "In welchen Situationen bist du geizig?",
    "questiontype": "truth"
  },{
    "text": "Welcher Superheld wärst du gerne?",
    "questiontype": "truth"
  },{
    "text": "Hast du schon mal heimlich Bilder von jemanden gemacht?",
    "questiontype": "truth"
  }
]
}
''';
