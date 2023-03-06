import 'dart:async';
import 'package:beerballer_new/Models/currentUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'databaseService.dart';

class AuthService {
  AuthService._();
  static AuthService _instance = AuthService._();
  static AuthService get instance => _instance;

  // get current FirebaseAuth instance
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // get current DatabaseService instance
  DatabaseService service = DatabaseService.instance;
  String userName = "";

  // create user object based on FirebaseUser
  User? _userFromFirebaseUser(User? pUser) {
    return pUser;
  }

  // get the current user to see if someone is logged in (MAIN)
  Stream<User?> get user {
    return _firebaseAuth.authStateChanges().map(
          _userFromFirebaseUser,
        );
  }

  // get a CurrentUser Object out of logged in user
  CurrentUser? _userFromFirebase(User user) {
    return user != null ? CurrentUser(user.uid) : null;
  }

  // E-Mail & Password _____________________________________________________________________
  // sign in with email & password
  Future signInWithEmailAndPassword(
    String pEmail,
    String pPassword,
    String pUsername,
  ) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: pEmail,
        password: pPassword,
      );
      User? user = result.user;
      CollectionReference users =
          FirebaseFirestore.instance.collection("users");
      DocumentReference documentReference = users.doc(user!.uid);

      String name = '';
      Map<String, List<String>> collections = {
        "Gefällt dir": DatabaseService.instance.getListOfFavoriteGamesOfUser(),
      };
      String userAvatar = '😆';

      name = pUsername == ''
          ? await documentReference.get().then((snapshot) {
              collections = snapshot.get("user_collections");
              userAvatar = snapshot.get("user_avatar");
              return snapshot.get("user_name");
            })
          : pUsername;

      await service.updateUserData(
        user.uid,
        pEmail,
        // name,
        // userAvatar,
        collections,
      );

      this.userName = name;
      return _userFromFirebase(user);
    } catch (error) {
      print(
        error.toString(),
      );
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(
      String pEmail, String pPassword, String pUsername) async {
    try {
      UserCredential result =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: pEmail,
        password: pPassword,
      );

      User? user = result.user;
      Map<String, List<String>> collections = {
        "Gefällt dir": DatabaseService.instance.getListOfFavoriteGamesOfUser(),
      };
      // String userAvatar = '😆';

      // create a new doc for user in firestore
      // await DatabaseService(user.uid).updateUserData(pEmail, "test");
      await service.updateUserData(
        user!.uid,
        pEmail,
        // pUsername,
        // userAvatar,
        collections,
      );

      return _userFromFirebase(user);
    } catch (error) {
      print(
        error.toString(),
      );
      return null;
    }
  }

  // Google __________________________________________________________________________________
  // sign in with google
  final googleSignin = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  // login with google
  Future loginWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await googleSignin.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      // Once signed in, return the UserCredential
      final result = await _firebaseAuth.signInWithCredential(credential);

      User? user = result.user;

      CollectionReference users =
          FirebaseFirestore.instance.collection("users");
      DocumentReference documentReference = users.doc(user!.uid);

      // User name
      String name = "";

      // User collections
      Map<String, List<String>> collections = {};

      // user avatar
      String stringUserAvatar = "";

      await documentReference.get().then(
            (doc) => {
              if (doc.exists && doc.get("user_name") != "")
                {
                  name = doc.get("user_name"),
                  collections = doc.get("user_collections"),
                  stringUserAvatar = doc.get("user_avater"),
                  if (name == "")
                    {
                      name = googleUser.displayName.toString(),
                    }
                }
              else
                {
                  name = googleUser.displayName.toString(),
                  collections = {
                    "Gefällt dir":
                        DatabaseService.instance.getListOfFavoriteGamesOfUser(),
                  },
                  stringUserAvatar = "😆",
                }
            },
          );
      print("Name of user: " + name);
      await service.updateUserData(
        user.uid,
        googleUser.email,
        // name,
        // stringUserAvatar,
        collections,
      );
      print("successfully loaded user data to firestore");
      this.userName = name;

      return _userFromFirebase(user);
    } catch (error) {
      print(error);
    }
  }

  // Sign Out ____________________________________________________________________________
  // sign out
  Future signOut() async {
    try {
      return await _firebaseAuth.signOut();
      
    } catch (error) {
      print(
        error.toString(),
      );
      return null;
    }
  }

  // reset Password ______________________________________________________________________
  // reset Password
  Future resetPassword(String eMail) async {
    await _firebaseAuth.sendPasswordResetEmail(email: eMail);
  }
}
