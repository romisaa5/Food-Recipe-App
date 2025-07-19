import 'package:flutter/material.dart';
import 'package:food_recipe_app/food_recipe_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:food_recipe_app/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings = const Settings(
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  final prefs = await SharedPreferences.getInstance();
  final isOnBoarded = prefs.getBool('isOnBoarded') ?? false;
  runApp(FoodRecipeApp(isOnBoarded: isOnBoarded));
}
