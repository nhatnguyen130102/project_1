import 'package:flutter/material.dart';

import 'package:project_1/model/screening_model.dart';
import 'package:project_1/repository/screening_repository.dart';

import 'package:project_1/style/style.dart';

class Choose_Date extends StatefulWidget {
  late String movieID;
  late String cinemaID;
  late String locationID;
  Choose_Date({required this.locationID, required this.cinemaID, required this.movieID, super.key});

  @override
  State<Choose_Date> createState() => _Choose_DateState();
}

class _Choose_DateState extends State<Choose_Date> {
  Screening_Repository _screening_repository = Screening_Repository();
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Text(widget.cinemaID + widget.movieID + widget.locationID),
            ],
          ),
        ),
      ),
    );
  }
}

String _getDayOfWeekString(int dayOfWeek) {
  switch (dayOfWeek) {
    case 1:
      return 'Mon';
    case 2:
      return 'Tue';
    case 3:
      return 'Wed';
    case 4:
      return 'Thur';
    case 5:
      return 'Fri';
    case 6:
      return 'Sat';
    case 7:
      return 'Sun';
    default:
      return '';
  }
}
