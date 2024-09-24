import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kiki/screens/mainscreens/kiki_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthMethods {
  FirebaseAuth auth = FirebaseAuth.instance;
  signUp(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? firebaseUser = userCredential.user;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('email', email);

      if (firebaseUser != null) {
        Get.to(const KikiHome(), transition: Transition.circularReveal);
      }
    } catch (error) {
      errorHandling(error);
    }
  }

  // signInWithGoogle() async{
  //   final GoogleSignInAccount? googleSignInUser = await GoogleSignIn().signIn();
  //
  //   final GoogleSignInAuthentication googleSignInAuth = await googleSignInUser!.authentication;
  //
  //   final credential  = GoogleAuthProvider.credential(
  //     accessToken: googleSignInAuth.accessToken,
  //     idToken: googleSignInAuth.idToken,
  //   );
  //
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInUser = await GoogleSignIn().signIn();
      if (googleSignInUser == null) {
        // The user canceled the sign-in
        return null;
      }
      final GoogleSignInAuthentication googleSignInAuth = await googleSignInUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuth.accessToken,
        idToken: googleSignInAuth.idToken,
      );
      // print("credentials: " + credential);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      // Handle error
      print('Error signing in with Google: $e');
      return null;
    }
  }
  logOutUser() {
    auth.signOut();
  }

  Future<void> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        Get.to(
          const KikiHome(),
          transition: Transition.cupertino,
          duration: const Duration(seconds: 1),
        );
      }
    } catch (error) {
      errorHandling(error);
    }
  }

  void errorHandling(dynamic error) {
    String errorMessage;

    switch (error.code) {
      case "email-already-in-use":
        errorMessage = "Email already used. Go to login page.";
        Get.back();
        break;
      case "wrong-password":
        errorMessage = "Wrong email/password combination.";
        Get.back();
        break;
      case "user-not-found":
        errorMessage = "No user found with this email.";
        Get.back();
        break;
      case "user-disabled":
        errorMessage = "User disabled.";
        Get.back();
        break;
      case "too-many-requests":
        errorMessage = "Too many requests to log into this account.";
        Get.back();
        break;
      case "operation-not-allowed":
        errorMessage = "Server error, please try again later.";
        Get.back();
        break;
      case "invalid-email":
        errorMessage = "Email address is invalid.";
        Get.back();
        break;
      default:
        errorMessage = "Sign up error, please try again later.";
        Get.back();
    }
    Fluttertoast.showToast(msg: errorMessage);
  }
}
