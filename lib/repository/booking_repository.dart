import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:project_1/model/screening_model.dart';

class BookingRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addBooking(String screengID, String userID, List<String> seat,
      double total, double subtotal, String cinemaID, String voucherID) async {
    try {
      QuerySnapshot _getScreening = await _firestore
          .collection('screening')
          .where('screeningID', isEqualTo: screengID)
          .get();
      ScreeningModel? _itemScreening =
          _getScreening.docs.map((e) => ScreeningModel.fromMap(e)).first;
      DateTime _today = DateTime.now();
      DateFormat getDateTime = DateFormat('dd/MM/yyyy');
      String todayFormat = DateFormat('dd/MM/yyyy').format(DateTime.now());

      Map<String, dynamic> bookingData = {
        'cinemaID': cinemaID,
        'dateBooking': todayFormat,
        'movieID': _itemScreening.movieID,
        'screeningID': _itemScreening.screeningID,
        'seat': seat,
        'subtotal': subtotal,
        'total': total,
        'userID': userID,
        'voucherID': voucherID,
      };

      await _firestore.collection('booking').add(bookingData);
    } catch (e) {
      throw e;
    }
  }
}
