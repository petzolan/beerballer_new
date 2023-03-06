import 'package:async/async.dart';
import 'package:beerballer_new/Models/currentUser.dart';
import 'package:beerballer_new/Models/firestoreModels/currentUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class CurrentUserModel extends ChangeNotifier {
  bool gotUser = false;

  AsyncMemoizer _memoizer = AsyncMemoizer();
  CurrUser currUser = CurrUser(
    email: "email",
    collections: new Collection(collectionMap: {}),
    user_id: "user_id",
  );

  // changes Side Menu Globally
  Future<dynamic> getCurrentUser() async {
    print("entering");
    CurrUser temp = CurrUser(
      email: "email",
      collections: new Collection(collectionMap: {}),
      user_id: "user_id",
    );

    await FirebaseFirestore.instance
        .collection('users')
        .where("user_id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .first
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        temp = CurrUser.fromSnapshot(doc);
        currUser = temp;
      });
    });
    await Future.delayed(Duration(seconds: 1));
    gotUser = true;
    notifyListeners();
  }

  void toggleCurrUser() {
    print("gotUser is true!");
    gotUser = true;
  }

  void setCurrUser() {
    gotUser = false;
  }

  void updateCurrentUser() {
    this.getCurrentUser();
    notifyListeners();
  }
}
