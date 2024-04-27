// import 'package:flutter/material.dart';
// import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
//
// // Data model for address
// class AddressModel {
//   final String address;
//   final double latitude;
//   final double longitude;
//
//   AddressModel({required this.address, required this.latitude, required this.longitude});
// }
//
// class LocationPage extends StatelessWidget {
//   final List<AddressModel> addressList;
//
//   LocationPage({required this.addressList});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Locations'),
//       ),
//       body: ListView.builder(
//         itemCount: addressList.length,
//         itemBuilder: (context, index) {
//           final addressModel = addressList[index];
//           return ListTile(
//             title: Text(addressModel.address),
//             trailing: IconButton(
//               icon: Icon(Icons.map),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ViewLocationPage(
//                       latitude: addressModel.latitude,
//                       longitude: addressModel.longitude,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// class ViewLocationPage extends StatelessWidget {
//   final double latitude;
//   final double longitude;
//
//   ViewLocationPage({required this.latitude, required this.longitude});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('View Location'),
//       ),
//       body: Center(
//         child: FutureBuilder(
//           future: openStreetMapSearchAndPick(
//             context: context,
//             apiKey: 'YOUR_API_KEY', // Replace with your API key
//             initialLatitude: latitude,
//             initialLongitude: longitude,
//           ),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return CircularProgressIndicator();
//             } else if (snapshot.hasError) {
//               return Text('Error: ${snapshot.error}');
//             } else {
//               final location = snapshot.data as LocationResult?;
//               return Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text('Latitude: ${location?.latitude ?? latitude}'),
//                   Text('Longitude: ${location?.longitude ?? longitude}'),
//                   Text('Address: ${location?.address ?? "Unknown"}'),
//                 ],
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
