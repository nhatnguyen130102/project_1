import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:project_1/model/movie_model.dart';
import 'package:project_1/repository/movie_repository.dart';
import 'package:project_1/style/style.dart';

class Choose_Date extends StatefulWidget {
  late String movieID;
  late String cinemaID;
  late String locationID;

  Choose_Date(
      {required this.locationID,
      required this.cinemaID,
      required this.movieID,
      super.key});

  @override
  State<Choose_Date> createState() => _Choose_DateState();
}

class _Choose_DateState extends State<Choose_Date> {
  // repository
  MovieRepository _movieRepository = MovieRepository();

  // var
  late Future<MovieModel?> _movie;

  @override
  void initState(){
    super.initState();
    _movie = _movieRepository.getMoviesByMovieID(widget.movieID);
  }

  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<DateTime> next14Days =[];
    for(int i = 0; i <= 13; i++) {
      DateTime nextDay = now.add(Duration(days: i));
      next14Days.add(nextDay);
    }
    DateFormat getDate = DateFormat('dd');
    DateFormat getMon = DateFormat('MM');
    DateFormat getE = DateFormat('E');

    List<String> formatDate = next14Days.map((day) => getDate.format(day)).toList();
    List<String> formatMon = next14Days.map((day) => getMon.format(day)).toList();
    List<String> formatE = next14Days.map((day) => getE.format(day)).toList();

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
              Container(
                width: size.width,
                height: 112,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: formatDate.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 72,
                      height: 112,
                      decoration: BoxDecoration(
                        color: white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              //Days of week
                              formatE[index].toUpperCase(),
                              style: TextStyle(
                                color: black,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              //Date
                              formatDate[index],
                              style: TextStyle(
                                color: black,
                                fontWeight: bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              //Month
                              formatMonth.convertToMonthName(formatMon[index]),
                              style: TextStyle(
                                color: black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Gap(20),
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 120 * 1.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child:
                      FutureBuilder(
                        future: _movie,
                        builder: (context,SnapShot){
                          return Text(SnapShot.data!.name);
                        },
                      )
                      ,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class formatMonth{
  static List<String> months = ['JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC'];
  static String convertToMonthName(String monthIndex) {
    if(monthIndex == '01'){
      return months[0];
    }
    if(monthIndex == '02'){
      return months[1];
    } if(monthIndex == '03'){
      return months[2];
    } if(monthIndex == '04'){
      return months[3];
    } if(monthIndex == '05'){
      return months[4];
    } if(monthIndex == '06'){
      return months[5];
    } if(monthIndex == '07'){
      return months[6];
    } if(monthIndex == '08'){
      return months[7];
    } if(monthIndex == '09'){
      return months[8];
    } if(monthIndex == '10'){
      return months[9];
    } if(monthIndex == '11'){
      return months[10];
    } if(monthIndex == '12'){
      return months[11];
    }else{
      return '';
    }
  }
}
