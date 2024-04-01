import 'package:cloud_firestore/cloud_firestore.dart';

class CinemaModel {
  late String cinemaID;
  late String locationID;
  late String nameCinema;

  CinemaModel({
    required this.cinemaID,
    required this.locationID,
    required this.nameCinema,
  });

  factory CinemaModel.fromMap(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return CinemaModel(
      cinemaID: doc.id,
      locationID: data['locationID'] ?? '',
      nameCinema: data['nameCinema'] ?? '',
    );
  }

  // Chuyển đổi CinemaModel thành một Map
  Map<String, dynamic> toMap() {
    return {
      'cinemaID': cinemaID,
      'locationID': locationID,
      'nameCinema': nameCinema,
    };
  }
}
