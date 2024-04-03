import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/basic.dart';

class Movie {
  late String movieID; // Document ID
  late String name;
  late String image;
  late String banner;
  late String age;
  late String summary;
  late String date;
  late String trailer;
  late String genre;
  late String director;
  late List<Actor> actor;
  late double rating;
  late String time;

  // Constructor
  Movie({
    required this.movieID,
    required this.name,
    required this.image,
    required this.banner,
    required this.age,
    required this.summary,
    required this.date,
    required this.trailer,
    required this.genre,
    required this.director,
    required this.actor,
    required this.rating,
  });

  // Factory method to create Movie object from a DocumentSnapshot
  factory Movie.fromSnapshot(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Movie(
      movieID: data['movieID'] ?? '', // Assign Document ID to movieID
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      banner: data['banner'] ?? '',
      age: data['age'] ?? '',
      summary: data['summary'] ?? '',
      date: data['date'] ?? Timestamp.now(),
      trailer: data['trailer'] ?? '',
      genre: data['genre'] ?? '',
      director: data['director'] ?? '',
      actor: List<Actor>.from(
          (data['actors'] ?? []).map((actor) => Actor.fromMap(actor))),
      rating: (data['rating'] ?? 0).toDouble(),
    );
  }

  map(Builder Function(dynamic i) param0) {}
}

class Actor {
  late String name;
  late String image;

  Actor({
    required this.name,
    required this.image,
  });

  factory Actor.fromMap(Map<String, dynamic> map) {
    return Actor(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
    );
  }
}
