import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String email;
  final String uid;

  const AppUser({
    required this.uid,
    required this.email,
  });

  static AppUser fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return AppUser(
      uid: snapshot["uid"],
      email: snapshot["email"],
    );
  }

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "email": email,
      };
}
