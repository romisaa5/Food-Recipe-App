import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_recipe_app/core/helper/extentions.dart';
import 'package:food_recipe_app/core/theme/text_theme.dart';
import 'package:food_recipe_app/features/home/data/models/meal_details/meal.dart';
import 'package:food_recipe_app/features/home/presentation/ui/widgets/custom_search_card.dart';

class SavesView extends StatefulWidget {
  const SavesView({super.key});

  @override
  State<SavesView> createState() => _SavesViewState();
}

class _SavesViewState extends State<SavesView> {
  List<Meal> savedRecipes = [];

  @override
  void initState() {
    super.initState();
    fetchSavedRecipes();
  }

  Future<void> fetchSavedRecipes() async {
    final user = FirebaseAuth.instance.currentUser;
    final snapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .collection('savedMeals')
            .get();

    final recipes =
        snapshot.docs.map((doc) {
          final data = doc.data();
          return Meal(
            idMeal: doc.id,
            strMeal: data['mealName'] ?? '',
            strMealThumb: data['imageUrl'] ?? '',
            strArea: data['area'] ?? '',
          );
        }).toList();

    setState(() {
      savedRecipes = recipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 10.h,
        children: [
          20.ph,
          Align(
            alignment: Alignment.center,
            child: Text('Saved recipes', style: TextAppTheme.textStyle18),
          ),

          Expanded(
            child:
                savedRecipes.isEmpty
                    ? Center(child: Text('No saved recipes'))
                    : ListView.builder(
                      itemCount: savedRecipes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomSearchCard(
                            isSaved: true,
                            height: 150.h,
                            width: double.infinity,
                            foodRecipe: savedRecipes[index],
                          ),
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }
}
