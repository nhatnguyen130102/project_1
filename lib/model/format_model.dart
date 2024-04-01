import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class FormatModel {
  late String formatID; // ID của định dạng phim
  late String formatName; // Tên của định dạng phim

  FormatModel({
    required this.formatID,
    required this.formatName,
  });

  factory FormatModel.fromMap(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return FormatModel(
      formatID: doc.id,
      formatName: data['formatName'] ?? '',
    );
  }

  // Chuyển đổi FormatModel thành một Map
  Map<String, dynamic> toMap() {
    return {
      'formatID': formatID,
      'formatName': formatName,
    };
  }
}
