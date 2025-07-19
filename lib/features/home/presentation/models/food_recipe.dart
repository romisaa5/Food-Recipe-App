class FoodRecipe {
  final String id;
  final String title;
  final String imageUrl;
  final String description;
  final List<String> ingredients;
  final List<String> steps;
  final String category;
  final String cuisine;
  final int duration;
  final double rating;

  FoodRecipe({
    required this.category,
    required this.cuisine,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.rating,
  });
  static List<FoodRecipe> foodRecipes = [
    FoodRecipe(
      id: 'r1',
      title: 'Koshary',
      imageUrl: 'assets/images/Image.png',
      description:
          'A famous Egyptian dish made of rice, pasta, lentils, and fried onions.',
      ingredients: ['Rice', 'Lentils', 'Pasta', 'Onions', 'Tomato Sauce'],
      steps: [
        'Cook rice and lentils',
        'Boil pasta',
        'Fry onions',
        'Mix and serve',
      ],
      category: 'Main Course',
      cuisine: 'Egyptian',
      duration: 45,
      rating: 4.5,
    ),
    FoodRecipe(
      id: 'r2',
      title: 'Pizza Margherita',
      imageUrl: 'assets/images/Image.png',
      description: 'Classic Italian pizza with tomato, mozzarella, and basil.',
      ingredients: ['Dough', 'Tomato Sauce', 'Mozzarella', 'Basil'],
      steps: ['Prepare dough', 'Spread sauce', 'Add toppings', 'Bake'],
      category: 'Main Course',
      cuisine: 'Italian',
      duration: 30,
      rating: 4.8,
    ),
    FoodRecipe(
      id: 'r3',
      title: 'Sushi',
      imageUrl: 'assets/images/Image.png',
      description: 'Traditional Japanese dish with vinegared rice and seafood.',
      ingredients: ['Rice', 'Nori', 'Fish', 'Vegetables'],
      steps: [
        'Cook rice',
        'Prepare fillings',
        'Roll with nori',
        'Cut and serve',
      ],
      category: 'Main Course',
      cuisine: 'Japanese',
      duration: 50,
      rating: 4.7,
    ),
    FoodRecipe(
      id: 'r4',
      title: 'Tacos',
      imageUrl: 'assets/images/Image.png',
      description:
          'Mexican dish with folded tortillas filled with various ingredients.',
      ingredients: ['Tortilla', 'Beef', 'Lettuce', 'Cheese', 'Salsa'],
      steps: ['Cook beef', 'Prepare fillings', 'Assemble tacos'],
      category: 'Snack',
      cuisine: 'Mexican',
      duration: 25,
      rating: 4.6,
    ),
    FoodRecipe(
      id: 'r1',
      title: 'Koshary',
      imageUrl: 'assets/images/Image.png',
      description:
          'A famous Egyptian dish made of rice, pasta, lentils, and fried onions.',
      ingredients: ['Rice', 'Lentils', 'Pasta', 'Onions', 'Tomato Sauce'],
      steps: [
        'Cook rice and lentils',
        'Boil pasta',
        'Fry onions',
        'Mix and serve',
      ],
      category: 'Main Course',
      cuisine: 'Egyptian',
      duration: 45,
      rating: 4.5,
    ),
    FoodRecipe(
      id: 'r2',
      title: 'Pizza Margherita',
      imageUrl: 'assets/images/Image.png',
      description: 'Classic Italian pizza with tomato, mozzarella, and basil.',
      ingredients: ['Dough', 'Tomato Sauce', 'Mozzarella', 'Basil'],
      steps: ['Prepare dough', 'Spread sauce', 'Add toppings', 'Bake'],
      category: 'Main Course',
      cuisine: 'Italian',
      duration: 30,
      rating: 4.8,
    ),
    FoodRecipe(
      id: 'r3',
      title: 'Sushi',
      imageUrl: 'assets/images/Image.png',
      description: 'Traditional Japanese dish with vinegared rice and seafood.',
      ingredients: ['Rice', 'Nori', 'Fish', 'Vegetables'],
      steps: [
        'Cook rice',
        'Prepare fillings',
        'Roll with nori',
        'Cut and serve',
      ],
      category: 'Main Course',
      cuisine: 'Japanese',
      duration: 50,
      rating: 4.7,
    ),
  ];
  static List<FoodRecipe> newRecipes = [
    FoodRecipe(
      id: 'n1',
      title: 'New Koshary',
      imageUrl: 'assets/images/Image.png',
      description:
          'A modern twist on the classic Egyptian dish with spicy sauce.',
      ingredients: ['Rice', 'Lentils', 'Pasta', 'Onions', 'Spicy Tomato Sauce'],
      steps: [
        'Cook rice and lentils',
        'Boil pasta',
        'Fry onions',
        'Add spicy sauce',
        'Mix and serve',
      ],
      category: 'Main Course',
      cuisine: 'Egyptian',
      duration: 50,
      rating: 4.6,
    ),
    FoodRecipe(
      id: 'n2',
      title: 'New Pizza Margherita',
      imageUrl: 'assets/images/Image.png',
      description: 'Fresh Italian pizza with extra cheese and herbs.',
      ingredients: ['Dough', 'Tomato Sauce', 'Mozzarella', 'Basil', 'Oregano'],
      steps: [
        'Prepare dough',
        'Spread sauce',
        'Add toppings',
        'Bake with care',
      ],
      category: 'Main Course',
      cuisine: 'Italian',
      duration: 35,
      rating: 4.9,
    ),
    FoodRecipe(
      id: 'n3',
      title: 'New Sushi Rolls',
      imageUrl: 'assets/images/Image.png',
      description: 'Creative sushi rolls with unique fillings and sauces.',
      ingredients: ['Rice', 'Nori', 'Fish', 'Avocado', 'Cream Cheese'],
      steps: [
        'Cook rice',
        'Prepare fillings',
        'Roll with nori and extras',
        'Cut and serve with wasabi',
      ],
      category: 'Main Course',
      cuisine: 'Japanese',
      duration: 55,
      rating: 3,
    ),
  ];
}
