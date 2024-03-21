import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  late String movieID;
  late String name;
  late String image;
  late String fromDate;
  late String toDate;
  late List<String> trailer;
  late List<String> genre;
  late List<String> director;
  late List<Actor> actors;
  late double rating;

  Movie({
    required this.movieID,
    required this.name,
    required this.image,
    required this.fromDate,
    required this.toDate,
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
      movieID: doc.id,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      fromDate: data['fromDate'] ?? '',
      toDate: data['toDate'] ?? '',
      trailer: List<String>.from(data['trailers'] ?? []),
      genre: List<String>.from(data['genres'] ?? []),
      director: List<String>.from(data['directors'] ?? []),
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
