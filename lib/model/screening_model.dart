import 'package:cloud_firestore/cloud_firestore.dart';

class ScreeningModel {
  late String screeningID;
  late String cinemaID;
  late String roomID;
  late String movieID;
  late String time;
  late List<String> booked = [];
  late String date;

  ScreeningModel({
    required this.screeningID,
    required this.cinemaID,
    required this.roomID,
    required this.movieID,
    required this.time,
    required this.booked,
    required this.date,
  });

  factory ScreeningModel.fromMap(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ScreeningModel(
      screeningID: doc.id,
      cinemaID: data['cinemaID'] ?? '',
      roomID: data['roomID'] ?? '',
      movieID: data['movieID'] ?? '',
      time: data['time'] ?? '',
      booked: List<String>.from(data['booked'] ?? []),
      date: data['date'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cinemaID': cinemaID,
      'roomID': roomID,
      'movieID': movieID,
      'time': time,
      'booked': booked,
      'date': date,
    };
  }
}
