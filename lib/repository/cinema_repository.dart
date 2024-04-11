import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:project_1/model/cinema_model.dart';

class CinemaRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CinemaModel>> getCinemasByLocationID(String locationID) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('cinema')
          .where('locationID', isEqualTo: locationID)
          .get();

      List<CinemaModel> cinemas = querySnapshot.docs
          .map((doc) => CinemaModel.fromSnapshot(doc))
          .toList();

      return cinemas;
    } catch (e) {
      // Xử lý lỗi nếu có
      print('Error getting cinemas by locationID: $e');
      return []; // hoặc trả về null, hoặc đối tượng Error
    }
  }
}