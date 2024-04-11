import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/location_model.dart';

class LocationRepository {
  final CollectionReference _locationsCollection =
      FirebaseFirestore.instance.collection('location');

  Future<List<LocationModel>> getAllLocations() async {
    List<LocationModel> locations = [];
    try {
      QuerySnapshot querySnapshot = await _locationsCollection.get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        locations.add(LocationModel.fromMap(doc));
      }
    } catch (e) {
      print("Error getting locations: $e");
    }

    return locations;
  }


}
