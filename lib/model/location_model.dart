import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  late String locationID;
  late String nameLocation; // Tên của địa điểm

  LocationModel({
    required this.locationID,
    required this.nameLocation,
  });

  factory LocationModel.fromMap(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return LocationModel(
      locationID: doc.id,
      nameLocation: data['nameLocation'] ?? '',
    );
  }

  // Chuyển đổi LocationModel thành một Map
  Map<String, dynamic> toMap() {
    return {
      'locationID': locationID,
      'nameLocation': nameLocation,
    };
  }
}
