// import 'package:flutter/material.dart';
// import 'package:project_1/model/cinema_model.dart';
// import 'package:project_1/repository/cinema_repository.dart';
// import 'package:project_1/repository/location_repository.dart';
//
// import '../style/style.dart';
//
// class Choose_LocationTest extends StatefulWidget {
//   String movieID;
//
//   Choose_LocationTest({required this.movieID, super.key});
//
//   @override
//   State<Choose_LocationTest> createState() => _Choose_LocationState();
// }
//
// class _Choose_LocationState extends State<Choose_LocationTest> {
//   //Repository zone
//   CinemaRepository _cinemaRepository = CinemaRepository();
//   LocationRepository _locationRepository = LocationRepository();
//
//   //Variable zone
//   late Future<List<CinemaModel>> _cinemas;
//
//   @override
//   void initState() {
//     super.initState();
//     _cinemas = _cinemaRepository.getCinemasByMovieID(widget.movieID);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: background,
//         foregroundColor: white,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Container(
//         width: 200,
//         height: 200,
//         color: Colors.red,
//         child: FutureBuilder(
//           future: _cinemas,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: CircularProgressIndicator()); // Hiển thị loading indicator nếu đang chờ dữ liệu
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}')); // Xử lý lỗi nếu có
//             } else if (snapshot.data == null || snapshot.data!.isEmpty) {
//               return Center(child: Text('No data available')); // Xử lý khi không có dữ liệu
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (context, index) {
//                   return Text(snapshot.data![index].name);
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
//
