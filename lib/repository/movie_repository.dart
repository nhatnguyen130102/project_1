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

      MovieModel item = querySnapshot.docs.map((e) => MovieModel.fromMap(e)).first;

      return item;
    } catch (e) {
      print("Error fetching movies by movieID: $e"); // In ra lỗi để gỡ rối
      return null; // Trả về danh sách rỗng trong trường hợp có lỗi
    }
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
