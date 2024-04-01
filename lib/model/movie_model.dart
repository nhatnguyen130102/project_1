import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  late String movieID;
  late String name;
  late String image;
  late String banner;
  late String age;
  late String summary;
  late String date;
  late String trailer;
  late String genre;
  late String director;
  late List<Actor> actors;
  late double rating;

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
    required this.actors,
    required this.rating,
  });

  // Factory constructor từ Firestore DocumentSnapshot
  factory Movie.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Movie(
      movieID: data['movieID'],
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      banner: data['banner'] ?? '',
      age: data['age'] ?? '',
      summary: data['summary'] ?? '',
      date: data['date'] ?? '',
      trailer: data['trailer'] ?? '',
      genre: data['genre'] ?? '',
      director: data['director'] ?? '',
      actors: (data['actors'] as List<dynamic>?)
              ?.map((actorData) => Actor.fromMap(actorData))
              .toList() ??
          [],
      rating: (data['rating'] ?? 0.0).toDouble(),
    );
  }
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
