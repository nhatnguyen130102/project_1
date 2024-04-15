import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/movie_model.dart';

class MovieRepository {
  final FirebaseFirestore _moviesCollection = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getMovies() async {
    QuerySnapshot querySnapshot =
    await _moviesCollection.collection('movie').get();
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }

  Future<MovieModel?> getMoviesByMovieID(String movieID) async {
    try {
      QuerySnapshot querySnapshot = await _moviesCollection
          .collection('movie')
          .where('movieID', isEqualTo: movieID)
          .get();

      MovieModel item =
          querySnapshot.docs
              .map((e) => MovieModel.fromMap(e))
              .first;

      return item;
    } catch (e) {
      print("Error fetching movies by movieID: $e"); // In ra lỗi để gỡ rối
      return null; // Trả về danh sách rỗng trong trường hợp có lỗi
    }
  }

  Future<List<Actor>> getAllActorsForMovie(String movieId) async {
    try {
      List<Actor> actors = [];
      QuerySnapshot querySnapshot = await _moviesCollection
          .collection('movie')
          .doc(movieId)
          .collection('actor')
          .get();
      querySnapshot.docs.forEach((doc) {
        actors.add(
          Actor(
            name: doc['name'],
            image: doc['image'],
          ),
        );
      });
      return actors;
    } catch (e) {
      return [];
    }
  }

  Future<List<MovieModel?>> searchMovie(String search) async {
    try {

      QuerySnapshot querySnapshot = await _moviesCollection.collection('movie')
          .where('name', isEqualTo: search)
          .get();
      return querySnapshot.docs.map((e) => MovieModel.fromMap(e)).toList();

    }
    catch (e) {
      return [];
    }
  }
}
