import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_tracker/model/user_model.dart';

class ManageUsersService {
  final db = FirebaseFirestore.instance.collection("finance_tracker_users");

  Future<void> createNewUser({required UserModel user}) async {
    final userMap = user.toMap();
    await db.doc(user.uid).set(userMap);
  }

  Future<void> deleteUsere({required String uid}) async {
    await db.doc(uid).delete();
  }

  Future<void> getUser({required String uid}) async {
    await db.doc(uid).get();
  }
}
