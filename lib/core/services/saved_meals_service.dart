import 'package:hive/hive.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SavedMealsService {
  static final _box = Hive.box('savedMealsBox');

  static String get _userId => FirebaseAuth.instance.currentUser!.uid;

  /// Get list of saved meals for current user
  static List<Map<String, dynamic>> get _currentUserMeals {
    final rawList = _box.get(_userId, defaultValue: []);
    return List<Map<String, dynamic>>.from(
      (rawList as List).map((e) => Map<String, dynamic>.from(e)),
    );
  }

  /// Check if a meal is already saved
  static Future<bool> isMealSaved(String mealId) async {
    return _currentUserMeals.any((meal) => meal['id'] == mealId);
  }

  /// Toggle save/remove meal
  static Future<void> toggleSaveMeal(
    String mealId,
    Map<String, dynamic> mealData,
  ) async {
    List<Map<String, dynamic>> meals = _currentUserMeals;

    final isSaved = meals.any((meal) => meal['id'] == mealId);
    if (isSaved) {
      meals.removeWhere((meal) => meal['id'] == mealId);
    } else {
      meals.add({...mealData, 'id': mealId});
    }

    await _box.put(_userId, meals);
  }

  static Future<List<Map<String, dynamic>>> getSavedMeals() async {
    return _currentUserMeals;
  }

  /// Clear all saved meals (optional)
  static Future<void> clearAll() async {
    await _box.put(_userId, []);
  }
}
