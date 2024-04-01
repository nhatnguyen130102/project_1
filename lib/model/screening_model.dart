import 'package:cloud_firestore/cloud_firestore.dart';

class ScreeningModel {
  late String screeningID;
  late String cinemaID;
  late String roomTypeID;
  late String movieID;
  late String startAt;
  late List<String> booked = [];
  late String date;

  ScreeningModel({
    required this.screeningID,
    required this.cinemaID,
    required this.roomTypeID,
    required this.movieID,
    required this.startAt,
    required this.booked,
    required this.date,
  });

  factory ScreeningModel.fromMap(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ScreeningModel(
      screeningID: data['screeningID'] ?? '',
      cinemaID: data['cinemaID'] ?? '',
      roomTypeID: data['roomTypeID'] ?? '',
      movieID: data['movieID'] ?? '',
      startAt: data['startAt'] ?? '',
      booked: List<String>.from(data['booked'] ?? []),
      date: data['date'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cinemaID': cinemaID,
      'roomTypeID': roomTypeID,
      'movieID': movieID,
      'startAt': startAt,
      'booked': booked,
      'date': date,
    };
  }
}
