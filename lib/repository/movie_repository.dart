import 'package:cloud_firestore/cloud_firestore.dart';

class MovieRepository {
  final CollectionReference _moviesCollection =
      FirebaseFirestore.instance.collection('movie');

  Future<List<Map<String, dynamic>>> getMovies() async {
    QuerySnapshot querySnapshot = await _moviesCollection.get();
    return querySnapshot.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }
}
