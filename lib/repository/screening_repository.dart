import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/screening_model.dart';

class ScreeningRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<ScreeningModel?> getScreeningById(String screeningId) async {
    try {
      DocumentSnapshot documentSnapshot =
          await _firestore.collection('screening').doc(screeningId).get();
      if (documentSnapshot.exists) {
        return ScreeningModel.fromMap(documentSnapshot);
      } else {
        return null;
      }
    } catch (e) {
      throw Exception('Failed to fetch screening: $e');
    }
  }

  Future<List<ScreeningModel>> getScreeningsByMovieId(String movieId) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('screening')
          .where('movieID', isEqualTo: movieId)
          .get();
      List<ScreeningModel> screenings =
          querySnapshot.docs.map((doc) => ScreeningModel.fromMap(doc)).toList();
      return screenings;
    } catch (e) {
      throw Exception('Failed to fetch screenings: $e');
    }
  }
}
