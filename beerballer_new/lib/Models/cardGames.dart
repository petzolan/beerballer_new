import 'dart:convert';
import 'package:beerballer_new/Models/firestoreModels/game.dart';

class CardGames {}

var items = jsonDecode(jsonAsString)["cardGames"] as List;
List<Game> cardGames = items.map((game) => Game.fromJson(game)).toList();

const jsonAsString = '''
{
	"cardGames": [{
			"gameCategory": "Kartenspiele",
			"gameName": "Arschloch",
			"playerNumber": "2 - 6",
			"gameDuration": "2 - 5 Minuten",
			"materials": "Skatblatt",
			"funFactor": "0.6",
			"drunknessFac": "0.5",
			"difficulty": "0.3",
			"dirtyFactor": "0.3",
			"explanations": [
				"In einem 32 Skatblatt wer den alle Karten an die Spieler  verteilt.",
				"Der Spieler, der die Kreuz 7 auf der Hand hat, darf anfangen. Er legt eine Karte z.B. die 7 ab. Es ist auch möglich mehrere gleiche Karten abzu legen.",
				"Der nächste Spieler muss nun über die Karte kommen. Falls mehrere gleiche Karten – z.B. 2x7er – gelegt werden, kann der Spieler nur mit 2 gleichen Karten kommen, die über der 7 liegen (z.B. zwei 8er). ",
				"Wenn der Spieler drüber kommt, ist der Nächste dran. Falls er nicht drüber kommt, ist der Spieler neben ihm dran.",
				"Falls keiner mehr über die Karte kommt, die ein Spieler gelegt hat, oder ein Spieler ein Ass gelegt hat, wird der Stapel entfernt und er darf wieder anfangen.",
				"Gewonnen hat derjenige, der zuerst alle seine Karten abgelegt hat. Der König darf 10 Schlücke verteilen und der Vizekönig 5.",
				"Im 2. Spiel bekommt der Sieger bzw. König des letzten Spiels die besten 2 Karten vom Letzten, dem „Arschloch“ und das Arschloch bekommt die 2 schlechtesten Karten vom König. Der 2.Platzierte - der Vizekönig - bekommt die beste Karte vom Vorletzten - dem Vizearschloch - und das Vizearschloch die schlechteste Karte vom Vizekönig."
			],
			"imagePath": "./assets/images/games/arschloch.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Pferderennen",
			"playerNumber": "2 - 10",
			"gameDuration": "5 - 15 Minuten",
			"materials": "Skatblatt",
			"funFactor": "0.4",
			"drunknessFac": "0.6",
			"difficulty": "0.3",
			"dirtyFactor": "0.3",
			"explanations": [
				"Die vier Könige sind die Pferde auf die jeder Spieler wettet, neben den Königen liegt eine Reihe von sieben Karten, sie bilden die Seitenlinie.",
				"Vor Spielanfang wettet jeder Spieler Schlücke auf einen der Könige (z.B. vier Schlücke auf Karo), der Einsatz muss jeweils vom Spieler selbst getrunken werden, gewinnt er jedoch kann er die doppelte  Schluckzahl verteilen.",
				"Jetzt wird immer eine Karte vom Deck aufgedeckt und das „Pferd“ mit dem gleichen Symbol darf eins aufrücken.",
				"Sind alle „Pferde“ bei einer Karte der Seitenlinie angekommen wird diese aufgedeckt, und das „Pferd“ mit dem Symbol muss eins zurück.",
				"Das „Pferd“, was als erstes zur siebten Seitenlinie angekommen ist, hat gewonnen. Nun darf jeder, der auf dieses „Pferd“ gesetzt hat, die doppelte Menge seines Schlückeeinsatzes verteilen."
			],
			"imagePath": "./assets/images/games/pferderennen.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Mau Mau",
			"playerNumber": "2 - 4",
			"gameDuration": "5 - 20 Minuten",
			"materials": "Mau Mau Spielset",
			"funFactor": "0.7",
			"drunknessFac": "0.8",
			"difficulty": "0.3",
			"dirtyFactor": "0.3",
			"explanations": [
				"Es werden die klassischen  Mau Mau Regeln gelten. Zu  den jeweiligen Karten können  noch zusätzliche Aufgaben  hinzukommen wie zum Beispiel:  – Der nächste Spieler muss 2 Karten ziehen und 2 Schlücke trinken, hat der Spieler ebenfalls eine 7 muss der darauffolgende Spieler 4 Karten ziehen und 4 Schlücke trinken usw. \\n8 – Der nächste Spieler muss aussetzen. \\n9 – Es gibt einen Richtungswechsel. Das Spiel wird nun andersrum gespielt. \\n10 – Alle Spieler müssen ihre Hand so schnell wie möglich auf die aufgedeckte 10 legen. Der Spieler, der am langsamsten war, muss einen Schluck trinken. \\nBube – Der Spieler wünscht sich eine Farbe und sucht sich einen Mitspieler aus, der einen Schluck trinken muss. Es darf kein weiterer Bube gelegt werden. Falls jemand aus Versehen doch einen Buben legt muss er als Strafe einen Kurzen trinken. \\nDame – Alle Frauen müssen einen Kurzen trinken. \\nKönig – Alle Männer müssen einen Kurzen trinken. \\nAss – Alle Mitspieler (natürlich außer dem ablegenden) müssen einen Schluck trinken.",
				"Gewonnen hat der, der als erstes keine Karten mehr hat."
			],
			"imagePath": "./assets/images/games/maumau.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Kings Cup",
			"playerNumber": "2 - 20",
			"gameDuration": "10 - 30 Minuten",
			"materials": "Skatblatt, ein großes Trinkglas",
			"funFactor": "0.6",
			"drunknessFac": "0.5",
			"difficulty": "0.5",
			"dirtyFactor": "0.3",
			"explanations": [
				"Um ein großes Glas werden die Karten in einem geschlossenen Kreis verteilt. Der jüngste Spieler zieht die 1. Karte, danach reihum. Die Karten haben folgende Aufgaben: \\n7 – Alle müssen die Hände  hochreißen. Der Langsamste trinkt. \\n8 – Trinkpartner aussuchen, der immer mit dir zusammen trinken darf. \\n9 – Reim, Wort aussuchen und der Reihe nach Reime finden. Man weiß keinen passenden Reim mehr auf das ausgesuchte Wort? Trink einen Schluck! \\n10 – Kategorie - Kategorie aussuchen und der Reihe nach passende Wörter finden. Kein passendes Wort mehr für die Kategorie gefunden? Trink! \\nBube – Regel ausdenken. \\nDame – Questionmaster, beantworte eine Frage des Questionmasters? Trink! \\nKönig – Befülle das Glas in der Mitte. Wird der 4. König gezogen? Trink das Glas aus! \\nAss – Wasserfall, fangt nacheinander alle an zu trinken. Hört erst auf, wenn euer Nachfolger abgesetzt hat!",
				"Der Erste, der den geschlossenen Kreis durchbricht, darf das eigene Getränk exen.",
				"Das Spiel endet, wenn die letzte Karte gezogen wurde."
			],
			"imagePath": "./assets/images/games/kingscup.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Alkohol Black Jack",
			"playerNumber": "2 - 6",
			"gameDuration": "5 - 20 Minuten",
			"materials": "Skatblatt (32 oder 52 Karten)",
			"funFactor": "0.5",
			"drunknessFac": "0.4",
			"difficulty": "0.5",
			"dirtyFactor": "0.3",
			"explanations": [
				"Es wird ein Dealer ausgemacht. Der Rest sind Spieler.",
				"Die Spieler nehmen Gläser oder Schlücke als Einsatz.",
				"Nachdem jeder seinen Grundeinsatz gebracht hat, werden die Karten wie beim BlackJack verteilt. Die Bank erhält eine offene und eine verdeckte Karte, die Spieler erhalten 2 offene.",
				"Die Spieler können nun halten oder noch eine Karte ziehen. Überkauft sich ein Spieler oder die Bank, muss dieser trinken. Die Bank muss Karten bis mindestens Augensumme 17 ziehen. Die Spieler müssen drüber kommen, aber nicht über 21.",
				"Die Karten haben folgende  Wertigkeit: \\n→ Die Zahlen „2” bis „10” haben auch ihre Wertigkeit. \\n→ „Bube, Dame, König” haben den Wert 10. \\n→ „Ass” hat entweder den Wert 11 oder 1 (je nachdem, was  einem besser passt). ",
				"Nach jeder Runde kann natürlich ein neuer Dealer ausgesucht werden oder man fängt mit demselben Dealer eine neue Runde an."
			],
			"imagePath": "./assets/images/games/alkoholblackjack.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Bus fahren",
			"playerNumber": "2 - 8",
			"gameDuration": "5 - 15 Minuten",
			"materials": "Skatblatt",
			"funFactor": "0.5",
			"drunknessFac": "0.6",
			"difficulty": "0.5",
			"dirtyFactor": "0.3",
			"explanations": [
				"Es werden pyramidenförmig Karten verdeckt in der Mitte des Tisches ausgelegt.",
				"Ein Spieler gibt jedem Teilnehmer und sich selbst insgesamt 3 Karten. Bei der 1. muss rot oder schwarz, bei der 2. höher oder tiefer und bei der 3. Karten außerhalb oder innerhalb der 2 Karten getippt  werden. Bei falschen Tipp muss ein Schluck getrunken werden.",
				"Danach werden die Karten in der Mitte nach und nach aufgedeckt. Bei jeder Stufe der Pyramide kommt ein Schluck hinzu. Wenn z.B. eine Dame aufgedeckt wird, kann jeder, der bei seinen 3 Karten eine Dame hat, diese auf die Dame hinlegen und einen, zwei, drei (je nach Pyramidenstufe) Schluck/Schlücke verteilen.",
				"Wer nach allen aufgedeckten Karten, noch die meisten Karten besitzt, muss „Bus fahren“",
				"1 Karte wird offen hingelegt und 5 verdeckt. Derjenige, der Bus fahren muss, muss bei jeder Karte schätzen, ob höher oder tiefer. Falls er bei einer Karte falsch tippt, werden aus dem Stapel wieder verdeckte auf die bereits richtig getippten Karten gelegt und er muss einen Schluck trinken. Das Bus fahren geht solange, bis der Spieler alle verdeckten Karten richtig getippt hat.",
				"Wer nach allen aufgedeckten Karten noch die meisten Karten besitzt, muss \\"Bus fahren\\"",
				"1 Karte wird offen hingelegt und 5 verdeckt. Derjenige, der Bus fahren muss, muss bei jeder Karte schätzen, ob höher oder tiefer. Falls er bei einer Karte falsch tippt, werden aus dem Stapel wieder verdeckte auf die bereits richtig getippten Karten gelegt und er muss einen Schluck trinken. Das Bus fahren geht solange, bis der Spieler alle verdeckten Karten richtig getippt hat."
			],
			"imagePath": "./assets/images/games/busfahren.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Captain Shithead",
			"playerNumber": "3 - 10",
			"gameDuration": "5 - 15 Minuten",
			"materials": "Skatblatt",
			"funFactor": "0.7",
			"drunknessFac": "0.8",
			"difficulty": "0.3",
			"dirtyFactor": "0.7",
			"explanations": [
				"Jeder Spieler deckt reihum eine Karte von einem Kartedeck auf. \\n→ „2“ – zwei Schlücke, „3“ –  drei Schlücke und so weiter… \\n→ Bei einer roten Karte muss man selbst die Schlücke trinken. \\n→ Bei einer schwarzen Karte darf man sie verschenken. \\n→ „Bube“ – die Männer trinken. \\n→ „Dame“ – die Frauen trinken oder eine Regel einführen. \\n→ „König“ – du bist Captain Shithead du darfst alles tuen solange du es begründen  kannst. z.B. wegen schlechter Frisur muss jemand trinken, wegen schlechter Laune muss jemand exen. \\n→ „Ass“ – du bist vor Captain Shithead sicher."
			],
			"imagePath": "./assets/images/games/captainshithead.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Klopf die Karte",
			"playerNumber": "2 - 10",
			"gameDuration": "5 - 15 Minuten",
			"materials": "Bier",
			"funFactor": "0.4",
			"drunknessFac": "0.4",
			"difficulty": "0.3",
			"dirtyFactor": "0.3",
			"explanations": [
				"Die Karten werden gemischt und verdeckt auf den Tisch gelegt.",
				"Der jüngste Spieler darf beginnen und zieht als erstes eine Karte vom Stapel. Während der Spieler die Karte aufdeckt, muss er der Reihenfolge nach von einem Skatblatt den Wert aufsagen. Bei 32 Karten  beginnt man mit der 7 bei 52 Karten mit der 2.",
				"Wenn die aufgedeckte Karte mit dem Gesagten überein stimmt, müssen alle Spieler auf die Karte klopfen. Der langsamste Spieler muss trinken.",
				"Danach deckt der nächste Spieler eine Karte auf und sagt in der Reihenfolge den nächst höheren Wert auf. In diesem Beispiel die „3“ bzw. „8” (bei 32 Karten). Der nächste Spieler deckt dann die nächste Karte auf und sagt dabei „4” bzw. „9”. Es geht solange weiter bis die Karte wieder mit dem Gesagten übereinstimmt und jeder muss auf die Karte klopfen.",
				"Bei einem aufgedeckten Ass muss immer geklopft werden.",
				"Das Spiel kann, wenn alle Karten vom Stapel verwendet wurden, wieder neugestartet werden."
			],
			"imagePath": "./assets/images/games/klopfaufdiekarte.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Puste die Karte",
			"playerNumber": "2 - 10",
			"gameDuration": "5 - 15 Minuten",
			"materials": "Spielkarten, eine Flasche",
			"funFactor": "0.5",
			"drunknessFac": "0.5",
			"difficulty": "0.3",
			"dirtyFactor": "0.3",
			"explanations": [
				"Ein Kartenspiel wird auf eine Flasche Bier gelegt.",
				"Der Reiheum versuchen die Spieler eine Karte von der Flasche zu pusten.",
				"Falls man es schafft, dass nur eine Karte herunterfällt, muss man nichts trinken und der nächste Spieler ist dran.",
				"Fällt keine Karte oder fallen alle Karten runter, muss der jenige Spieler einen Shot oder einen Schluck trinken.",
				"Danach ist der nächste Spieler dran und versucht nun eine Karte von dem Bier weg zupusten.",
				"Variationsmöglichkeiten: z.B. bei einem Ass das runter fällt, muss doppelt getrunken werden. Bube – Alle Männer müssen trinken, Dame – Alle Frauen müssen trinken."
			],
			"imagePath": "./assets/images/games/pustediekarte.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Bierbeln",
			"playerNumber": "2 - 8",
			"gameDuration": "5 - 20 Minuten",
			"materials": "Bier, Hochprozentiges, Gummibärchen, alkoholfreies Getränk, Spielkarten",
			"funFactor": "0.4",
			"drunknessFac": "0.5",
			"difficulty": "0.3",
			"dirtyFactor": "0.3",
			"explanations": [
				"Alle Karten bis auf die 8, 9, 10, Bube, Dame, König und Ass  werden entfernt.",
				"Die Spieler decken die  Karten reihum auf. In der Tischmitte steht ein 0,5l Krug oder ein größerers Flas. In den Krug oder das Glas kommen nun Gummibärchen.",
				"Wenn ein Spieler ein Ass zieht, darf er was ins Glas  füllen: \\n→ Beim 1.Ass darf man Hochprozentiges ins Glas füllen. \\n→ Beim 2.Ass darf der Spieler Bier oder etwas bierähnliches ins Glas füllen. \\n→ Beim 3.Ass darf der Spieler  irgendetwas alkoholfreies ins Glas füllen. \\n→ Beim 4.Ass darf der Spieler  den Krug auf Ex austrinken.",
				"Danach kann man wieder  von vorne beginnen."
			],
			"imagePath": "./assets/images/games/bierbeln.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Damenwahl",
			"playerNumber": "3 - 10",
			"gameDuration": "5 - 15 Minuten",
			"materials": "Spielkarten",
			"funFactor": "0.5",
			"drunknessFac": "0.9",
			"difficulty": "0.3",
			"dirtyFactor": "0.3",
			"explanations": [
				"Das Kartenspiel wird auf  den Tisch gelegt.",
				"Jeder zieht eine Karte. \\n→ „7“ – 2 Schlücke Bier trinken. \\n→ „8“ – 3 Schlücke Bier. \\n→ „9“ – 4 Schlücke Bier. \\n→ „10“ – 1 ganzes Bier. \\n→ „Bube“ – 1 Shot. \\n→ „Dame“ – Shot + halbes Bier. \\n→ „König“ – Person aussuchen,  die 4 Schlücke trinken muss. \\n→ „Ass“ – 3 Karten ziehen, eine  darf abgelegt werden.",
				"Im Anschluss zieht jeder  Spieler noch eine Karte.",
				"Es werden Punkte vergeben (7= 7; Ass=11) Bilder zählen als 10. Wer zuerst 50 Punkte hat gewinnt."
			],
			"imagePath": "./assets/images/games/damenwahl.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Asssaufen",
			"playerNumber": "2 - 10",
			"gameDuration": "5 - 15 Minuten",
			"materials": "Spielkarten",
			"funFactor": "0.4",
			"drunknessFac": "0.5",
			"difficulty": "0.3",
			"dirtyFactor": "0.3",
			"explanations": [
				"Karten werden gemischt und dann offen im Uhrzeigersinn verteilt. \\n→ Der Spieler mit dem ersten Ass sucht sich ein Glas aus \\n→ Der Spieler mit dem zweiten Ass sucht die Getränke aus \\n→ Der Spieler mit dem dritten Ass schenkt ein. \\n→ Der Spieler mit dem letzten Ass muss alles trinken \\n→ Danach fängt es wieder von vorne an.",
				"Danach fängt es wieder von vorne an."
			],
			"imagePath": "./assets/images/games/asssaufen.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Kartensaugen",
			"playerNumber": "2 - 2",
			"gameDuration": "5 - 15 Minuten",
			"materials": "Eine Spielkarte",
			"funFactor": "0.7",
			"drunknessFac": "0.4",
			"difficulty": "0.3",
			"dirtyFactor": "0.7",
			"explanations": [
				"Beim Spiel Kartensaugen  ist die Lungenkraft jedes Spielers gefragt.",
				"Der 1. Spieler kann eine beliebige Karte aufnehmen und  saugt sie mit seinem Mund an damit sie nicht runterfällt. Die Hände dürfen natürlich nicht als Hilfestellung verwendet werden.",
				"Der 1. Spieler versucht dem 2. Spieler in Reihenfolge  die Karte zu überreichen in dem der 2. Spieler die Karte ansaugt. Danach muss der 2. Spieler dem 3. Spieler die  Karte „überreichen“.",
				"Bei dem Paar (z.B. Spieler 3 will Spieler 4 die Karte übergeben) wo die Karte runterfällt,  dürfen beide auf Brüderschaft trinken.",
				"Danach ist der Spieler dran, der die Karte zum Fallen gebracht hat.",
				"Man kann natürlich noch Variationen einbauen. z.B. kann man noch einen Kuss auf den Mund bei scheitern mit einführen."
			],
			"imagePath": "./assets/images/games/kartensaugen.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Höher oder tiefer",
			"playerNumber": "2 - 8",
			"gameDuration": "5 - 10 Minuten",
			"materials": "Spielkarten",
			"funFactor": "0.5",
			"drunknessFac": "0.8",
			"difficulty": "0.3",
			"dirtyFactor": "0.3",
			"explanations": [
				"Höher oder tiefer eignet sich perfekt für das schnelle  Vorglühen.",
				"Es kann reihum gespielt werden oder ein Spieler spielt  das komplette Kartenspiel durch.",
				"Nach Aufdecken der 1.  Karten muss der Spieler bei der darauffolgenden Karte schätzen, ob sie vom Wert höher oder tiefer als die bereits aufgedeckte Karte ist. Falls er falsch liegt, muss er einen Schluck trinken.",
				"Beispiel: eine 8 liegt offen. Man schätzt höher. Falls ein  Bube aufgedeckt wird, stimmt dies und man muss nichts trinken. Falls aber eine 7 aufgedeckt wird, muss man trinken.",
				"Schritt 3 wird solange  wiederholt, bis alle Karten aufgedeckt sind."
			],
			"imagePath": "./assets/images/games/höherodertiefer.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Drink Bitch",
			"playerNumber": "2 - 20",
			"gameDuration": "5 - 20 Minuten",
			"materials": "Klamotten, Bier, Strohhälme",
			"funFactor": "0.6",
			"drunknessFac": "0.6",
			"difficulty": "0.3",
			"dirtyFactor": "0.7",
			"explanations": [
				"Der jüngste Spieler darf beginnen.",
				"Reihum wird jeweils  eine Karte vom Kartendeck aufgedeckt. Bevor der Spieler die Karte aufdeckt, muss er raten welche Karte aufgedeckt  wird.",
				"Schätzt der Spieler richtig, wird die Karte rausgenommen.",
				"Schätzt er jedoch falsch, muss der Spieler die Differenz  an Schlücken trinken.",
				"Danach ist der nächste  Spieler mit Raten und Aufdecken dran.",
				"Die Wertigkeit bei einem 32  Skatblatt kann folgendermaßen  aufgeteilt werden: \\n→ Bube – 4 \\n→ Dame – 5 \\n→ König – 6 \\n→ Ass – 11 \\n→ Zahlen nach Zahlenwert",
				"Alle aufgedeckten Karten  müssen offen auf dem Tisch  liegen, damit es im Laufe der Zeit einfacher wird die Karten  zu erraten."
			],
			"imagePath": "./assets/images/games/drinkbitch.jpg"
		},
		{
			"gameCategory": "Kartenspiele",
			"gameName": "Bechern",
			"playerNumber": "2 - 8",
			"gameDuration": "5 - 20 Minuten",
			"materials": "Bechern Kartenset, Red Cups",
			"funFactor": "0.9",
			"drunknessFac": "0.9",
			"difficulty": "0.3",
			"dirtyFactor": "0.5",
			"explanations": [
				"Bechern verbindet die Spiele „Kings Cup“ & „Flip Cup“.", 
				"Alle Karten werden verdeckt um einen leeren Becher verteilt - der „Kings Becher“.",
				"Der jüngste Spieler darf die erste Karte ziehen. Danach wird reihum pro Spieler jeweils eine Karte gezogen.",
				"Die Spieler müssen den Anweisungen folgen, die auf der Karte steht. Außerdem müssen 4 Grundregeln beachtet werden, die das ganze Spiel über gelten. \\n→ Bechern: Ab sofort wird das Wort trinken durch Bechern  ersetzt! \\n→ Flippen: Du kannst deine  Schlücke abwehren, indem du deinen Becher an der Tischkante flippst (wie bei Flip Cup). Bleibt er stehen, darfst du deine Schlücke verteilen. Fällt er  um, musst du doppelt bechern! \\n→ Suchtgefahr: Du willst auf dein Handy schauen? Das musst du dir verdienen. Einmal bechern, bitte! \\n→ KeepTheRing: Der Ring darf nicht unterbrochen werden. Unterbrichst du ihn, musst du deinen kompletten Becher leeren!",
				"Im Spiel befinden sich 4  „Goldene Becher” Karten. Wer eine der ersten 3 zieht, schüttet beliebig viel von seinem Getränk in den goldenen  Becher in der Mitte. Wer die vierte zieht, hat gewonnen und darf den Kings Becher austrinken."
			],
			"imagePath": "./assets/images/games/bechern.jpg"
		}
	]
}
''';
