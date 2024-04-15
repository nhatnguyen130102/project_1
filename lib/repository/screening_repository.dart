import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_1/model/screening_model.dart';

class Screening_Repository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// lấy ra danh sách screening theo movieID
  Future<List<ScreeningModel>> getScreeningByMovieID(String movieID) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('screening')
          .where('movieID', isEqualTo: movieID)
          .get();
      return querySnapshot.docs.map((e) => ScreeningModel.fromMap(e)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<ScreeningModel>> getScreeningByMovieIDDateCinemaID(
      String movieID, String date, String cinemaID) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('screening')
          .where('movieID', isEqualTo: movieID)
          .where('date', isEqualTo: date)
          .where('cinemaID', isEqualTo: cinemaID)
          .get();
      return querySnapshot.docs.map((e) => ScreeningModel.fromMap(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
