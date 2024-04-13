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
  Future<MovieModel?> getMoviesByMovieID(String movieID) async {
    try {
      QuerySnapshot querySnapshot = await _moviesCollection.where('movieID', isEqualTo: movieID).get();

      // Trả về danh sách các DocumentSnapshot tương ứng với tài liệu có movieID
      if (querySnapshot.docs.isNotEmpty) {
        // Trích xuất dữ liệu từ tài liệu đầu tiên trong danh sách
        Map<String, dynamic> data = querySnapshot.docs.first.data() as Map<String, dynamic>;
        return MovieModel.fromMap(data as DocumentSnapshot<Object?>); // Trả về một đối tượng MovieModel từ dữ liệu
      } else {
        return null; // Trả về null nếu không tìm thấy tài liệu với movieID tương ứng
      }
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
