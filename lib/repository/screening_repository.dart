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

  Future<List<ScreeningModel>> getScreeningByMovieIDDate(
      String movieID, String date) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('screening')
          .where('movieID', isEqualTo: movieID)
          .where('date', isEqualTo: date)
          .get();
      return querySnapshot.docs.map((e) => ScreeningModel.fromMap(e)).toList();
    } catch (e) {
      return [];
    }
  }

  // List<String> getListDate(List<String> screening) {
  //   Set<String> uniqueValues = Set<String>.from(screening);

  //   List<String> result = uniqueValues.toList();

  //   return result;
  // }

  // Future<List<String>> getDateScreening(String movieID, String date) async {
  //   try {
  //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //         .collection('screening')
  //         .where('movieID', isEqualTo: movieID)
  //         .where('date', isEqualTo: date)
  //         .get();
  //     // tạo danh sách hướng kết quả
  //     List<String> screeningDates = [];
  //     querySnapshot.docs.forEach((doc) {
  //       screeningDates.add(doc['date']);
  //     }); // gán các kết quả và danh sách đã tạo

  //     // Loại bỏ các ngày trùng lặp
  //     Set<String> uniqueValues = screeningDates.toSet();

  //     List<String> result = uniqueValues.toList();
  //     result.sort((a, b) => a.compareTo(b));
  //     return result;
  //   } catch (e) {
  //     print("Error getting screening dates: $e");
  //     return [];
  //   }
  // }
}
