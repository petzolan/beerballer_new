import 'dart:io';

import 'package:beerballer_new/Services/authService.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class AboutUsTab extends StatelessWidget {
  final AuthService _authService = AuthService.instance;

  @override
  Widget build(BuildContext context) {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'support@beerballer.com',
      query: 'subject=Trinkspiel App&body=App Version 3.23',
    );
    var url = params.toString();
    return Scaffold(
        backgroundColor: AppVariables.backgroundCol,
        //Appbar to get back to HomeTab()
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          toolbarHeight: MediaQuery.of(context).size.height * 0.075,
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Image.asset(
            "lib/assets/images/schriftzugWeiß.png",
            width: 150,
          ),
          backgroundColor: AppVariables.backgroundCol,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        // Body, showing the selected GameList
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              // about us
              Image.asset(
                'lib/assets/images/Infopage/groupPic.jpg',
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Team BeerBaller wünscht euch viel Spaß beim Trinkspiel Abend!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Oswald"),
              ),
              Text(
                "🍻",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(
                height: 10,
              ),
              // Wer sind wir
              aboutUsContainer(
                "Wer sind wir? ✌️",
                "Wir sind ein junges Startup aus Darmstadt, die selbst bei jeder Gelegenheit gerne Beer Pong spielen. " +
                    "Aus dieser Begeisterung (und vielleicht dem ein oder anderem Getränk zu viel 🤪 ...) kam uns die Idee für BeerBaller: " +
                    "Eine innovative Marke im Bereich Trinkspiele mit der wir unsere kreativen Ideen verwirklichen können!",
              ),

              // Unsere Vision
              Image.asset(
                'lib/assets/images/Infopage/ricoflo.png',
                width: MediaQuery.of(context).size.width,
              ),
              aboutUsContainer(
                "Unsere Vision 🚩",
                "Mit unseren Produkten wollen wir Spaß und gute Laune in die Gesellschaft bringen!",
              ),

              // Warum diese App
              aboutUsContainer(
                "Warum diese App? 🤔",
                "Wir waren ziemlich unzufrieden mit den bisherigen Trinkspiel Apps auf dem Markt: ",
              ),

              // Auflistungen
              Container(
                height: 250,
                child: ListView(
                  itemExtent: 25,
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    conTiles("0815 Spiele"),
                    conTiles("Zahlungspflichtig"),
                    conTiles("Für jedes Spiel eine neue App"),
                    spaceBetweenHeaderAndText(),
                    normalText("Da dachten wir: Das können wir besser!"),
                    proTiles("Über 50 Spiele in einer App"),
                    proTiles("Lustige und abwechselungsreiche Aufgaben"),
                    proTiles("100% kostenlos"),
                  ],
                ),
              ),
              // Spielempfehlungen
              aboutUsContainer(
                "Ihr kennt ein Spiel, das unbedingt noch in die App sollte?! 😏",
                "Dann schreibt und gerne eine Nachricht auf Instagram mit eurer Trinkspiel-Idee und wir versuchen diese noch in die App zu integrieren 😉",
              ),

              // Aufruf zur Bewertung
              Image.asset(
                "lib/assets/images/Infopage/models.jpg",
                width: MediaQuery.of(context).size.width,
              ),
              aboutUsContainer(
                "Euch gefällt die App? 🤩",
                "Wir würden uns riesig über eine Bewertung im Playstore freuen!",
              ),

              // Stay in contact
              aboutUsContainer(
                "Lasst und in Kontakt bleiben! 🥳",
                "Folgt uns gerne auf Instagram und bleibt immer auf dem neuesten Stand über unsere neuesten Produktideen und anstehende Events 😊🍻",
              ),
              // Links
              linkCreator("www.instagram/beerballer/"),
              // Impressum, Haftung etc.
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Divider(color: AppVariables.textColor1),
              ), // Impressum
              lawContainer(
                "Impressum",
                "BeerBaller GmbH\n" + "Spessartring 8\n" + "64287 Darmstadt",
              ),
              InkWell(
                child: new Text(
                  'support@beerballer.com',
                  style: TextStyle(
                      color: AppVariables.textColor1,
                      decoration: TextDecoration.underline),
                ),
                onTap: () => launch(url),
              ),
              // Haftungsausschluss
              lawContainer(
                "Haftungsausschluss",
                "BeerBaller übernimmt keinerlei Verwantwortung für Konsequzenzen, welche aus der Nutzung der BeerBaller App resultieren können. " +
                    "Haftungsansprüche gegen BeerBaller, die sich auf Schäden psychischer, physischer, materieller und ideeller Art beziehen, die durch die Nutzung " +
                    "oder Nichtnutzung der angebotenen Informationen verursacht wurden, sind grundsätzlich ausgeschlossen. " +
                    "BeerBaller weist auf einen verantwortungsvollen Umgang mit Alkohol hin. Alle Verantwortung liegt auf der/dem Nutzer(in) der App. " +
                    "Ebenso sind alle Inhalte der App lediglich Empfehlungen und keine Aufforderungen oder Pflichten. " +
                    "Sie sollen weder Minderheiten eingrenzen, noch angreifen. Mit der Bestätigung der Kenntnisnahme des Warnhinweises " +
                    "akzeptiert der Nutzer die oben geannten Punkte und entbindet BeerBaller jeglicher Haftbarkeit.",
              ),
              // Streitschlichtung
              lawContainer(
                "Streitschlichtung",
                "Unsere E-Mail-Adresse finden Sie oben im Impressum. Wir sind nicht bereit oder verpflichtet, an Streitbeilegungsverfahrern vor einer Verbraucherschlichtungsstelle teilzunehmen. " +
                    "Die Europäische Kommission stellt eine Plattform zur Online-Streitbeilegung (OS) bereit: ",
              ),
              linkCreator('https://ec.europa.eu/consumers/odr'),
              // Haftung für Inhalte
              lawContainer(
                "Haftung für Inhalte",
                "Als Dienstanbieter sind wir gemäß § 7 Abs. 1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. " +
                    "Nach §§ 8 bis 10 TMG sind wir als Dienstanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen " +
                    "oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen. " +
                    "Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt. " +
                    "Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden " +
                    "Rechtsverletzungen werden wir diese Inhalte umgehend entfernen. ",
              ),
              // Haftung für Links
              lawContainer(
                "Haftung für Links",
                "Unser Angebot entählt Links zu externen Websites Dritter, auf deren Inhatle wir keinen Einfluss haben. " +
                    "Deshalb können wir für diese fremden Inhalte auch keine Gewähr übernehmen. Für die Inhalte der verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich. " +
                    "Die verlinkten Seiten wurden zum Zeitpunkt der Verlinkung auf mögliche Rechtsverstöße überprüft. Rechtswidrige Inhalte waren zum Zeitpunkt der Verlinkung nicht erkennbar. " +
                    "Eine permanente inhaltliche Kontrolle der verlinkten Seiten ist jedoch ohne konkrete Anhaltspunkte einer Rechtsverletzung nicht zumutbar. " +
                    "Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Links umgehend entfernen",
              ),
              // Urheberrecht
              lawContainer(
                "Urheberrecht",
                "Die durch die Seitenbetreiber erstellten Inhalte und Werke auf diesen Seiten unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und " +
                    "jede Art der Verwertung außerhalb der Grenzen des Urheberrechts bedürfen der schriftlichen Zustimmung des jeweiligen Autors bzw. Erstellers. " +
                    "Downloads und Kopien dieser Seite sind nur für den privaten, nicht aber kommerziellen Gebraucht gestattet. Soweit die Inhalte auf dieser Seite nicht vom Betreiber erstellt wurden, " +
                    "werden die Urheberrechte Dritter beachtet. Insbesondere werden Inhalte Dritter als solche gekennzeichner. Sollten Sie trotzdem auf eine Urheberrechtsverletzung aufmerksam werden, " +
                    "bitten wir um einen entsprechenden Hinweis. Bei Bekanntwerden von Rechtsverletzungen werden derartige Inhalte umgehend entfernt.",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Divider(color: AppVariables.textColor1),
              ),
              // Datenschutzerklärung
              lawContainer(
                "Datenschutzerklärung",
                "Diese Anwendung erhebt personenbezogene Daten von ihren Nutzern. Nutzer können unterschiedlichen Schutzstandards unterliegen, sodass für einige von ihnen umfassendere Standards anwendbar sein können. Näheres über die Schutzkriterien können Nutzer dem Abschnitt zur Anwendbarkeit entnehmen.",
              ),
              lawContainer(
                "Anbieter und Verantwortlicher",
                "BeerBaller GmbH\n" + "Spessartring 8\n" + "64287 Darmstadt",
              ),
              InkWell(
                child: new Text(
                  'support@beerballer.com',
                  style: TextStyle(
                      color: AppVariables.textColor1,
                      decoration: TextDecoration.underline),
                ),
                onTap: () => launch(url),
              ),
              lawContainer(
                "Arten der erhobenen Daten",
                "Zu den personenbezogenen Daten, die diese Anwendung selbstständig oder durch Dritte verarbeitet, gehören: E-Mail; Nutzungsdaten. Vollständige Details zu jeder Art von verarbeiteten personenbezogenen Daten werden in den dafür vorgesehenen Abschnitten dieser Datenschutzerklärung oder punktuell durch Erklärungstexte bereitgestellt, die vor der Datenerhebung angezeigt werden. Personenbezogene Daten können vom Nutzer freiwillig angegeben oder, im Falle von Nutzungsdaten, automatisch erhoben werden, wenn diese Anwendung genutzt wird. Sofern nicht anders angegeben, ist die Angabe aller durch diese Anwendung angeforderten Daten obligatorisch. Weigert sich der Nutzer, die Daten anzugeben, kann dies dazu führen, dass diese Anwendung dem Nutzer ihre Dienste nicht zur Verfügung stellen kann. In Fällen, in denen diese Anwendung die Angabe personenbezogener Daten ausdrücklich als freiwillig bezeichnet, dürfen sich die Nutzer dafür entscheiden, diese Daten ohne jegliche Folgen für die Verfügbarkeit oder die Funktionsfähigkeit des Dienstes nicht anzugeben. Nutzer, die sich darüber im Unklaren sind, welche personenbezogenen Daten obligatorisch sind, können sich an den Anbieter wenden. Jegliche Verwendung von Cookies – oder anderer Tracking-Tools – durch diese Anwendung oder Anbieter von Drittdiensten, die durch diese Anwendung eingesetzt werden, dient dem Zweck, den vom Nutzer gewünschten Dienst zu erbringen, und allen anderen Zwecken, die im vorliegenden Dokument und, falls vorhanden, in der Cookie-Richtlinie beschrieben sind. Die Nutzer sind für alle personenbezogenen Daten Dritter verantwortlich, die durch diese Anwendung beschafft, veröffentlicht oder weitergegeben werden, und bestätigen, dass sie die Zustimmung zur Übermittlung personenbezogener Daten etwaiger Dritter an diese Anwendung eingeholt haben.",
              ),
              lawContainer(
                "Art und Ort der Datenverarbeitung",
                "Der Anbieter darf personenbezogene Daten von Nutzern nur dann verarbeiten, wenn einer der folgenden Punkte zutrifft: Die Nutzer haben ihre Einwilligung für einen oder mehrere bestimmte Zwecke erteilt. Hinweis: In einigen Gesetzgebungen kann es dem Anbieter gestattet sein, personenbezogene Daten zu verarbeiten, bis der Nutzer einer solchen Verarbeitung widerspricht („Opt-out“), ohne sich auf die Einwilligung oder eine andere der folgenden Rechtsgrundlagen verlassen zu müssen. Dies gilt jedoch nicht, wenn die Verarbeitung personenbezogener Daten dem europäischen Datenschutzrecht unterliegt; die Datenerhebung ist für die Erfüllung eines Vertrages mit dem Nutzer und/oder für vorvertragliche Maßnahmen daraus erforderlich; die Verarbeitung ist für die Erfüllung einer rechtlichen Verpflichtung, der der Anbieter unterliegt, erforderlich; Die Verarbeitung steht im Zusammenhang mit einer Aufgabe, die im öffentlichen Interesse oder in Ausübung hoheitlicher Befugnisse, die dem Anbieter übertragen wurden, durchgeführt wird; Die Verarbeitung ist zur Wahrung der berechtigten Interessen des Anbieters oder eines Dritten erforderlich. In jedem Fall erteilt der Anbieter gerne Auskunft über die konkrete Rechtsgrundlage, auf der die Verarbeitung beruht, insbesondere darüber, ob die Angabe personenbezogener Daten eine gesetzliche oder vertragliche Verpflichtung oder eine Voraussetzung für den Abschluss eines Vertrages ist.",
              ),
              lawContainer(
                "Verarbeitungsmethoden",
                "Der Anbieter verarbeitet die Nutzerdaten auf ordnungsgemäße Weise und ergreift angemessene Sicherheitsmaßnahmen, um den unbefugten Zugriff und die unbefugte Weiterleitung, Veränderung oder Vernichtung von Daten zu vermeiden. Die Datenverarbeitung wird mittels Computern oder IT-basierten Systemen nach organisatorischen Verfahren und Verfahrensweisen durchgeführt, die gezielt auf die angegebenen Zwecke abstellen. Zusätzlich zum Verantwortlichen könnten auch andere Personen intern (Personalverwaltung, Vertrieb, Marketing, Rechtsabteilung, Systemadministratoren) oder extern – und in dem Fall soweit erforderlich, vom Verantwortlichen als Auftragsverarbeiter benannt (wie Anbieter technischer Dienstleistungen, Zustellunternehmen, Hosting-Anbieter, IT-Unternehmen oder Kommunikationsagenturen) - diese Anwendung betreiben und damit Zugriff auf die Daten haben. Eine aktuelle Liste dieser Beteiligten kann jederzeit vom Anbieter verlangt werden.",
              ),
              lawContainer(
                "Rechtsgrundlagen der Verarbeitung",
                "Diese Anwendung erhebt personenbezogene Daten von ihren Nutzern. Nutzer können unterschiedlichen Schutzstandards unterliegen, sodass für einige von ihnen umfassendere Standards anwendbar sein können. Näheres über die Schutzkriterien können Nutzer dem Abschnitt zur Anwendbarkeit entnehmen.",
              ),
              lawContainer(
                "Ort",
                "Die Daten werden in der Niederlassung des Anbieters und an allen anderen Orten, an denen sich die an der Datenverarbeitung beteiligten Stellen befinden, verarbeitet. Je nach Standort der Nutzer können Datenübertragungen die Übertragung der Daten des Nutzers in ein anderes Land als das eigene beinhalten. Um mehr über den Ort der Verarbeitung der übermittelten Daten zu erfahren, können die Nutzer den Abschnitt mit den ausführlichen Angaben zur Verarbeitung der personenbezogenen Daten konsultieren. Wenn umfassendere Standards anwendbar sind, gilt zusätzlich Folgendes: Die Nutzer haben auch das Recht, sich über die Rechtsgrundlage der Datenübermittlung in ein Land außerhalb der Europäischen Union oder an eine internationale Organisation, die dem Völkerrecht unterliegt oder von zwei oder mehr Ländern gegründet wurde, wie beispielsweise die UNO, sowie sich über die vom Anbieter ergriffenen Sicherheitsmaßnahmen zum Schutz ihrer Daten aufklären zu lassen. Wenn eine solche Übermittlung stattfindet, kann der Nutzer mehr darüber erfahren, indem er die entsprechenden Abschnitte dieses Dokuments überprüft oder sich mit dem Anbieter über die im Kontaktteil angegebenen Informationen in Verbindung setzt.",
              ),
              lawContainer(
                "Speicherdauer",
                "Personenbezogene Daten werden so lange verarbeitet und gespeichert, wie es der Zweck erfordert, zu dem sie erhoben wurden. Daher gilt: Personenbezogene Daten, die zu Zwecken der Erfüllung eines zwischen dem Anbieter und dem Nutzer geschlossenen Vertrages erhoben werden, werden bis zur vollständigen Erfüllung dieses Vertrages gespeichert. Personenbezogene Daten, die zur Wahrung der berechtigten Interessen des Anbieters erhoben werden, werden so lange aufbewahrt, wie es zur Erfüllung dieser Zwecke erforderlich ist. Nutzer können nähere Informationen über die berechtigten Interessen des Anbieters in den entsprechenden Abschnitten dieses Dokuments oder durch Kontaktaufnahme zum Anbieter erhalten. Darüber hinaus ist es dem Anbieter gestattet, personenbezogene Daten für einen längeren Zeitraum zu speichern, wenn der Nutzer in eine solche Verarbeitung eingewilligt hat, solange die Einwilligung nicht widerrufen wird. Darüber hinaus kann der Anbieter verpflichtet sein, personenbezogene Daten für einen längeren Zeitraum aufzubewahren, wenn dies zur Erfüllung einer gesetzlichen Verpflichtung oder auf Anordnung einer Behörde erforderlich ist. Nach Ablauf der Aufbewahrungsfrist werden personenbezogene Daten gelöscht. Daher können das Auskunftsrecht, das Recht auf Löschung, das Recht auf Berichtigung und das Recht auf Datenübertragbarkeit nach Ablauf der Aufbewahrungsfrist nicht geltend gemacht werden.",
              ),
              lawContainer(
                "Datenschutzerklärung",
                "Diese Anwendung erhebt personenbezogene Daten von ihren Nutzern. Nutzer können unterschiedlichen Schutzstandards unterliegen, sodass für einige von ihnen umfassendere Standards anwendbar sein können. Näheres über die Schutzkriterien können Nutzer dem Abschnitt zur Anwendbarkeit entnehmen.",
              ),
              lawContainer(
                "Zwecke der Verarbeitung",
                " Personenbezogene Daten über den Nutzer werden erhoben, damit der Anbieter den Dienst erbringen und des Weiteren seinen gesetzlichen Verpflichtungen nachkommen, auf Durchsetzungsforderungen reagieren, seine Rechte und Interessen (oder die der Nutzer oder Dritter) schützen, böswillige oder betrügerische Aktivitäten aufdecken kann. Darüber hinaus werden Daten zu folgenden Zwecken erhoben: Registrierung und Anmeldung und Hosting und Backend-Infrastruktur. Nutzer können im Abschnitt “Ausführliche Angaben über die Verarbeitung personenbezogener Daten” dieses Dokuments weitere detaillierte Informationen zu diesen Verarbeitungszwecken und die zu den für den jeweiligen Zweck verwendeten personenbezogenen Daten vorfinden.",
              ),

              lawContainer(
                "Datenschutzerklärung",
                "Diese Anwendung erhebt personenbezogene Daten von ihren Nutzern. Nutzer können unterschiedlichen Schutzstandards unterliegen, sodass für einige von ihnen umfassendere Standards anwendbar sein können. Näheres über die Schutzkriterien können Nutzer dem Abschnitt zur Anwendbarkeit entnehmen.",
              ),
              lawContainer(
                "Anbieter und Verantwortlicher",
                "BeerBaller GmbH\n" + "Spessartring 8\n" + "64287 Darmstadt",
              ),
              lawContainer(
                "Hosting und Backend-Infrastruktur",
                "Diese Art von Diensten haben zum Zweck, Daten und Dateien zu hosten, damit diese Anwendung verwaltet und verwendet werden kann. Des Weiteren können diese Angebote eine vorgefertigte Infrastruktur zur Verfügung stellen, die spezifische Funktionen oder ganze Bestandteile für diese Anwendung abwickelt. Einige der unten aufgeführten Dienste können, müssen aber nicht, über geografisch verteilte Server funktionieren, was es schwierig macht, den tatsächlichen Speicherort der personenbezogenen Daten zu bestimmen. Firebase Cloud Firestore: Firebase Cloud Firestore ist ein Webhosting und Backend Dienst, bereitgestellt von Google LLC oder von Google Ireland Limited, je nachdem, wie der Anbieter die Datenverarbeitung verwaltet. Verarbeitete personenbezogene Daten: Nutzungsdaten; verschiedene Datenarten, wie in der Datenschutzerklärung des Dienstes beschrieben. Verarbeitungsort: Deutschland – Datenschutzerklärung; Deutschland – Datenschutzerklärung. Firebase Cloud Storage: Firebase Cloud Storage ist ein Webhosting Dienst, bereitgestellt von Google Ireland Limited oder von Google LLC, je nachdem, wie der Anbieter die Datenverarbeitung verwaltet. Verarbeitete personenbezogene Daten: Nutzungsdaten; verschiedene Datenarten, wie in der Datenschutzerklärung des Dienstes beschrieben. Verarbeitungsort: Deutschland – Datenschutzerklärung; Deutschland – Datenschutzerklärung.",
              ),
              lawContainer(
                "Registrierung und Anmeldung ",
                "Mit der Registrierung oder Anmeldung berechtigen Nutzer diese Anwendung, sie zu identifizieren und ihnen Zugriff auf spezifische Dienste zu gewähren. Je nachdem, was im Folgenden angegeben ist, können Drittanbieter Registrierungs- und Anmeldedienste bereitstellen. In diesem Fall kann diese Anwendung auf einige von diesen Drittanbietern gespeicherten Daten zu Registrierungs- oder Identifizierungszwecken zugreifen. Einige der unten aufgeführten Dienste erheben möglicherweise personenbezogene Daten zu Targeting- und Profilingszwecken. Weitere Informationen dazu entnehmen Sie der Beschreibung eines jeden Dienstes. Firebase Authentication (Google LLC): Firebase Authentication ist ein von Google LLC bereitgestellter Registrierungs- und Anmeldedienst. Um den Anmelde- und Anmeldeprozess zu vereinfachen, kann Firebase Authentication Identitätsdienste von Drittparteien benutzen und die Informationen auf ihrer Plattform speichern. Verarbeitete personenbezogene Daten: E-Mail. Verarbeitungsort: Vereinigte Staaten – Datenschutzerklärung.",
              ),
              lawContainer(
                "Die Rechte der Nutzer",
                "Die Nutzer können bestimmte Rechte in Bezug auf ihre vom Anbieter verarbeiteten Daten ausüben. Nutzer, die Anspruch auf umfassendere Standards haben, können alle nachstehend beschriebenen Rechte ausüben. In allen anderen Fällen kann sich der Nutzer beim Anbieter erkundigen, welche Rechte für ihn gelten. Nutzer haben insbesondere das Recht, Folgendes zu tun: Die Einwilligungen jederzeit widerrufen. Hat der Nutzer zuvor in die Verarbeitung personenbezogener Daten eingewilligt, so kann er die eigene Einwilligung jederzeit widerrufen. Widerspruch gegen die Verarbeitung ihrer Daten einlegen. Der Nutzer hat das Recht, der Verarbeitung seiner Daten zu widersprechen, wenn die Verarbeitung auf einer anderen Rechtsgrundlage als der Einwilligung erfolgt. Weitere Informationen hierzu sind weiter unten aufgeführt. Auskunft bezüglich ihrer Daten erhalten. Der Nutzer hat das Recht zu erfahren, ob die Daten vom Anbieter verarbeitet werden, über einzelne Aspekte der Verarbeitung Auskunft zu erhalten und eine Kopie der Daten zu erhalten. Überprüfen und berichtigen lassen. Der Nutzer hat das Recht, die Richtigkeit seiner Daten zu überprüfen und deren Aktualisierung oder Berichtigung zu verlangen. Einschränkung der Verarbeitung ihrer Daten verlangen. Die Nutzer haben das Recht, unter bestimmten Umständen die Verarbeitung ihrer Daten einzuschränken. In diesem Fall wird der Anbieter die Daten zu keinem anderen Zweck als der Speicherung verarbeiten. Löschung oder anderweitiges Entfernen der personenbezogenen Daten verlangen. Die Nutzer haben unter bestimmten Umständen das Recht, die Löschung ihrer Daten vom Anbieter zu verlangen. Ihre Daten erhalten und an einen anderen Verantwortlichen übertragen lassen. Der Nutzer hat das Recht, seine Daten in einem strukturierten, gängigen und maschinenlesbaren Format zu erhalten und, sofern technisch möglich, ungehindert an einen anderen Verantwortlichen übermitteln zu lassen. Diese Bestimmung ist anwendbar, sofern die Daten automatisiert verarbeitet werden und die Verarbeitung auf der Zustimmung des Nutzers, auf einem Vertrag, an dem der Nutzer beteiligt ist, oder auf vorvertraglichen Verpflichtungen beruht. Beschwerde einreichen. Die Nutzer haben das Recht, eine Beschwerde bei der zuständigen Aufsichtsbehörde einzureichen.",
              ),
              lawContainer(
                "Details zum Widerspruchsrecht bezüglich der Verarbeitung",
                "Werden personenbezogene Daten im öffentlichen Interesse, in Ausübung eines dem Anbieter übertragenen hoheitlichen Befugnisses oder zur Wahrung der berechtigten Interessen des Anbieters verarbeitet, kann der Nutzer dieser Verarbeitung widersprechen, indem er einen Rechtfertigungsgrund angibt, der sich auf seine besondere Situation bezieht. Nutzer werden darüber informiert, dass sie der Verarbeitung der personenbezogenen Daten für Direktwerbung jederzeit ohne Angabe von Gründen widersprechen können. Ob der Anbieter personenbezogene Daten für Direktwerbungszwecke verarbeitet, können die Nutzer den entsprechenden Abschnitten dieses Dokuments entnehmen.",
              ),
              lawContainer(
                "Wie die Rechte ausgeübt werden können",
                "Alle Anfragen zur Ausübung der Nutzerrechte können über die in diesem Dokument angegebenen Kontaktdaten an den Anbieter gerichtet werden. Anträge können kostenlos ausgeübt werden und werden vom Anbieter so früh wie möglich, spätestens innerhalb eines Monats, bearbeitet.",
              ),
              lawContainer(
                "Anwendbarkeit umfassenderer Standards",
                "Während die meisten Bestimmungen dieses Dokuments alle Nutzer betreffen, gelten einige Bestimmungen ausdrücklich nur, wenn die Verarbeitung personenbezogener Daten umfassenderen Schutzstandards unterliegt. Solche umfassendere Standards sind anwendbar wenn die Verarbeitung: von einem in der EU niedergelassenen Anbieter durchgeführt wird; sich auf die personenbezogenen Daten von Nutzern bezieht, die sich in der EU befinden und gleichzeitig das Angebot von bezahlten oder unbezahlten Waren oder Dienstleistungen an diese Nutzer betrifft; die personenbezogenen Daten von Nutzern, die sich in der EU befinden, betrifft und es dem Anbieter ermöglicht, das Verhalten dieser Nutzer in der EU zu überwachen.",
              ),
              lawContainer(
                "Weitere Informationen über die Erhebung und Verarbeitung von Daten",
                "",
              ),
              lawContainer(
                "Rechtliche Maßnahmen",
                "Die personenbezogenen Daten des Nutzers können vom Anbieter zu Zwecken der Rechtsdurchsetzung innerhalb oder in Vorbereitung gerichtlicher Verfahren verarbeitet werden, die sich daraus ergeben, dass diese Anwendung oder die dazugehörigen Dienste nicht ordnungsgemäß genutzt wurden.Der Nutzer erklärt, sich dessen bewusst zu sein, dass der Anbieter von den Behörden zur Herausgabe von personenbezogenen Daten verpflichtet werden könnte.",
              ),
              lawContainer(
                "Weitere Informationen über die personenbezogenen Daten des Nutzers",
                "Zusätzlich zu den in dieser Datenschutzerklärung aufgeführten Informationen kann diese Anwendung dem Nutzer auf Anfrage weitere kontextbezogene Informationen zur Verfügung stellen, die sich auf bestimmte Dienste oder auf die Erhebung und Verarbeitung personenbezogener Daten beziehen.",
              ),
              lawContainer(
                "Systemprotokolle und Wartung",
                "Diese Anwendung und die Dienste von Dritten können zu Betriebs- und Wartungszwecken Dateien erfassen, die die über diese Anwendung stattfindende Interaktion aufzeichnen (Systemprotokolle), oder andere personenbezogene Daten (z. B. IP-Adresse) zu diesem Zweck verwenden.",
              ),
              lawContainer(
                "Nicht in dieser Datenschutzerklärung enthaltene Informationen",
                "Weitere Informationen über die Erhebung oder Verarbeitung personenbezogener Daten können jederzeit vom Anbieter über die aufgeführten Kontaktangaben angefordert werden.",
              ),
              lawContainer(
                "Wie „Do Not Track“ Anfragen behandelt werden ",
                "Diese Anwendung unterstützt keine Nicht-Verfolgen-Anfragen („Do Not Track”) durch Webbrowser. Die Information, ob integrierte Drittdienste das Nicht-Verfolgen Protokoll unterstützen, entnehmen Nutzer der Datenschutzerklärung des jeweiligen Dienstes.",
              ),
              lawContainer(
                "Änderungen dieser Datenschutzerklärung",
                "Der Anbieter behält sich vor, jederzeit Änderungen an dieser Datenschutzerklärung vorzunehmen, indem Nutzer auf dieser Seite und gegebenenfalls über diese Anwendung und/oder - soweit technisch und rechtlich möglich – durch das Versenden einer Mitteilung über dem Anbieter vorliegende Kontaktdaten der Nutzer informiert werden. Nutzern wird daher nahe gelegt, diese Seite regelmäßig aufzurufen und insbesondere das am Seitenende angegebene Datum der letzten Änderung zu prüfen. Soweit Änderungen eine auf der Einwilligung des Nutzers basierte Datennutzung betreffen, so wird der Anbieter - soweit erforderlich - eine neue Einwilligung einholen.",
              ),
            ],
          ),
        ));
  }

  Container aboutUsContainer(String ldngTxt, String nrmlTxt) {
    return Container(
      child: Column(
        children: [
          leadingText(
            ldngTxt,
          ),
          spaceBetweenHeaderAndText(),
          normalText(
            nrmlTxt,
          ),
          spaceBetweenText(),
        ],
      ),
    );
  }

  InkWell linkCreator(String referenceText) {
    return InkWell(
      child: new Text(
        referenceText,
        style: TextStyle(
            color: AppVariables.textColor1,
            decoration: TextDecoration.underline),
      ),
      onTap: () => launch(referenceText),
    );
  }

  Container lawContainer(String leadingTxt, String infoTxt) {
    return Container(
      child: Column(
        children: [
          spaceBetweenTextLaw(),
          leadingTextLaw(leadingTxt),
          spaceBetweenHeaderAndTextLaw(),
          normalTextLaw(infoTxt),
        ],
      ),
    );
  }

  SizedBox spaceBetweenText() {
    return SizedBox(
      height: 20,
    );
  }

  SizedBox spaceBetweenHeaderAndText() {
    return SizedBox(
      height: 10,
    );
  }

  SizedBox spaceBetweenTextLaw() {
    return SizedBox(
      height: 15,
    );
  }

  SizedBox spaceBetweenHeaderAndTextLaw() {
    return SizedBox(
      height: 5,
    );
  }

  Text normalText(String txt) {
    return Text(
      txt,
      textAlign: TextAlign.center,
    );
  }

  Text leadingText(String txt) {
    return Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    );
  }

  Text normalTextLaw(String txt) {
    return Text(
      txt,
      textAlign: TextAlign.center,
    );
  }

  Text leadingTextLaw(String txt) {
    return Text(
      txt,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13,
      ),
    );
  }

  ListTile conTiles(String txt) {
    return ListTile(
      horizontalTitleGap: 1.0,
      leading: Icon(
        Icons.clear,
        color: Colors.red.shade200,
      ),
      title: Text(
        txt,
        style: TextStyle(
          fontSize: 11,
        ),
      ),
    );
  }

  ListTile proTiles(String txt) {
    return ListTile(
      horizontalTitleGap: 1.0,
      leading: Icon(
        Icons.check,
        color: Colors.green.shade200,
      ),
      title: Text(
        txt,
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
