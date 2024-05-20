import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethods {
  addUserInfoToDob(
    String userId,
    Map<String, dynamic> userInfoMap,
  ) {
    FirebaseFirestore.instance.collection("users").doc(userId).set(userInfoMap);
  }
}
