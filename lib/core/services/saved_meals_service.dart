import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SavedMealsService {
  static final _user = FirebaseAuth.instance.currentUser;
  static final _firestore = FirebaseFirestore.instance;

  static Future<bool> isMealSaved(String mealId) async {
    final doc =
        await _firestore
            .collection('users')
            .doc(_user!.uid)
            .collection('savedMeals')
            .doc(mealId)
            .get();
    return doc.exists;
  }

  static Future<void> toggleSaveMeal(
    String mealId,
    Map<String, dynamic> mealData,
  ) async {
    final mealRef = _firestore
        .collection('users')
        .doc(_user!.uid)
        .collection('savedMeals')
        .doc(mealId);

    final doc = await mealRef.get();

    if (doc.exists) {
      await mealRef.delete();
    } else {
      await mealRef.set(mealData);
    }
  }
}
