import 'dart:typed_data';
import 'package:flutter/services.dart';
class QuotesModel {
  int id;
  String name;

  QuotesModel({
    required this.id,
    required this.name,
  });

  factory QuotesModel.fromMap({required Map<String, dynamic> data}) {
    return QuotesModel(
      id: data["id"],
      name: data["name"],
    );
  }

}

class Quote {
  int id;
  String quote;
  String author;

  Quote({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory Quote.fromMap({required Map<String, dynamic> data}) => Quote(
    id: data["id"],
    quote: data["quote"],
    author: data["author"],
  );
}
// jsonBank

class DataBase_Model {
  int id;
  String name;

  DataBase_Model({
    required this.id,
    required this.name,
  });

  factory DataBase_Model.fromMap({required Map? data}) {
    return DataBase_Model(
    id: data!['id'],
      name: data['name'],
    );
  }
}  // Table

class TabBarIndex_Model {
  int id;

  TabBarIndex_Model({
    required this.id,
  });
}




// {
// "id": 6,
// "name": "ATTITUDE",
// "quotes": [
// {
// "id": 1,
// "quote": "Your attitude, not your aptitude, will determine your altitude.",
// "author": "Zig Ziglar",
// "image" : ""
// },
// {
// "id": 2,
// "quote": "The only disability in life is a bad attitude.",
// "author": "Scott Hamilton",
// "image" : ""
// },
// {
// "id": 3,
// "quote": "Attitude is a little thing that makes a big difference.",
// "author": "Winston Churchill",
// "image" : ""
// },
// {
// "id": 4,
// "quote": "A positive attitude causes a chain reaction of positive thoughts, events, and outcomes. It is a catalyst and it sparks extraordinary results.",
// "author": "Wade Boggs",
// "image" : ""
// },
// {
// "id": 5,
// "quote": "Your attitude determines your direction.",
// "author": "Unknown",
// "image" : ""
// },
// {
// "id": 6,
// "quote": "The greatest discovery of all time is that a person can change his future by merely changing his attitude.",
// "author": "Oprah Winfrey",
// "image" : ""
// },
// {
// "id": 7,
// "quote": "Excellence is not a skill, it's an attitude.",
// "author": "Ralph Marston",
// "image" : ""
// },
// {
// "id": 8,
// "quote": "A strong, positive attitude has the power to move mountains. Because life is only 10% how you make it, and 90% how you take it.",
// "author": "Meghan Markle",
// "image" : ""
// },
// {
// "id": 9,
// "quote": "Your attitude is like a box of crayons that color your world. Constantly color your picture gray, and your picture will always be bleak. Try adding some bright colors to the picture by including humor, and your picture begins to lighten up.",
// "author": "Allen Klein",
// "image" : ""
// },
// {
// "id": 10,
// "quote": "A positive attitude gives you power over your circumstances instead of your circumstances having power over you.",
// "author": "Joyce Meyer",
// "image" : ""
// },
// {
// "id": 11,
// "quote": "Attitude is everything, so pick a good one.",
// "author": "Wayne Dyer",
// "image" : ""
// },
// {
// "id": 12,
// "quote": "Your attitude is either the lock on, or the key to the door of your success.",
// "author": "Denis Waitley",
// "image" : ""
// },
// {
// "id": 13,
// "quote": "Happiness is an attitude. We either make ourselves miserable, or happy and strong. The amount of work is the same.",
// "author": "Carlos Castaneda",
// "image" : ""
// },
// {
// "id": 14,
// "quote": "The only thing you can control is your attitude toward the situation.",
// "author": "Unknown",
// "image" : ""
// },
// {
// "id": 15,
// "quote": "A positive attitude causes a chain reaction of positive thoughts, events, and outcomes. It is a catalyst and it sparks extraordinary results.",
// "author": "Wade Boggs",
// "image" : ""
// },
// {
// "id": 16,
// "quote": "Your attitude, not your aptitude, will determine your altitude.",
// "author": "Zig Ziglar",
// "image" : ""
// },
// {
// "id": 17,
// "quote": "Adopting the right attitude can convert a negative stress into a positive one.",
// "author": "Hans Selye",
// "image" : ""
// },
// {
// "id": 18,
// "quote": "A positive attitude will lead to positive outcomes.",
// "author": "Anonymous",
// "image" : ""
// },
// {
// "id": 19,
// "quote": "Attitude is a choice. Happiness is a choice. Optimism is a choice. Kindness is a choice. Giving is a choice. Respect is a choice. Whatever choice you make makes you. Choose wisely.",
// "author": "Roy T. Bennett",
// "image" : ""
// },
// {
// "id": 20,
// "quote": "A positive attitude can really make dreams come true - it did for me.",
// "author": "David Bailey",
// "image" : ""
// },
// {
// "id": 21,
// "quote": "Attitude is a little thing that makes a big difference.",
// "author": "Winston Churchill",
// "image" : ""
// },
// {
// "id": 22,
// "quote": "Your attitude determines your direction.",
// "author": "Unknown",
// "image" : ""
// },
// {
// "id": 23,
// "quote": "Excellence is not a skill, it's an attitude.",
// "author": "Ralph Marston",
// "image" : ""
// },
// {
// "id": 24,
// "quote": "A positive attitude gives you power over your circumstances instead of your circumstances having power over you.",
// "author": "Joyce Meyer",
// "image" : ""
// },
// {
// "id": 25,
// "quote": "Your attitude is either the lock on, or the key to the door of your success.",
// "author": "Denis Waitley",
// "image" : ""
// }
// ]
// },
