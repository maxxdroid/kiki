import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kiki/database/database.dart';
import 'package:kiki/functions/sharedpref.dart';
import 'package:kiki/widgets/loading_alert.dart';

class AuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;
  signInWithEmailandPAssword(
      String email, String password, BuildContext context) async {
    showDialog(
        context: context,
        builder: (_) {
          return const LoadingAlert(
            message: 'Logging in please wait...',
          );
        });
    late User? firebseUser;
    await auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((authUser) {
      firebseUser = authUser.user;
      SharedPrefHelper().saveUserID(firebseUser!.uid);
      // readLogInData(firebseUser!);
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.popAndPushNamed(context, "screen");
    }).onError((error, stackTrace) {
      Navigator.of(context);
      // logInErrorHandling(error.toString());
    });
  }

  logOutUser() {
    auth.signOut();
  }

  signUpWithEmailandPassword(String email, String password, BuildContext context) async {

    late User? firebaseUser;

    showDialog(
        context: context,
        builder: (_) {
          return const LoadingAlert(
            message: 'Registering please wait...',
          );
        });

    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((authUser) {
      firebaseUser = authUser.user;

      SharedPrefHelper().saveUserID(firebaseUser!.uid);
      

      Map<String, dynamic> userInfoMap = {
        "Email": email,
        "imgUrl": "",
        "User Id" : firebaseUser!.uid,
      };

      DataBaseMethods()
          .addUserInfoToDob(firebaseUser!.uid, userInfoMap);
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.pushReplacementNamed(context, "Kiki home");
    }).onError((error, stackTrace) {});
  }
  
}
