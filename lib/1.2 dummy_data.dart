/*import 'package:flutter/material.dart';
import 'moduals/category.dart';
import 'moduals/item.dart';

const DUMMY_CATEGORIES = [
  Category(
    id: 'c1',
    title: 'Italian',
    color: Colors.purple,
  ),
  Category(
    id: 'c2',
    title: 'Quick & Easy',
    color: Colors.red,
  ),
  Category(
    id: 'c3',
    title: 'Hamburgers',
    color: Colors.orange,
  ),
  Category(
    id: 'c4',
    title: 'German',
    color: Colors.amber,
  ),
  Category(
    id: 'c5',
    title: 'Light & Lovely',
    color: Colors.blue,
  ),
  Category(
    id: 'c6',
    title: 'Exotic',
    color: Colors.green,
  ),
  Category(
    id: 'c7',
    title: 'Breakfast',
    color: Colors.lightBlue,
  ),
  Category(
    id: 'c8',
    title: 'Asian',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    title: 'French',
    color: Colors.pink,
  ),
  Category(
    id: 'c10',
    title: 'Summer',
    color: Colors.teal,
  ),
];

 const DUMMY_MEALS =  [
  Item(
    id: 'm1',
    categories: [
      'c1',
      'c2',
    ],
    title: 'Spaghetti with Tomato Sauce',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    steps: [
      'Cut the tomatoes and the onion into small pieces.',
      'Boil some water - add salt to it once it boils.',
      'Put the spaghetti into the boiling water - they should be done in about 10 to 12 minutes.',
      'In the meantime, heaten up some olive oil and add the cut onion.',
      'After 2 minutes, add the tomato pieces, salt, pepper and your other spices.',
      'The sauce will be done once the spaghetti are.',
      'Feel free to add some cheese on top of the finished dish.'
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true, 
  ),
  Item(
    id: 'm2',
    categories: [
      'c2',
    ],
    title: 'Toast Hawaii',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    duration: 10,
    ingredients: [
      '1 Slice White Bread',
      '1 Slice Ham',
      '1 Slice Pineapple',
      '1-2 Slices of Cheese',
      'Butter'
    ],
    steps: [
      'Butter one side of the white bread',
      'Layer ham, the pineapple and cheese on the white bread',
      'Bake the toast for round about 10 minutes in the oven at 200°C'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Item(
    id: 'm3',
    categories: [
      'c2',
      'c3',
    ],
    title: 'Classic Hamburger',
    affordability: Affordability.Pricey,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
    duration: 45,
    ingredients: [
      '300g Cattle Hack',
      '1 Tomato',
      '1 Cucumber',
      '1 Onion',
      'Ketchup',
      '2 Burger Buns'
    ],
    steps: [
      'Form 2 patties',
      'Fry the patties for c. 4 minutes on each side',
      'Quickly fry the buns for c. 1 minute on each side',
      'Bruch buns with ketchup',
      'Serve burger with tomato, cucumber and onion'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Item(
    id: 'm4',
    categories: [
      'c4',
    ],
    title: 'Wiener Schnitzel',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/03/31/19/29/schnitzel-3279045_1280.jpg',
    duration: 60,
    ingredients: [
      '8 Veal Cutlets',
      '4 Eggs',
      '200g Bread Crumbs',
      '100g Flour',
      '300ml Butter',
      '100g Vegetable Oil',
      'Salt',
      'Lemon Slices'
    ],
    steps: [
      'Tenderize the veal to about 2–4mm, and salt on both sides.',
      'On a flat plate, stir the eggs briefly with a fork.',
      'Lightly coat the cutlets in flour then dip into the egg, and finally, coat in breadcrumbs.',
      'Heat the butter and oil in a large pan (allow the fat to get very hot) and fry the schnitzels until golden brown on both sides.',
      'Make sure to toss the pan regularly so that the schnitzels are surrounded by oil and the crumbing becomes ‘fluffy’.',
      'Remove, and drain on kitchen paper. Fry the parsley in the remaining oil and drain.',
      'Place the schnitzels on awarmed plate and serve garnishedwith parsley and slices of lemon.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Item(
    id: 'm5',
    categories: [
      'c2'
          'c5',
      'c10',
    ],
    title: 'Salad with Smoked Salmon',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2016/10/25/13/29/smoked-salmon-salad-1768890_1280.jpg',
    duration: 15,
    ingredients: [
      'Arugula',
      'Lamb\'s Lettuce',
      'Parsley',
      'Fennel',
      '200g Smoked Salmon',
      'Mustard',
      'Balsamic Vinegar',
      'Olive Oil',
      'Salt and Pepper'
    ],
    steps: [
      'Wash and cut salad and herbs',
      'Dice the salmon',
      'Process mustard, vinegar and olive oil into a dessing',
      'Prepare the salad',
      'Add salmon cubes and dressing'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm6',
    categories: [
      'c6',
      'c10',
    ],
    title: 'Delicious Orange Mousse',
    affordability: Affordability.Affordable,
    complexity: Complexity.Hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2017/05/01/05/18/pastry-2274750_1280.jpg',
    duration: 240,
    ingredients: [
      '4 Sheets of Gelatine',
      '150ml Orange Juice',
      '80g Sugar',
      '300g Yoghurt',
      '200g Cream',
      'Orange Peel',
    ],
    steps: [
      'Dissolve gelatine in pot',
      'Add orange juice and sugar',
      'Take pot off the stove',
      'Add 2 tablespoons of yoghurt',
      'Stir gelatin under remaining yoghurt',
      'Cool everything down in the refrigerator',
      'Whip the cream and lift it under die orange mass',
      'Cool down again for at least 4 hours',
      'Serve with orange peel',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Item(
    id: 'm7',
    categories: [
      'c7',
    ],
    title: 'Pancakes',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/07/10/21/23/pancake-3529653_1280.jpg',
    duration: 20,
    ingredients: [
      '1 1/2 Cups all-purpose Flour',
      '3 1/2 Teaspoons Baking Powder',
      '1 Teaspoon Salt',
      '1 Tablespoon White Sugar',
      '1 1/4 cups Milk',
      '1 Egg',
      '3 Tablespoons Butter, melted',
    ],
    steps: [
      'In a large bowl, sift together the flour, baking powder, salt and sugar.',
      'Make a well in the center and pour in the milk, egg and melted butter; mix until smooth.',
      'Heat a lightly oiled griddle or frying pan over medium high heat.',
      'Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake. Brown on both sides and serve hot.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Item(
    id: 'm8',
    categories: [
      'c8',
    ],
    title: 'Creamy Indian Chicken Curry',
    affordability: Affordability.Pricey,
    complexity: Complexity.Challenging,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/06/18/16/05/indian-food-3482749_1280.jpg',
    duration: 35,
    ingredients: [
      '4 Chicken Breasts',
      '1 Onion',
      '2 Cloves of Garlic',
      '1 Piece of Ginger',
      '4 Tablespoons Almonds',
      '1 Teaspoon Cayenne Pepper',
      '500ml Coconut Milk',
    ],
    steps: [
      'Slice and fry the chicken breast',
      'Process onion, garlic and ginger into paste and sauté everything',
      'Add spices and stir fry',
      'Add chicken breast + 250ml of water and cook everything for 10 minutes',
      'Add coconut milk',
      'Serve with rice'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Item(
    id: 'm9',
    categories: [
      'c9',
    ],
    title: 'Chocolate Souffle',
    affordability: Affordability.Affordable,
    complexity: Complexity.Hard,
    imageUrl:
        'https://cdn.pixabay.com/photo/2014/08/07/21/07/souffle-412785_1280.jpg',
    duration: 45,
    ingredients: [
      '1 Teaspoon melted Butter',
      '2 Tablespoons white Sugar',
      '2 Ounces 70% dark Chocolate, broken into pieces',
      '1 Tablespoon Butter',
      '1 Tablespoon all-purpose Flour',
      '4 1/3 tablespoons cold Milk',
      '1 Pinch Salt',
      '1 Pinch Cayenne Pepper',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
      '1 Pinch Cream of Tartar',
      '1 Tablespoon white Sugar',
    ],
    steps: [
      'Preheat oven to 190°C. Line a rimmed baking sheet with parchment paper.',
      'Brush bottom and sides of 2 ramekins lightly with 1 teaspoon melted butter; cover bottom and sides right up to the rim.',
      'Add 1 tablespoon white sugar to ramekins. Rotate ramekins until sugar coats all surfaces.',
      'Place chocolate pieces in a metal mixing bowl.',
      'Place bowl over a pan of about 3 cups hot water over low heat.',
      'Melt 1 tablespoon butter in a skillet over medium heat. Sprinkle in flour. Whisk until flour is incorporated into butter and mixture thickens.',
      'Whisk in cold milk until mixture becomes smooth and thickens. Transfer mixture to bowl with melted chocolate.',
      'Add salt and cayenne pepper. Mix together thoroughly. Add egg yolk and mix to combine.',
      'Leave bowl above the hot (not simmering) water to keep chocolate warm while you whip the egg whites.',
      'Place 2 egg whites in a mixing bowl; add cream of tartar. Whisk until mixture begins to thicken and a drizzle from the whisk stays on the surface about 1 second before disappearing into the mix.',
      'Add 1/3 of sugar and whisk in. Whisk in a bit more sugar about 15 seconds.',
      'whisk in the rest of the sugar. Continue whisking until mixture is about as thick as shaving cream and holds soft peaks, 3 to 5 minutes.',
      'Transfer a little less than half of egg whites to chocolate.',
      'Mix until egg whites are thoroughly incorporated into the chocolate.',
      'Add the rest of the egg whites; gently fold into the chocolate with a spatula, lifting from the bottom and folding over.',
      'Stop mixing after the egg white disappears. Divide mixture between 2 prepared ramekins. Place ramekins on prepared baking sheet.',
      'Bake in preheated oven until scuffles are puffed and have risen above the top of the rims, 12 to 15 minutes.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Item(
    id: 'm10',
    categories: [
      'c2',
      'c5',
      'c10',
    ],
    title: 'Asparagus Salad with Cherry Tomatoes',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_1280.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Wash, peel and cut the asparagus',
      'Cook in salted water',
      'Salt and pepper the asparagus',
      'Roast the pine nuts',
      'Halve the tomatoes',
      'Mix with asparagus, salad and dressing',
      'Serve with Baguette'
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];*/
import 'package:flutter/material.dart';
import 'moduals/category.dart';
import 'moduals/item.dart';

