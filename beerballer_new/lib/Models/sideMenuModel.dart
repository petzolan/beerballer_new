import 'package:flutter/cupertino.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class SideMenuModel extends ChangeNotifier {
  static GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();
  bool currentState = false;

  void closeSideMenu() {
    print("side close");
    sideMenuKey.currentState!.closeSideMenu();
    currentState = sideMenuKey.currentState!.isOpened;
  }

  // changes Side Menu Globally
  void toggleSideMenu() {
    print("side toggle");

    sideMenuKey.currentState!.isOpened
        ? sideMenuKey.currentState!.closeSideMenu()
        : sideMenuKey.currentState!.openSideMenu();

    currentState = sideMenuKey.currentState!.isOpened;

    notifyListeners();
  }
}
