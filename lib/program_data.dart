import 'package:flutter/material.dart';
import 'moduals/category.dart';
import 'moduals/item.dart';

const PROGRAMS = [
  Category(
    id: 'md',
    title: 'The Mediterranean Diet',
    color: Color.fromARGB(255, 235, 162, 248),
  ),
  Category(
    id: 'dd',
    title: 'The Dash Diet',
    color: Color.fromARGB(255, 189, 123, 201),
  ),
  Category(
    id: 'pbf',
    title: 'Plant-based and Flexitarian Diets',
    color: Color.fromARGB(255, 162, 85, 175),
  ),
  Category(
    id: 'md2',
    title: 'The Mind Diet',
    color: Color.fromARGB(255, 113, 53, 124),
  ),
  Category(
    id: 'ww',
    title: 'Weight Watchers',
    color: Color.fromARGB(255, 113, 51, 124),
  ),
  Category(
    id: 'vd',
    title: 'Volumetrics Diet',
    color: Color.fromARGB(255, 123, 28, 139),
  ),
  Category(
    id: 'mc',
    title: 'Mayo Clinic Diet',
    color: Color.fromARGB(255, 117, 28, 133),
  ),
  Category(
    id: 'tc',
    title: 'TLC Diet',
    color: Color.fromARGB(255, 77, 10, 88),
  ),
];

 const DUMMY_MEALS =  [
  Item(
    id: 'm1',
    categories: [
  'dd'
    ],
    title: 'dd system',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'images/dash diet.png',
    duration: 20,
    ingredients: [
   'fruits' ,
   'whole grains' ,
   'meat' ,
   'low fat dairy products' ,
   'vegetables',
    ],
    steps: [
 
   'it reduces the level of blood pressure ',
  'it reduces the level blood sugar',
    'it reduces the level of the fat in the blood  ',
    'it reduces the insulin resistance ',
    'it reduces the risk of heart attack , heart failure and stroke '
    ],
    isGlutenFree: false,
    isVegan: true,
    isVegetarian: true,
    isLactoseFree: true, 
  ),
  Item(
    id: 'm2',
    categories: [
      'md',
    ],
    title: 'md system',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
               'images/mediterranean diet.PNG',
    duration: 10,
    ingredients: [
   'Vegetables',
   'fruits' ,
   'whole grains' ,
   'fish' ,
   'nuts' ,
   'lentils' ,
   'olive oil' ,
    ],
    steps: [
    'it promotes heart health',
    'it supports healthy blood sugar levels',
    'it protects brain function',
    'it improves cognitive function ',
    'it improves memory and attention ',
    'it improves the processing speed in healthy older adults ',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Item(
    id: 'm3',
    categories: [
      'pbf'
    ],
    title: 'pbf system',
    affordability: Affordability.Pricey,
    complexity: Complexity.Simple,
    imageUrl:
        'images/plant based and flex diets.webp',
    duration: 45,
    ingredients: [
'fruits' ,
'vegetables' ,
'whole grains' ,
'legumes',
    ],
    steps: [
      'decrease the risk of heart diseas',
      'weight loss',
      'decrease the risk of type 2 diabetes ',
      'it may help prevent cancer',
      'it is good for the environment since you are decreasing your meat consumption'
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
  Item(
    id: 'm4',
    categories: [
      'md2',
    ],
    title: 'md2 system',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Challenging,
    imageUrl:
        'images/the mind diet.png',
    duration: 60,
    ingredients: [
      'berries',
      'beans',
      'olive oil',
      'whole grains',
      'fish',
      'wine',
      'nuts',
    ],
    steps: [
      'improve brain health',
      'lower your odds of developing conditions like alzheimer diseas , dementia and other forms of age-related cognitive decline',
      'it can slow the brain aging by 7.5 years',
    ],
    isGlutenFree: false,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: false,
  ),
  Item(
    id: 'm5',
    categories: [
     'ww'
    ],
    title: 'ww system',
    affordability: Affordability.Luxurious,
    complexity: Complexity.Simple,
    imageUrl:
        'images/weight watchers diet.jpg',
    duration: 15,
    ingredients: [
      'fish',
      'eggs',
      'olive oil',
      'nuts',
      'fruits',
      'vegetables',
    ],
    steps: [
      'the diet is suitable for vegetarians',
      'reduces diapetes risk',
      'development of life skills',
      'balanced and flexible diet',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: true,
  ),
  Item(
    id: 'm6',
    categories: [
      'vd'
    ],
    title: 'vd system',
    affordability: Affordability.Affordable,
    complexity: Complexity.Hard,
    imageUrl:
        'images/volumetrics-diet.webp',
    duration: 240,
    ingredients: [
      'vegetables',
      'grains',
      'breakfast cereal',
      'low fat meat',
      'legumes',
      'fruits',
    ],
    steps: [
      'it promotes weight loss by enhancing feelings of fullness ',
      'it reduces hunger and carvings',
      'it improves your diet quality by increasing your intake of nutrient-dense foods like fruits and vegetables ',
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Item(
    id: 'm7',
    categories: [
      'mc',
    ],
    title: 'mc system',
    affordability: Affordability.Affordable,
    complexity: Complexity.Simple,
    imageUrl:
        'images/_mayo_clinic diet.jpg',
    duration: 20,
    ingredients: [
      'fruits',
      'vegetables',
      'bread',
      'nuts',
      'sweets',
    ],
    steps: [
      'it encourage exercise',
      'it helps you to lose weight using an easy way ',
      'it is easy to follow',
      'it does not involve processed foods'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: true,
    isLactoseFree: false,
  ),
  Item(
    id: 'm8',
    categories: [
      'tc',
    ],
    title: 'tlc system',
    affordability: Affordability.Pricey,
    complexity: Complexity.Challenging,
    imageUrl:
        'images/tlc-diet.webp',
    duration: 35,
    ingredients: [
      ' turkey Chicken',
      'fish',
      'vegetables',
      'popcorns',
      'eggs',
      'whole grain',
    ],
    steps: [
      'increased weight loss',
      'lower blood pressure',
      'reduced oxidative stress ',
      'enhanced immune function',
      'limits saturated fat and dietary cholestrol',
      'limits the chances of heart diseas'
    ],
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
    isLactoseFree: true,
  ),
 
];
