import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/movie_model.dart';

class MovieRepository {
  final CollectionReference _moviesCollection =
      FirebaseFirestore.instance.collection('movie');

  Future<List<Map<String, dynamic>>> getMovies() async {
    QuerySnapshot querySnapshot = await _moviesCollection.get();
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  Future<List<Actor>> getAllActorsForMovie(String movieId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> actorsSnapshot =
          await _moviesCollection.doc(movieId).collection('actor').get();

      List<Actor> actors = actorsSnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data()!;
        return Actor(
          name: data['name'] ?? '',
          image: data['image'] ?? '',
        );
      }).toList();

      return actors;
    } catch (error) {
      throw error;
    }
  }
}
