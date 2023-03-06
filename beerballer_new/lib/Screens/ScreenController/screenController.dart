import 'dart:async';

import 'package:beerballer_new/Models/currentUserModel.dart';
import 'package:beerballer_new/Models/sideMenuModel.dart';
import 'package:beerballer_new/Screens/Tabs/aboutUsTab.dart';
import 'package:beerballer_new/Screens/Tabs/optionTab.dart';
import 'package:beerballer_new/Screens/Tabs/ownGameForm.dart';
import 'package:beerballer_new/Screens/shop/eventTab.dart';
import 'package:beerballer_new/Screens/Tabs/favoritesTab.dart';
import 'package:beerballer_new/Screens/Tabs/homeTab.dart';
import 'package:beerballer_new/Services/authService.dart';
import 'package:beerballer_new/Services/databaseService.dart';
import 'package:beerballer_new/Widgets/HomeScreenWidgets/popUp.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:floating_frosted_bottom_bar/floating_frosted_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenController extends StatefulWidget {
  @override
  _ScreenControllerState createState() => _ScreenControllerState();
}

class _ScreenControllerState extends State<ScreenController>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int currentPage = 0;

  // Keys for tutorial
  final GlobalKey homeTabKey = GlobalKey();
  final GlobalKey _favoriteTabKey = GlobalKey();
  final GlobalKey _shopTabKey = GlobalKey();
  List<Widget> bottomTabs = [];
  late TutorialCoachMark tutorial;

  @override
  void initState() {
    bottomTabs = _buildTabs();
    // Controller for bottom Navigation
    _tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    _tabController.animation!.addListener(
      () {
        final value = _tabController.animation!.value.round();
        if (value != currentPage && mounted) {
          changePage(value);
        }
      },
    );

    tutorial = TutorialCoachMark(
      targets: _createTargets(),
      textSkip: "Überspringen",
      alignSkip: Alignment.topRight,
      colorShadow: Colors.black,
      onSkip: () {
        // alert am anfang (nicht zu viel trinken etc.)
        showDialog(
          context: context,
          builder: (context) => PopUp(),
        );
      },
      onFinish: () {
        // alert am anfang (nicht zu viel trinken etc.)
        showDialog(
          context: context,
          builder: (context) => PopUp(),
        );
      },
    );
    DatabaseService.instance.getUserSeenTutorial(context, showTutorial);
    super.initState();
  }

  void showTutorial() {
    WidgetsBinding.instance.addPostFrameCallback(_layout);
  }

  void _layout(_) {
    Future.delayed(Duration(milliseconds: 200), tutorial.show as FutureOr Function()?);
  }

  // changes Page when clicking in Option Tab or on Bottom Navigation
  void changePage(int newPage) {
    setState(() {
      currentPage = newPage;
    });
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    // Home target
    targets.add(
      TargetFocus(
        identify: 'Target Home',
        keyTarget: homeTabKey,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return _buildTutorialContent(
                "(1/3)",
                "Alle Spiele im Überblick!",
                "Hier findest du alle Trinkspiele im Überblick!\n" +
                    "Sortiert nach verschiedenen Kategorien!",
              );
            },
          ),
        ],
      ),
    );

    // Favorite target
    targets.add(
      TargetFocus(
        identify: 'Target Favorite',
        keyTarget: _favoriteTabKey,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return _buildTutorialContent(
                "(2/3)",
                "Deine Lieblingsspiele",
                "Behalte deine Lieblingstrinkspiele im Blick. \n" +
                    "Sobald du sie likest findest du sie ganz einfach hier wieder!",
              );
            },
          ),
        ],
      ),
    );

    // Shop Target
    targets.add(
      TargetFocus(
        identify: 'Target Shop',
        keyTarget: _shopTabKey,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return _buildTutorialContent(
                "(3/3)",
                "Shoppe das Equipment!",
                "Dir fehlt das passende Equipment für die Trinkspiele?\n" +
                    "Hier kannst du dir ganz einfach alles kaufen!",
              );
            },
          ),
        ],
      ),
    );
    return targets;
  }

  // Tutorial for new users
  Column _buildTutorialContent(
      String pAnzahl, String pHeader, String pDescription) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          pAnzahl,
          style: TextStyle(
            fontSize: MediaQuery.of(context).textScaleFactor * 15,
          ),
        ),
        Text(
          pHeader,
          style: TextStyle(
            color: AppVariables.buttonColor,
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).textScaleFactor * 25,
          ),
        ),
        Text(
          pDescription,
          style: TextStyle(
            fontSize: MediaQuery.of(context).textScaleFactor * 15,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Consumer<SideMenuModel>(
      builder: ((context, value, child) {
        return SideMenu(
            key: SideMenuModel.sideMenuKey,
            background: Colors.black,
            menu: buildMenu(),
            closeIcon: null,
            type: SideMenuType.slideNRotate,
            child: GestureDetector(
              onTap: () {
                if (value.currentState) {
                  value.toggleSideMenu();
                  _tabController.animateTo(currentPage);
                }
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  iconTheme: IconThemeData(color: Colors.white),
                  toolbarHeight: queryData.size.height * 0.075,
                  centerTitle: true,
                  automaticallyImplyLeading: true,
                  title: Image.asset(
                    "lib/assets/images/schriftzugWeiß.png",
                    width: 150,
                  ),
                  backgroundColor: AppVariables.backgroundCol,
                  elevation: 0.0,
                  leading: IconButton(
                    icon: Icon(Icons.sort),
                    onPressed: () {
                      value.toggleSideMenu();
                    },
                  ),
                ),

                backgroundColor: AppVariables.backgroundCol,
                // Bottom Navigation
                body: _frostedBottomBar(),
              ),
            ));
      }),
    );
  }

  // Bottom Navigation
  _frostedBottomBar() {
    return FrostedBottomBar(
      opacity: 0.65,
      sigmaY: 5,
      sigmaX: 5,
      body: (BuildContext context, ScrollController controller) => TabBarView(
        controller: _tabController,
        children: [
          HomeTab(),
          Consumer<CurrentUserModel>(
            builder: ((context, value, child) {
              while (!value.gotUser) {
                value.getCurrentUser();
                value.toggleCurrUser();
              }
              return FavoritesTab();
            }),
          ),
          EventTab(),
        ],
      ),
      borderRadius: BorderRadius.circular(500),
      child: TabBar(
        controller: _tabController,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
            color: AppVariables.buttonColor,
            width: 2,
          ),
          insets: EdgeInsets.fromLTRB(25, 0, 25, 8),
        ),
        tabs: _buildTabs(),
      ),
    );
  }

  List<Widget> _buildTabs() {
    List<Widget> tabs = [];
    tabs = [
      TabsIcon(
          key: homeTabKey,
          icons: Icons.home_filled,
          color: currentPage == 0 ? AppVariables.buttonColor : Colors.white),
      TabsIcon(
          key: _favoriteTabKey,
          icons: Icons.favorite,
          color: currentPage == 1 ? AppVariables.buttonColor : Colors.white),
      TabsIcon(
          key: _shopTabKey,
          icons: Icons.shopping_bag,
          color: currentPage == 2 ? AppVariables.buttonColor : Colors.white),
    ];
    return tabs;
  }

  Widget buildMenu() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: 10,
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          // Home Text
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<SideMenuModel>(
              builder: ((context, value, child) {
                return ListTile(
                  onTap: () {
                    value.toggleSideMenu();
                    _tabController.animateTo(0);
                  },
                  leading:
                      const Icon(Icons.home, size: 20.0, color: Colors.white),
                  title: const Text("Home"),
                  dense: true,
                );
              }),
            ),
          ),
          // Favoriten
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<SideMenuModel>(
              builder: ((context, value, child) {
                return ListTile(
                  onTap: () {
                    value.toggleSideMenu();
                    _tabController.animateTo(1);
                  },
                  leading: const Icon(Icons.favorite,
                      size: 20.0, color: Colors.white),
                  title: const Text(
                    "Favoriten",
                  ),
                  dense: true,
                );
              }),
            ),
          ),
          // Events und Shop
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<SideMenuModel>(
              builder: ((context, value, child) {
                return ListTile(
                  onTap: () {
                    value.toggleSideMenu();
                    _tabController.animateTo(2);
                  },
                  leading: const Icon(Icons.shopping_bag,
                      size: 20.0, color: Colors.white),
                  title: const Text("Events und Shop"),
                  dense: true,
                );
              }),
            ),
          ),

          // Eigenes Spiel erstellen
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OwnGameForm(),
                  ),
                );
              },
              leading:
                  const Icon(Icons.create, size: 20.0, color: Colors.white),
              title: const Text("Eigenes Spiel erstellen"),
              dense: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUsTab(),
                  ),
                );
              },
              leading:
                  const Icon(Icons.sports_bar, size: 20.0, color: Colors.white),
              title: const Text("Über uns"),
              dense: true,
              // padding: EdgeInsets.zero,
            ),
          ),
          // Einstellungen
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OptionTab(tutorial.show),
                  ),
                );
              },
              leading:
                  const Icon(Icons.settings, size: 20.0, color: Colors.white),
              title: const Text("Einstellungen"),
              dense: true,

              // padding: EdgeInsets.zero,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Consumer<CurrentUserModel>(
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () async {
                    try {
                      launch(
                        "mailto:beerballertrinkspiel@gmail.com?subject=Trinkspiel-App: Bug",
                      );
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppVariables.greyedOutText,
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "✋ Bug melden",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Consumer<CurrentUserModel>(
              builder: (context, value, child) {
                return ElevatedButton(
                  onPressed: () async {
                    await AuthService.instance.signOut();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppVariables.buttonColor,
                    shape: StadiumBorder(),
                  ),
                  child: Text(
                    "Ausloggen",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TabsIcon extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final IconData icons;

  const TabsIcon(
      {Key? key,
      this.color = Colors.white,
      this.height = 60,
      this.width = 70,
      required this.icons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: Icon(
          icons,
          color: color,
        ),
      ),
    );
  }
}
