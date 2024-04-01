import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_1/model/cinema_model.dart';

class CinemaRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CinemaModel>> getCinemaByLocationID(String locationID) async {
    try {
      QuerySnapshot _querySnapshot = await _firestore
          .collection('cinema')
          .where('locationID', isEqualTo: locationID)
          .get();
      List<CinemaModel> screenings =
          _querySnapshot.docs.map((doc) => CinemaModel.fromMap(doc)).toList();
      return screenings;
    } catch (e) {
      throw Exception('Failed to fetch cinema: ${e}');
    }
  }
}