const DUMMY_CATEGORIES = [
  Category(
    id: 'c1',
    title: 'Chest',
    color: Color.fromARGB(255, 215, 83, 238),
  ),
  Category(
    id: 'c2',
    title: 'Back',
    color: Color.fromARGB(255, 229, 112, 250),
  ),
  Category(
    id: 'c3',
    title: 'Abs',
    color: Color.fromARGB(255, 136, 84, 141)
  ),
  Category(
    id: 'c4',
    title: 'Shoulders',
    color: Color.fromARGB(255, 98, 15, 105)
  ),
  Category(
    id: 'c5',
    title: 'Legs',
    color: Color.fromARGB(255, 128, 2, 139)
  ),
  Category(
    id: 'c6',
    title: 'Triceps',
    color: Color.fromARGB(255, 220, 0, 240)
  ),
  Category(
    id: 'c7',
    title: 'Biceps',
    color: Color.fromARGB(255, 68, 23, 71)
  ),
  Category(
    id: 'c8',
    title: 'Forearms',
    color: Color.fromARGB(255, 81, 3, 87)
  ),
];

 const DUMMY_MEALS =  [
  
  Item(
    id: 'm1',
    categories: [
      'c1',
      //'c4',
      //'c6',
    ],
    title: 'Incline bench press',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'images/1.jpg',
    duration: 20,
    ingredients: [
      '4 Tomatoes',
      '1 Tablespoon of Olive Oil',
      '1 Onion',
      '250g Spaghetti',
      'Spices',
      'Cheese (optional)'
    ],
    steps: [
      'Lie on your back on the incline bench with your knees bent and feet flat on the floor. Grasp the barbell, with your thumb wrapped around the barbell and palms facing toward your feet. Press your arms straight toward the ceiling to lift the weight off the rack.',
      'Position the weight above your collarbone.',
      'Slowly lower the weight down to your chest, approximately in line with your mid-chest to just above your nipples.',
      'Pause, then press the weight back to the start position.',
      'Complete 3 sets of 8–12 repetitions.',
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true, 
  ),
  Item(
    id: 'm2',
    categories: [
      'c1',
      //'c4',
      //'c6',
    ],
    title: 'Decline bench press',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'images/2.png',
    duration: 10,
    ingredients: [
      '1 Slice White Bread',
      '1 Slice Ham',
      '1 Slice Pineapple',
      '1-2 Slices of Cheese',
      'Butter'
    ],
    steps: [
      'Lie on your back on the decline bench, with your knees bent and ankles secured behind the ankle rests. Grasp the barbell, with your thumb wrapped around the barbell and palms facing toward the feet. Press your arms straight to lift the weight off the rack.',
      'Position the weight above your lower chest to upper abdomen region.',
      'Slowly bend your elbows to lower the weight down to your chest, approximately in line with your nipples.',
      'Pause, then press the weight back to the start position.',
      'Complete 3 sets of 8–12 repetitions.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Item(
    id: 'm3',
    categories: [
      'c1',
      //'c4',
      //'c7',
    ],
    title: 'Cable crossover',
    affordability: Affordability.Pricey,
    complexity: Complexity.Simple,
    imageUrl:
        'images/3.jpg',
    duration: 45,
    ingredients: [
      '300g Cattle Hack',
      '1 Tomato',
      '1 Cucumber',
      '1 Onion',
      'Ketchup',
      '2 Burger Buns'
    ],
    steps: [
      'Begin by standing away from a set of high pulley cable machine or a resistance band anchored overhead. Select a light to moderate weight to add challenge but give you success.',
      'Grasp the hands (or the ends of the band) as you step forward with 1 foot. Keep enough tension and control on the handles to keep them in front of your chest.',
      'Contract your chest muscles and bring the handles down and forward across your body at roughly belly button level. The hands can cross to add emphasis to the serratus anterior muscles.',
      'Hold for a moment and then slowly return to the start. Then repeat.',
      'Do 3 sets of 8–12 repetitions.'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Item(
    id: 'm4',
    categories: [
      'c1',
      //'c2',
      //'c4',
      //'c6',
    ],
    title: 'Chest dip',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Challenging,
    imageUrl:
        'images/4.jpg',
    duration: 60,
    ingredients: [
      '8 Veal Cutlets',
      '4 Eggs',
      '200g Bread Crumbs',
      '100g Flour',
      '300ml Butter',
      '100g Vegetable Oil',
      'Salt',
      'Lemon Slices'
    ],
    steps: [
      'Stand facing the two parallel bars and grasp them, palms facing in.',
      'Straighten your elbows and press into your hands, lifting your body up so that it is in line with your hands.',
      'Then, bend your elbows and lower the chest toward your hands.',
      'Pause, then press back to the start position. Repeat.',
      'Do 3 sets of 8–12 repetitions.',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Item(
    id: 'm5',
    categories: [
      'c1',
      //'c2',
      //'c4',
      //'c6',
    ],
    title: 'Resistance band pullover',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/5.jpg',
    duration: 15,
    ingredients: [
      'Arugula',
      'Lamb\'s Lettuce',
      'Parsley',
      'Fennel',
      '200g Smoked Salmon',
      'Mustard',
      'Balsamic Vinegar',
      'Olive Oil',
      'Salt and Pepper'
    ],
    steps: [
      'Anchor the band on something solid. Then, lie on your back with your head toward the anchor point. The band should be about 1–2 feet higher than your head.',
      'Grasp the band overhead so that there is slight tension on the band. Keep your thumbs pointing to the sky and your palms facing away from each other.',
      'Keeping your core tight and elbows straight, pull the band toward your hips. Slowly return to the starting position with control.',
      'Do 3 sets of 8–12 repetitions.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm6',
    categories: [
      'c2',
      //'c4',
      //'c7',
      //'c8',
    ],
    title: 'Lat pulldown',
    affordability: Affordability.Affordable,
    complexity: Complexity.Hard,
    imageUrl:
        'images/6.jpg',
    duration: 240,
    ingredients: [
      '4 Sheets of Gelatine',
      '150ml Orange Juice',
      '80g Sugar',
      '300g Yoghurt',
      '200g Cream',
      'Orange Peel',
    ],
    steps: [
      'If you’re using a machine, position the pad so it’s touching your thighs. Stand up and grab the bar with hands wider than shoulder-width apart, then sit back down.',
      'Begin to pull the bar down toward your chest, bending your elbows and pointing them toward the floor. Engage your upper back and mid-back throughout the move. Keep your torso straight, and don’t allow yourself to lean back.',
      'Complete 1–3 sets of 8–12 reps.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Item(
    id: 'm7',
    categories: [
      //'c1',
      'c2',
      //'c7',
      //'c8',
    ],
    title: 'Quadruped single-arm dumbbell row',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'images/7.jpg',
    duration: 20,
    ingredients: [
      '1 1/2 Cups all-purpose Flour',
      '3 1/2 Teaspoons Baking Powder',
      '1 Teaspoon Salt',
      '1 Tablespoon White Sugar',
      '1 1/4 cups Milk',
      '1 Egg',
      '3 Tablespoons Butter, melted',
    ],
    steps: [
      'Start on hands and knees with a dumbbell positioned in each hand. Ensure your back is straight, your hands are directly below your shoulders, and your knees are directly below your hips.',
      'Row up and back with your right arm, bending your elbow and bringing the dumbbell to your armpit. Keep your elbow tucked at your side throughout the movement. You’ll notice that if you row too far, you’ll lose your balance.',
      'Slowly return the dumbbell to the starting position and repeat on the left side.',
      'Complete 1–3 sets of 8–12 reps on each side.'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Item(
    id: 'm8',
    categories: [
      'c2',
      //'c5',
    ],
    title: 'Barbell deadlift',
    affordability: Affordability.Pricey,
    complexity: Complexity.Challenging,
    imageUrl:
        'images/8.jpg',
    duration: 35,
    ingredients: [
      '4 Chicken Breasts',
      '1 Onion',
      '2 Cloves of Garlic',
      '1 Piece of Ginger',
      '4 Tablespoons Almonds',
      '1 Teaspoon Cayenne Pepper',
      '500ml Coconut Milk',
    ],
    steps: [
      'Stand behind a barbell with feet shoulder-width apart.',
      'Keeping chest lifted, begin to hinge at your hips and slowly bend knees, reaching down to pick up the barbell. Keep back straight and grasp the bar with both palms facing you.',
      'Keeping feet flat on the floor, push back up to a standing position. Your back should remain straight throughout the movement, and your shoulders should be down and back.',
      'Return to the starting position, pushing your hips back and bending your knees until you bring the barbell back toward the floor.',
      'Complete 1–3 sets of 8–12 reps.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Item(
    id: 'm9',
    categories: [
      'c2',
      //'c4',
    ],
    title: 'Reverse fly',
    affordability: Affordability.Affordable,
    complexity: Complexity.Hard,
    imageUrl:
        'images/9.jpg',
    duration: 45,
    ingredients: [
      '1 Teaspoon melted Butter',
      '2 Tablespoons white Sugar',
      '2 Ounces 70% dark Chocolate, broken into pieces',
      '1 Tablespoon Butter',
      '1 Tablespoon all-purpose Flour',
      '4 1/3 tablespoons cold Milk',
      '1 Pinch Salt',
      '1 Pinch Cayenne Pepper',
      '1 Large Egg Yolk',
      '2 Large Egg Whites',
      '1 Pinch Cream of Tartar',
      '1 Tablespoon white Sugar',
    ],
    steps: [
      'Holding a dumbbell in each hand, hinge forward at your hips until your torso forms a 45-degree angle with the floor, allowing the dumbbells to hang in front of you, palms facing each other. Have a slight bend in your elbows.',
      'Engaging your core, lift your arms up and out, squeezing your shoulder blades at the top.',
      'Slowly return to the starting position. Complete 1–3 sets of 8–12 reps.',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Item(
    id: 'm10',
    categories: [
      'c2',
      //'c5',
    ],
    title: 'Back extension',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/10.png',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Lie facedown on an exercise ball with your abdomen on the center of the ball. Press the balls of your feet into the floor behind you to stay balanced. You can position your feel against a wall for added support.',
      'Extend your arms overhead, in line with your ears. Bend first at your waist, bringing your body down toward the floor. This is your starting position.',
      'Slowly raise your upper body and arms toward the sky until your shoulders are above hip height. Engage your core and glutes and keep your feet on the floor.',
      'Pause for a moment at the top, then slowly lower down.',
      'Complete 1–3 sets of 8–12 reps.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm11',
    categories: [
      //'c1',
      //'c2',
      'c3',
      //'c5',
    ],
    title: 'Ab Wheel Rollout',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/11.png',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Kneel on the floor and hold an ab wheel beneath your shoulders.',
      'Brace your abs and roll the wheel forward until you feel you’re about to lose tension in your core and your hips might sag.',
      'Roll yourself back to start.',
      'Do as many reps as you can with perfect form.',
      'End the set when you think you might break form.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm12',
    categories: [
      'c3',
    ],
    title: 'Swiss Ball Crunch',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/12.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Lie back on the Swiss ball with feet shoulder-width apart on the floor.',
      'Your lower back should be supported by the ball.',
      'Place your hands behind your ears and tuck your chin.',
      'Curl your body up off the ball until you’re sitting up.',

    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm13',
    categories: [
      //'c1',
      'c3',
      //'c4',
      //'c6',
    ],
    title: 'Plank',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/13.png',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Get into pushup position and bend your elbows to lower your forearms to the floor.',
      'Hold the position with abs braced.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm14',
    categories: [
      'c3',
      //'c5',
    ],
    title: 'Suitcase Deadlift',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/14.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Load the barbell on the floor and stand to the left of it with feet hip-width apart.',
      'Bend your hips back and lower your body until you can grasp the barbell in its center with your right hand.',
      'Brace your core and, keeping your lower back in its natural arch, push through your heels to stand up and lock out your hips.',
      'Squeeze the bar hard to keep it from teetering.',
      'Focus on keeping your spine straight the entire set—do not bend laterally toward the barbell.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm15',
    categories: [
      'c3',
    ],
    title: 'Hanging Windshield Wiper',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/15.webp',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'While hanging from a bar, pull your toes toward the bar.',
      'Keeping control with your obliques and toes together, rotate your legs side to side.',
      'If this is too challenging at first, you can do a hanging leg lift.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm16',
    categories: [
      'c4',
      //'c6',
    ],
    title: 'Standing Dumbbell Fly',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/16.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Hold a dumbbell in each hand by your sides.',
      'Without shrugging, use your upper body to swing the weights up a few inches.',
      'Your arms and torso will form an upside down V shape.',
      'Think of it as a lateral raise with momentum but without full range of motion.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm17',
    categories: [
      //'c2',
      'c4',
    ],
    title: 'Face Pull',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/17.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Attach a rope handle to the top pulley of a cable station. ',
      'Grasp an end in each hand with palms facing each other. Step back to place tension on the cable.',
      'Pull the handles to your forehead so your palms face your ears and your upper back is fully contracted.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm18',
    categories: [
      'c4',
      //'c6',
    ],
    title: 'Dumbbell Neutral Grip Overhead Press',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/18.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Hold a dumbbell in each hand at shoulder level with palms facing each other and elbows pointing forward.',
      'Brace your core and press the weights straight overhead.',
      'At the top, shrug your shoulders and hold for a second.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm19',
    categories: [
      //'c2',
      'c4',
    ],
    title: 'Bentover Reverse Flye',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/19.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Set up as you did for the neutral-grip row but with lighter dumbbells.',
      'Raise your arms out to your sides 90 degrees, squeezing your shoulder blades together at the top for a second.',
      'Complete your set and then rest until the end of three minutes, when your timer goes off.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm20',
    categories: [
      //'c2',
      'c4',
    ],
    title: 'High Pull',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/20.jpeg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Grasp the bar with hands about double shoulder width and hold it in front of your thighs.',
      'Bend your knees and hips so the bar hangs just above your knees.',
      'Explosively extend your hips as if jumping and pull the bar up to shoulder level with elbows wide apart, as in an upright row.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm21',
    categories: [
      'c5',
    ],
    title: 'Back squat',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/21.jpeg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Load a barbell on your traps and stand with your feet shoulder-width apart. Your gaze should be ahead, your chest should be proud, and your toes should be pointed slightly out.',
      'Sit back into your hips, bend your knees, and drop down toward the floor. Ensure that your knees move slightly out, and do not collapse in.',
      'Lower until your thighs are parallel to the ground — or as far down as your mobility allows — then push back up to the starting position.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm22',
    categories: [
      'c5',
    ],
    title: 'Reverse lunge',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/22.png',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Stand with your feet shoulder-width apart and your arms down at your sides.',
      'Step backward with your right foot, lunging until your left leg forms a 90-degree angle. Keep your torso upright.',
      'Push back up through your left heel to the starting position.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm23',
    categories: [
      'c5',
    ],
    title: 'Single Leg Curl',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/23.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Lie face down on the leg curl machine with your heels against the lower pad and the bench against your thighs.',
      'Bend one knee to pull the pad up towards your backside as far as possible, then return to the start position and repeat on the other side.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm24',
    categories: [
      'c5',
    ],
    title: 'Leg Extension',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/24.png',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Sit in a leg extension machine with your ankles against the lower pad. Use your quads to push forwards and straighten your legs in front of you, then return to the start position.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm25',
    categories: [
      'c5',
    ],
    title: 'Barbell Bulgarian Split Squat',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/25.png',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Stand facing away from the bench, holding a barbell across your upper back. Have one leg resting on the bench behind you, laces down.',
      'Squat with your standing leg until the knee of your trailing leg almost touches the floor.',
      'Push up through your front foot to return to the start position.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm26',
    categories: [
      //'c1',
      //'c2',
      'c6',
    ],
    title: 'Dips',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/26.png',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Sit on a chair or bench with your hands just outside of the hips and the knees bent or the legs extended straight out (harder).',
      'Lift up onto the hands and, keeping the hips very close to the chair or bench, bend the elbows, lowering down until theyre at about 90 degrees.',
      'Keep the elbows pointing behind you, the shoulders down and the abs engaged.',
      'Push back to start and repeat for 1 to 3 sets of 8 to 16 reps.',
      'Avoid this exercise if you feel any pain in the shoulders.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm27',
    categories: [
      'c6',
    ],
    title: 'Overhead Triceps Extensions',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/27.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Sit on a chair, bench, or ball, or stand; keep back straight. Hold a weight in both hands, extending it up overhead.',
      'Keep your biceps close to your ears and elbows pointing forward as you lower the weight behind your head until the elbows are at about 90-degree angles.',
      'Straighten the arms, contracting the triceps, and then repeat for 1 to 3 sets of 8 to 16 reps.',
      'Keep the abs engaged throughout the exercise and avoid arching the back.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm28',
    categories: [
      'c6',
    ],
    title: 'Rope Pushdowns',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/28.png',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'At a cable machine with a rope attachment, hold on to the rope near the knotted ends and begin the exercise with the elbows bent at about 90 degrees, elbows next to the torso.',
      'Extend the arms, taking the hands down towards the floor, spreading the rope slightly out on either side as you contract the triceps.',
      'Bring the forearms back to start and repeat for 1 to 3 sets of 8 to 16 reps.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm29',
    categories: [
      //'c1',
      'c6',
    ],
    title: 'Close Grip Bench Presses',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/29.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Lie on a bench or step holding a barbell with hands about shoulder-width apart.',
      'Begin the exercise with the elbows bent and the barbell hovering just over the ribcage.',
      'Press the weight straight up over the ribcage, focusing on contracting the triceps.',
      'Lower and repeat for 1 to 3 sets of 8 to 16 reps.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm30',
    categories: [
      'c6',
    ],
    title: 'Lying Triceps Extensions (Skull Crushers)',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/30.jpeg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Lie on a bench, step, or floor and hold a barbell or dumbbells with your hands about shoulder-distance apart.',
      'Begin the exercise by extending the weight up over the head with your palms facing out and thumbs next to the fingers.',
      'Bend the elbows and lower the weight until the elbows are at about 90-degree angles. This would be the part of the exercise where you wouldnt want to crush your skull by going too low.',
     ' Squeeze the triceps to straighten the arms without locking the joints.',
      'Repeat for 1 to 3 sets of 8 to 16 reps.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm31',
    categories: [
      'c7',
      //'c8',
    ],
    title: 'STANDING DUMBBELL CURL',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/31.jpeg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Grab a pair of dumbbells and let them hang at arm’s length next to your sides.',
      'Turn your arms so your palms face forward. Without moving your upper arms, bend your elbows and curl the dumbbells as close to your shoulders as you can.',
      'Pause, then slowly lower the weight back to the starting position.',
      'Each time you return to the starting position, completely straighten your arms.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm32',
    categories: [
      'c7',
    ],
    title: 'EZ-BAR PREACHER CURL',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/32.jpeg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Grab an EZ-bar with your hands six inches apart.',
      'Rest your upper arms on the sloping pad of a preacher bench and hold the bar in front of you with your elbows slightly bent.',
      'Without moving your upper arms, bend your elbows and curl the bar toward your shoulders.',
      'Pause, then slowly lower the weight back to the starting position.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm33',
    categories: [
      'c7',
    ],
    title: 'CRUCIFIX CURL',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/33.jpeg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Set up a cable tower (or resistance band) so that you can hold the handle of the cable with your elbow just slightly below your shoulder from a tall kneeling position. Imagine theres a wall in front of you that you cant touch.',
      'Squeeze your biceps to curl the cable toward yourself, keeping your shoulder in position and bracing your core.',
      'Hold for a count, then return to the starting position.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm34',
    categories: [
      'c7',
      //'c8',
    ],
    title: 'STANDING BARBELL CURL',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/34.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Grab the barbell with an underhand grip, with your your hands positioned about as wide as your hips. To emphasize the inner portion of the bicep, take a wider grip; to target the outer part of the muscle, bring your hands closer together.',
      'Start holding the bar at hip height, then squeeze your core and contract your biceps to curl the bar up to shoulder height.',
      'Squeeze your biceps at the top of the movement, then slowly lower the weight back to the starting position, controlling the weight through the eccentric movement.',
      'Make sure to keep your feet solidly planted throughout the exercise, and dont use your hips to lift the weight.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm35',
    categories: [
      'c7',
    ],
    title: 'HAMMER CURL',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/35.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Grab a pair of dumbbells and let them hang at arm’s length next to your sides with your palms facing your thighs.',
      'Without moving your upper arms, bend your elbows and curl the dumbbells as close to your shoulders as you can.',
      'Pause, then slowly lower the weight back to the starting position.',
      'Each time you return to the starting position, completely straighten your arms.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm36',
    categories: [
      'c8',
    ],
    title: 'Dumbbell Wrist Flexion',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/36.jpeg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Sit on the edge of a bench holding a dumbbell in your right hand.',
      'Place your right forearm on your right thigh, with the back of your right wrist on top of your right kneecap.',
      'Concentrating on isolating just your hand, slowly lower the dumbbell as far as you can, maintaining a tight grip throughout the movement.',
      'Without lifting your arm off of your thigh, curl the dumbbell toward your bicep.',
      'Slowly lower the dumbbell back to neutral.',
      'Repeat on other side.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm37',
    categories: [
      //'c7',
      'c8',
    ],
    title: 'Reverse Curl',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/37.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Grasp the bar overhand at shoulder width with palms facing downward.',
      'Keeping your upper arms against your sides, slowly curl the bar.',
      'When the top of your hands reach your front delts, squeeze',
      'Slowly lower the bar back to starting position, keeping tension.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm38',
    categories: [
      //'c7',
      'c8',
    ],
    title: 'Zottman Curl',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/38.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Stand holding a dumbbell in each hand with palms facing your sides.',
      'Curl the weights, keeping your upper arms in place.',
      'While lifting the dumbbells, rotate your palms to face your biceps in the top position.',
      'Turn your palms to face down.',
      'Lower the weights slowly, as in a reverse curl.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm39',
    categories: [
      //'c1',
      //'c2',
      'c8',
    ],
    title: 'Chin-Up',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/39.jpeg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Grasp the bar with hands shoulder-width and palms facing you.',
      'Engaging your core, pull yourself up by contracting your shoulder blades together.',
      'Keep pulling until your chin is over the bar.',
      'Hold at the top.',
      'Slowly lower yourself to starting position.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm40',
    categories: [
      //'c7',
      'c8',
    ],
    title: 'Hammer Curl',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/40.jpg',
    duration: 30,
    ingredients: [
      'White and Green Asparagus',
      '30g Pine Nuts',
      '300g Cherry Tomatoes',
      'Salad',
      'Salt, Pepper and Olive Oil'
    ],
    steps: [
      'Stand upright and grip two dumbbells at the side of the body with the arms straight and palms facing your torso.',
      'Raise one dumbbell until the forearm is vertical and the thumb faces the shoulder. Hold the movement for one moment and squeeze the biceps.',
      'Slowly lower the dumbbell to starting position and repeat with other arms.',
    ],
    isGlutenFree: true,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true,
  ),
];

