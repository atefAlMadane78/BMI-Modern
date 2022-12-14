import 'package:flutter/material.dart';
import './models/category.dart';
import './models/meal.dart';

const DUMMY_CATEGORIES = [
  Category(
    id: 'c1',
    title: 'Vegetables',
    color: Colors.yellow,
    image: "assets/image/vegg.jpg",
    ya: true,
  ),
  Category(
      id: 'c2',
      title: 'Fruits',
      color: Colors.yellow,
      image: "assets/image/fruit.jpg",
      ya: true),
  Category(
      id: 'c3',
      title: 'Meat',
      color: Colors.yellow,
      image: "assets/image/meat.jpg",
      ya: true),
  Category(
      id: 'c4',
      title: 'Grain & pulses',
      color: Colors.yellow,
      image: "assets/image/p.jpg",
      ya: true),
  Category(
      id: 'c5',
      title: 'Drinks',
      color: Colors.white,
      image: "assets/image/drink.jpg",
      ya: true),
  Category(
      id: 'c6',
      title: 'Plant & Animal Products ',
      color: Colors.white,
      image: "assets/image/plant_an.jpg",
      ya: true),
  Category(
      id: 'c7',
      title: 'Desserts',
      color: Colors.yellow,
      image: "assets/image/icecrram.jpg",
      ya: false),
  Category(
      id: 'c8',
      title: 'Oils',
      color: Colors.yellow,
      image: "assets/image/oil.jpg",
      ya: true),
  Category(
      id: 'c9',
      title: 'Spices & Spices',
      color: Colors.yellow,
      image: "assets/image/s.jpg",
      ya: true),
  Category(
      id: 'c10',
      title: 'Fish & Researchers',
      color: Colors.yellow,
      image: "assets/image/fish.jpg",
      ya: true),
  Category(
      id: 'c11',
      title: 'Fast Food',
      color: Colors.yellow,
      image: "assets/image/fast.jpg",
      ya: false),
  Category(
      id: 'c12',
      title: 'Traditional meals ',
      color: Colors.yellow,
      image: "assets/image/tra.jpg",
      ya: false),
];
// variable a is true when element is veg or fruit and false accept that
const DUMMY_MEALS =  [
  Meal(
    id: 'm1',
    categories: [
      'c1',
    ],
    title: 'carrots ',
    imageUrl: "assets/image/carrots.jpg",
    calories: "35 cal",
    ingredients: [],
    a: true,
  ),
  Meal(
    id: 'm2',
    categories: [
      'c12',
    ],
    title: 'Rings of fried onion ',
    imageUrl: "assets/image/ringonin.jpg",
    ingredients: [
      'Onions: 3 pcs (large size / cut into thick circles)',
      'Flour: a cup and a half',
      'Baking powder: a teaspoon',
      'Salt: a teaspoon',
      'Black pepper: a quarter of a teaspoon',
      'Eggs: 2 tablets',
      'Milk: a cup',
      'Rusks: a cup (crushed cakes)',
      'Oil: abundant (for frying)',
    ],
    calories: "45 cal",
    a: false,
  ),
  Meal(
    id: 'm3',
    categories: [
      'c11',
    ],
    title: 'Fahita ',
    imageUrl: "assets/image/fahita.jpg",
    ingredients: [
      '1/2 c. plus 1 tbsp. extra-virgin olive oil',
      '1/4 c. lime juice, from about 3 limes',
      '2 tsp. cumin',
      '1/2 tsp. crushed red pepper flakes',
      '1 lb. boneless skinless chicken breasts',
      'Kosher salt',
      'Freshly ground black pepper',
      '2 bell peppers, thinly sliced',
      '1 large onion, thinly sliced',
      'Tortillas, for serving',
    ],
    calories: "56 cal",    a: false,

  ),
  Meal(
    id: 'm4',
    categories: [
      'c11',
    ],
    title: 'hamburger ',
    imageUrl: "assets/image/hamburger.jpg",
    ingredients: [
      '1????? pounds lean ground beef',
      '?? onion, finely chopped',
      '?? cup shredded Colby Jack or Cheddar cheese',
      '1 (1 ounce) envelope dry onion soup mix',
      '1 egg',
      '1 clove garlic, minced',
      '1 tablespoon garlic powder',
      '1 teaspoon soy sauce',
      '1 teaspoon Worcestershire sauce',
      '1 teaspoon dried parsley',
      '1 teaspoon dried basil',
      '1 teaspoon dried oregano',
      '?? teaspoon crushed dried rosemary',
      'salt and pepper to taste',
    ],
    calories: "70 cal",    a: false,

  ),
  Meal(
    id: 'm5',
    categories: [
      'c11',
    ],
    title: 'kofta ',
    imageUrl: "assets/image/kofta.jpg",
    ingredients: [
      '1 medium yellow onion, quartered',
      '2 garlic cloves',
      '1 whole bunch parsley, stems removed (about 2 packed cups parsley leaves)',
      '1 lb ground beef',
      '?? lb ground lamb',
      '1 slice of bread, toasted until browned and soaked in water until fully tender',
      'Salt and pepper',
      '1 ?? tsp ground allspice',
      '?? tsp cayenne pepper',
      '?? tsp ground green cardamom',
      '?? tsp ground sumac',
      '?? tsp ground nutmeg',
      '?? tsp paprika',
      'Pita bread to serve',
    ],
    calories: "78 cal",    a: false,

  ),
  Meal(
    id: 'm6',
    categories: [
      'c11',
    ],
    title: 'Shawarma-meat ',
    imageUrl: "assets/image/Shawarma-meat.jpg",
    ingredients: [
      '2 lb flap steak(850 g)',
      '6 tablespoons olive oil',
      '1 ?? large lemons, juiced',
      '2 tablespoons allspice',
      '1 tablespoon coriander',
      '1 tablespoon paprika',
      '1 tablespoon cumin',
      '1 ?? teaspoons salt, to taste',
      '1 teaspoon garlic powder',
      '1 teaspoon sumac',
      '?? teaspoon black pepper',
      '?? teaspoon turmeric',
      '1 dash cinnamon',
    ],
    calories: "45 cal",    a: false,

  ),
  Meal(
    id: 'm7',
    categories: [
      'c11',
    ],
    title: 'toast ',
    imageUrl: "assets/image/toast.jpg",
    ingredients: [
      'Cream Cheese Veggie (No.1)',
      'Puree 4 ounces cream cheese',
      'with 1 tablespoon each chopped dill',
      'chives, tarragon and parsley in a food processor',
      'season with salt and pepper',
      'Spread on 4 slices toasted pumpernickel bread.',
      'Top with thinly sliced carrots, radishes,',
      'cucumbers and mushrooms.',
    ],
    calories: "60 cal",    a: false,

  ),
  Meal(
    id: 'm8',
    categories: [
      'c11',
    ],
    title: 'Kudo',
    imageUrl: "assets/image/kudo.jpg",
    ingredients: [
      '3 chicken breasts cut into cubes',
      'Diced colored bell pepper',
      '3 fresh mushrooms, sliced, or a small box of sliced mushrooms',
      'large onion, diced wedges',
      'two cloves of garlic',
      '2 ml mayonnaise',
      'yoghurt',
      '2 mt soy sauce',
      'm p paprika',
      'Mixed spice',
      'm s garlic powder',
      'm s black pepper',
      'm p turmeric',
    ],
    calories: "23 cal",    a: false,

  ),
  Meal(
    id: 'm9',
    categories: [
      'c11',
    ],
    title: 'crispy ',
    imageUrl: "assets/image/crispy.jpg",
    ingredients: [
      '4 cups all-purpose flour, divided',
      '2 tablespoons garlic salt',
      '1 tablespoon paprika',
      '3 teaspoons pepper,divided',
      '2-1/2 teaspoons poultry seasoning',
      '2 large eggs',
      '1-1/2 cups water',
      '1 teaspoon salt',
      '2 broiler/fryer chickens (3-1/2 to 4 pounds each), cut up',
      'Oil for deep-fat frying',
    ],
    calories: "45 cal",    a: false,

  ),
  Meal(
    id: 'm10',
    categories: [
      'c11',
    ],
    title: 'burger ',
    imageUrl: "assets/image/burger.jpg",
    ingredients: [
      '1 pound ground lean (7% fat) beef',
      '1 large egg',
      '?? cup minced onion',
      '?? cup fine dried bread crumbs',
      '1 tablespoon Worcestershire',
      '1 or 2 cloves garlic, peeled and minced',
      'About 1/2 teaspoon salt',
      'About 1/4 teaspoon pepper',
      '4 hamburger buns (4 in. wide),split',
      'About 1/4 cup mayonnaise',
      'About 1/4 cup ketchup',
      '4 iceberg lettuce leaves,rinsed and crisped',
      '1 firm-ripe tomato, cored and thinly sliced',
      '4 thin slices red onion',
    ],
    calories: "45 cal",    a: false,

  ),
  Meal(
    id: 'm11',
    categories: [
      'c1',
    ],
    title: ' tomatoes',
    imageUrl: "assets/image/tomato.jpg",
    calories: "20 cal",
    ingredients: [],    a: true,

  ),
  Meal(
    id: 'm12',
    categories: [
      'c1',
    ],
    title: 'shunder ',
    imageUrl: "assets/image/shunder.jpg",
    calories: "37 cal",
    ingredients: [], a: true,
  ),
  Meal(
    id: 'm13',
    categories: [
      'c5',
    ],
    title: 'sugar ',
    imageUrl: "assets/image/Sugar.jpg",
    ingredients: [],
    calories: "31 cal", a: true,
  ),
  Meal(
    id: 'm14',
    categories: [
      'c5',
    ],
    title: 'tea',
    imageUrl: "assets/image/tea.jpg",
    ingredients: [],
    calories: "10 cal", a: true,
  ),
  Meal(
    id: 'm15',
    categories: [
      'c5',
    ],
    title: 'coffe ',
    imageUrl: "assets/image/coffe.jpg",
    ingredients: [],
    calories: "2 cal", a: true,
  ),
  Meal(
    id: 'm16',
    categories: [
      'c5',
    ],
    title: 'natural juice ',
    imageUrl: "assets/image/natural_juice.jpg",
    ingredients: [],
    calories: "106 cal", a: true,
  ),
  Meal(
    id: 'm17',
    categories: [
      'c5',
    ],
    title: 'beer',
    imageUrl: "assets/image/beer.jpg",
    ingredients: [],
    calories: "56 cal", a: true,
  ),
  Meal(
    id: 'm18',
    categories: [
      'c5',
    ],
    title: ' water ',
    imageUrl: "assets/image/water.jpg",
    ingredients: [],
    calories: "0 cal", a: true,
  ),
  Meal(
    id: 'm19',
    categories: [
      'c11',
    ],
    title: 'kentucky',
    imageUrl: "assets/image/kentucky.jpg",
    ingredients: [
      'One kilogram of chicken, cut into eight parts.',
      'a cup of flour. Two eggs. A tablespoon of baking powder.',
      'A teaspoon of garlic powder.',
      'One teaspoon of onion powder.',
      'A teaspoon of black pepper.',
      'A teaspoon of cumin.',
      'Half a teaspoon of ground ginger.',
      'Half a teaspoon of fine cinnamon.',
      'A teaspoon of paprika.',
      'Small spoon of salt.',
      'Chicken Marinade Ingredients:',
      'Lemon juice.',
      'Two tablespoons of white vinegar.',
      'A tablespoon of corn oil.',
      'A teaspoon of black pepper.',
      'Small spoon of salt.',
      'Two tablespoons of hot sauce.',
    ],
    calories: "32 cal", a: false,
  ),
  Meal(
    id: 'm20',
    categories: [
      'c11',
    ],
    title: ' pizza ',
    imageUrl: "assets/image/pizza.jpg",
    ingredients: [
      'Pizza Dough:',
      '1 1/2 cups (355 ml) warm water (105??F-115??F)',
      '1 package (2 1/4 teaspoons) active dry yeast',
      '3 3/4 cups (490g) bread flour',
      '2 tablespoons extra virgin olive oil (omit if cooking pizza in a wood-fired pizza oven)',
      '2 teaspoons kosher salt',
      '1 teaspoon sugar',
      'Pizza Ingredients',
      'Extra virgin olive oil',
      'Cornmeal (to help slide the pizza onto the pizza stone)',
      'Tomato sauce (smooth or pureed)',
      'Firm mozzarella cheese, grated',
      'Fresh soft mozzarella cheese, separated into small clumps',
      'Fontina cheese, grated',
      'Parmesan cheese, grated',
      'Feta cheese, crumbled',
      'Mushrooms, very thinly sliced if raw, otherwise first saut??ed',
      'Bell peppers, stems and seeds removed, very thinly sliced',
      'Italian pepperoncini, thinly sliced',
      'Italian sausage, cooked ahead and crumbled',
      'Sliced black olives',
      'Chopped fresh basil',
      'Baby arugula, tossed in a little olive oil, added as pizza comes out of the oven',
      'Pesto',
      'Pepperoni, thinly sliced',
      'Onions, thinly sliced raw or caramelized',
      'Ham, thinly sliced',
    ],
    calories: "114 cal",a: false,
  ),
  Meal(
    id: 'm21',
    categories: [
      'c7',
    ],
    title: ' Chocolate biscuits ',
    imageUrl: "assets/image/Chocolate biscuits.jpg",
    ingredients: [],
    calories: "349 cal",a: true,
  ),
  Meal(
    id: 'm22',
    categories: [
      'c7',
    ],
    title: ' Donut ',
    imageUrl: "assets/image/Donut.jpg",
    ingredients: [],
    calories: "120 cal",a: true,
  ),
  Meal(
    id: 'm23',
    categories: [
      'c7',
    ],
    title: ' Flannel chocolate ',
    imageUrl: "assets/image/Flannel_chocolate.jpg",
    ingredients: [],
    calories: "259",a: true,
  ),
  Meal(
    id: 'm24',
    categories: [
      'c7',
    ],
    title: ' ice creamm ',
    imageUrl: "assets/image/ice_creamm.jpg",
    ingredients: [],
    calories: "340 cal",a: true,
  ),
  Meal(
    id: 'm25',
    categories: [
      'c7',
    ],
    title: ' Ice sandwish ',
    imageUrl: "assets/image/Ice_sandwish.jpg",
    ingredients: [],
    calories: "167 cal",a: true,
  ),
  Meal(
    id: 'm26',
    categories: [
      'c7',
    ],
    title: ' Ice strawberry ',
    imageUrl: "assets/image/Ice_strawberry.jpg",
    ingredients: [],
    calories: "220 cal",a: true,
  ),
  Meal(
    id: 'm27',
    categories: [
      'c7',
    ],
    title: ' icecreamm ',
    imageUrl: "assets/image/icecreamm.jpg",
    ingredients: [],
    calories: "167 cal",a: true,
  ),
  Meal(
    id: 'm28',
    categories: [
      'c7',
    ],
    title: ' Salty biscuits ',
    imageUrl: "assets/image/Salty biscuits.jpg",
    ingredients: [],
    calories: "120 cal",a: true,
  ),
  Meal(
    id: 'm29',
    categories: [
      'c1',
    ],
    title: 'cosa ',
    imageUrl: "assets/image/cosa.jpg",
    calories: "18 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm30',
    categories: [
      'c1',
    ],
    title: ' Eggplant ',
    imageUrl: "assets/image/Eggplant.jpg",
    calories: "20 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm31',
    categories: [
      'c1',
    ],
    title: 'olive',
    imageUrl: "assets/image/olive.jpg",
    calories: "114 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm32',
    categories: [
      'c1',
    ],
    title: 'mint',
    imageUrl: "assets/image/mint.jpg",
    calories: "65 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm33',
    categories: [
      'c1',
    ],
    title: 'mushroom ',
    imageUrl: "assets/image/mushroom.jpg",
    calories: "9 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm34',
    categories: [
      'c1',
    ],
    title: 'onion',
    imageUrl: "assets/image/onion.jpeg",
    calories: "34 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm35',
    categories: [
      'c1',
    ],
    title: 'potato ',
    imageUrl: "assets/image/potato.jpg",
    calories: "73 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm36',
    categories: [
      'c1',
    ],
    title: 'selek',
    imageUrl: "assets/image/selek.jpg",
    calories: "7 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm37',
    categories: [
      'c2',
    ],
    title: 'apple',
    imageUrl: "assets/image/apple.jpg",
    calories: "81 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm38',
    categories: [
      'c2',
    ],
    title: 'Avocado',
    imageUrl: "assets/image/Avocado.jpg",
    calories: "240 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm39',
    categories: [
      'c2',
    ],
    title: 'banana',
    imageUrl: "assets/image/banana.jpg",
    calories: "67 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm40',
    categories: [
      'c2',
    ],
    title: 'berries',
    imageUrl: "assets/image/berries.jpg",
    calories: "60 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm41',
    categories: [
      'c2',
    ],
    title: 'cherry',
    imageUrl: "assets/image/cherry.jpg",
    calories: "49 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm42',
    categories: [
      'c2',
    ],
    title: 'figs',
    imageUrl: "assets/image/figs.jpg",
    calories: "37 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm43',
    categories: [
      'c2',
    ],
    title: 'grape',
    imageUrl: "assets/image/grape.jpg",
    calories: "35 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm44',
    categories: [
      'c2',
    ],
    title: 'limon',
    imageUrl: "assets/image/limon.jpg",
    calories: "42 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm45',
    categories: [
      'c2',
    ],
    title: 'orange',
    imageUrl: "assets/image/orange.jpg",
    calories: "62 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm46',
    categories: [
      'c2',
    ],
    title: 'Peach',
    imageUrl: "assets/image/Peach.jpg",
    calories: "17 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm47',
    categories: [
      'c2',
    ],
    title: 'pineapple',
    imageUrl: "assets/image/pineapple.jpg",
    calories: "76 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm48',
    categories: [
      'c2',
    ],
    title: 'pomegranate',
    imageUrl: "assets/image/pomegranate.jpg",
    calories: "110 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm49',
    categories: [
      'c2',
    ],
    title: 'strawberry',
    imageUrl: "assets/image/strawberry.jpg",
    calories: "46 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm50',
    categories: [
      'c2',
    ],
    title: 'watermelon',
    imageUrl: "assets/image/watermelon.jpg",
    calories: "26 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm51',
    categories: [
      'c3',
    ],
    title: 'dick romi meat',
    imageUrl: "assets/image/dick romi_meat.jpg",
    calories: "187 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm52',
    categories: [
      'c3',
    ],
    title: 'hurry meat',
    imageUrl: "assets/image/hurry_meat.jpg",
    calories: "245 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm53',
    categories: [
      'c3',
    ],
    title: 'pigeon meat',
    imageUrl: "assets/image/pigeon_meat.jpeg",
    calories: "181 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm54',
    categories: [
      'c3',
    ],
    title: 'sheep meat',
    imageUrl: "assets/image/sheepn_meat.jpg",
    calories: "312 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm55',
    categories: [
      'c3',
    ],
    title: 'chicken',
    imageUrl: "assets/image/chicken.jpg",
    calories: "167 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm56',
    categories: [
      'c4',
    ],
    title: 'rice',
    imageUrl: "assets/image/rice.jpg",
    calories: "218 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm57',
    categories: [
      'c4',
    ],
    title: 'peas',
    imageUrl: "assets/image/peas.jpg",
    calories: "117 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm58',
    categories: [
      'c4',
    ],
    title: 'sunflower',
    imageUrl: "assets/image/sunflower.jpg",
    calories: "170 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm59',
    categories: [
      'c6',
    ],
    title: 'bread',
    imageUrl: "assets/image/bread.jpg",
    calories: "280 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm60',
    categories: [
      'c6',
    ],
    title: 'cream',
    imageUrl: "assets/image/cream .jpg",
    calories: "52 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm70',
    categories: [
      'c6',
    ],
    title: 'eggs',
    imageUrl: "assets/image/eggs.jpg",
    calories: "79 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm71',
    categories: [
      'c6',
    ],
    title: 'jam',
    imageUrl: "assets/image/jam.jpg",
    calories: "36 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm72',
    categories: [
      'c6',
    ],
    title: 'pastries',
    imageUrl: "assets/image/pastries.jpg",
    calories: "147 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm73',
    categories: [
      'c6',
    ],
    title: 'yogurt',
    imageUrl: "assets/image/yogurt.jpg",
    calories: "47 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm74',
    categories: [
      'c8',
    ],
    title: 'butter',
    imageUrl: "assets/image/butter.jpg",
    calories: "100 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm75',
    categories: [
      'c8',
    ],
    title: 'olive oil',
    imageUrl: "assets/image/olive_oil.jpeg",
    calories: "125 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm76',
    categories: [
      'c8',
    ],
    title: 'plant oil',
    imageUrl: "assets/image/plant_oils.jpg",
    calories: "126",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm77',
    categories: [
      'c9',
    ],
    title: 'cinnamon',
    imageUrl: "assets/image/cinnamon.jpg",
    calories: "7 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm78',
    categories: [
      'c9',
    ],
    title: 'cumin',
    imageUrl: "assets/image/cumin.jpg",
    calories: "6 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm79',
    categories: [
      'c9',
    ],
    title: 'hull',
    imageUrl: "assets/image/hill.jpg",
    calories: "7 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm80',
    categories: [
      'c9',
    ],
    title: 'pepper',
    imageUrl: "assets/image/pepper.jpg",
    calories: "13 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm81',
    categories: [
      'c9',
    ],
    title: 'yanson',
    imageUrl: "assets/image/yanson.jpg",
    calories: "23 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm82',
    categories: [
      'c10',
    ],
    title: 'fried fish',
    imageUrl: "assets/image/fried_fish.jpg",
    calories: "120 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm83',
    categories: [
      'c10',
    ],
    title: 'tuna fish',
    imageUrl: "assets/image/tuna_fish.jpg",
    calories: "104 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm84',
    categories: [
      'c10',
    ],
    title: 'sardine fish',
    imageUrl: "assets/image/sardine_fish.jpg",
    calories: "58 cal",
    ingredients: [],a: true,
  ),
  Meal(
    id: 'm85',
    categories: [
      'c10',
    ],
    title: 'grilled fish',
    imageUrl: "assets/image/grilled_fish.jpg",
    calories: "136 cal",
    ingredients: [],a: false,
  ),
  Meal(
    id: 'm86',
    categories: [
      'c12',
    ],
    title: 'falafel',
    imageUrl: "assets/image/falafel.jpg",
    calories: "150 cal",
    ingredients: [
      ' 1 kilo of soaked chickpeas',
      'Bunch of fresh parsley',
      '4 cloves of finely minced garlic',
      '1 tablespoon of ground cumin',
      'Tablespoon of table salt',
      '1 tablespoon of ground coriander',
      'One tablespoon of baking soda',
      'Amount of vegetable oil for frying',
    ],a: false,
  ),
  Meal(
    id: 'm87',
    categories: [
      'c12',
    ],
    title: 'grape leaves',
    imageUrl: "assets/image/grape_leaves.jpg",
    calories: "125 cal",
    ingredients: [
      '500-200 grams of fresh green grape leaves',
      'Half a kilo of minced meat',
      '2-3 cups of healthy brown rice',
      'Half a cup of chopped parsley, to taste',
      'Half a cup of chopped tomatoes, if desired',
      'Sweet potato cut into slices',
      'Sliced tomato slices',
      'Sliced onion head',
      '3-4 cups of chicken or beef broth',
      'Salt and spices to taste',
      '6-4 tablespoons of tomato puree, or 1-2 cups of tomato juice'
    ],a: false,
  ),
  Meal(
    id: 'm88',
    categories: [
      'c12',
    ],
    title: 'grilled chicken',
    imageUrl: "assets/image/grilled_chicken.jpg",
    calories: "144 cal",
    ingredients: [
      'Chicken (1200 g) cut into 4 pieces.',
      'A large onion, finely chopped.',
      '2 large tomatoes, finely chopped.',
      '2 green peppers, finely chopped.',
      '5 crushed garlic cloves.',
      '?? cup (60 ml) vinegar.',
      '3 tablespoons (45 ml) oil.',
      '?? teaspoon (2.5 g) mixed spice',
      ' ?? teaspoon (2.5 g) dry ground coriander',
      '?? teaspoon (1.25 g) ground ginger',
      'Salt and black pepper.'
    ],a: false,
  ),
  Meal(
    id: 'm89',
    categories: [
      'c12',
    ],
    title: 'mandy',
    imageUrl: "assets/image/mandy .jpg",
    calories: "265 cal",
    ingredients: [
      'Chicken: 2 kilos, halved.',
      'Water: a large amount for boiling chicken.',
      'Oil: 4 tbsp.',
      'Onions: 2 large chopped.',
      'Cinnamon: 2 sticks.',
      'Cardamom: 10 whole grains.',
      'Bay leaf: 4 pieces.',
      'Black pepper: 10 grains.',
      'Green pepper: 2 pods, halved.',
      'Cloves: 10 grains. Salt: 2 tsp.',
      'Mixed spice: 1 tbsp.',
      'Rice Ingredients: Rice: 1 kg of yogurt.',
      'Chicken broth: 1 tbsp.',
      'Salt: 1 tsp.',
      'Pepper: 1/2 tsp.',
      'Water: 1/4 cup.',
      'Rice Ingredients:',
      'Basmati rice: 4 cups.',
      'Chicken broth: 6 cups.',
      'Saffron mixture: 1 teaspoon saffron,',
      '1/4 cup rose water.',
      'Serving Ingredients: Raisins: 1/2 cup.',
      'Nuts: 1/2 cup.',
    ],a: false,
  ),
  Meal(
    id: 'm90',
    categories: [
      'c12',
    ],
    title: 'maqluba',
    imageUrl: "assets/image/maqluba.jpg",
    calories: "340 cal",
    ingredients: [
      'Sliced chicken.',
      'Cleo rice.',
      '2 fruits of eggplant.',
      '2 bulbs.',
      'Teaspoon salt.',
      'Half a teaspoon of black pepper.',
      'A teaspoon of spices.',
      '5 cloves of cardamom.',
      '2 bay leaf.',
      'A teaspoon of turmeric.',
      '2 sticks of cinnamon.',
      'clove.',
    ],a: false,
  ),
  Meal(
    id: 'm91',
    categories: [
      'c12',
    ],
    title: 'mulukhiyah',
    imageUrl: "assets/image/mulukhiyah.jpg",
    calories: "200 cal",
    ingredients: [
      '5 cups of chopped fresh molokhia.',
      '4 chicken breasts.',
      'A tablespoon of olive oil.',
      '1/4 cup vegetable oil.',
      '4 teaspoons of salt.',
      '10 cloves garlic.',
      'Fresh coriander stick.',
      'A teaspoon of dried coriander.',
      'Two lemons in the form of juice.',
      'A teaspoon of black pepper.',
      '1/2 an onion.',
      '5 carnation leaves.',
      'Two sheets of bay leaf',
    ],a: false,
  ),
  Meal(
    id: 'm92',
    categories: [
      'c12',
    ],
    title: 'shutterstock',
    imageUrl: "assets/image/shutterstock.png",
    calories: "150 cal",
    ingredients: [
      '?? kilo meat cut into cubes',
      'Large onion, cut into small cubes',
      '2 cloves minced garlic',
      '1 large tomato, cut into small cubes',
      '?? cup water',
      '?? cup chopped coriander',
      '2 tablespoons of oil',
      '2 tablespoons tomato sauce',
      '2 tablespoons lemon juice',
      '?? teaspoon cardamom',
      '?? teaspoon cumin',
      '?? teaspoon crushed dry coriander',
      'salt',
      'pepper',
    ],a: false,
  ),
  Meal(
    id: 'm92',
    categories: [
      'c12',
    ],
    title: 'cusa',
    imageUrl: "assets/image/stuffed_cusa.png",
    calories: "86 cal",
    ingredients: [
      '2 kilos of zucchini.',
      '3 cups of basmati rice.',
      'Half a kilo of minced meat.',
      'A little latency.',
      'A little turmeric.',
      'Salt and black pepper.',
      'A tablespoon of fat.',
      '6 cloves minced garlic.',
      'Pinch of lemon salt.',
      'Broth Ingredients:',
      '2 liters of water.',
      '4 fruits of tomato.',
      '2 tablespoons of tomato paste.',
      '8 garlic cloves.',
      '2 lemons squeezed.',
      'pinch of salt.',
    ],a: false,
  ),
];
