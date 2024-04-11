import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:heroicons/heroicons.dart';
import 'package:project_1/model/cinema_model.dart';
import 'package:project_1/repository/cinema_repository.dart';
import 'package:project_1/repository/location_repository.dart';
import 'package:project_1/screen/choosedate.dart';

import '../model/location_model.dart';
import '../style/style.dart';

class Choose_Location extends StatefulWidget {
  String movieID;

  Choose_Location({required this.movieID, super.key});

  @override
  State<Choose_Location> createState() => _Choose_LocationState();
}

class _Choose_LocationState extends State<Choose_Location> {
  //Repository zone
  CinemaRepository _cinemaRepository = CinemaRepository();
  LocationRepository _locationRepository = LocationRepository();


  //Variable zone
  late Future<List<CinemaModel>> _cinemas;
  late Future<List<LocationModel>> _location;
  late String _locationID = 'location1';
  late String _nameCinema = '';
  late String _cinemaBooked = '';

  late int _locationSelected = 0;
  late int _cinemaSelected = 0;
  late bool _locationBookedSelected = false;

  @override
  void initState() {
    super.initState();
    _cinemas = _cinemaRepository.getCinemasByLocationID(_locationID);
    _location = _locationRepository.getAllLocations();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 40,
                child: FutureBuilder(
                  future: _location,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Hiển thị loading indicator nếu đang chờ dữ liệu
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); // Xử lý lỗi nếu có
                    } else if (snapshot.data == null) {
                      return Text(
                          'No data available'); // Xử lý khi không có dữ liệu
                    } else {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(
                                    () {
                                  _locationSelected = index;
                                  _locationID =
                                      snapshot.data![index].locationID;
                                  _cinemas = _cinemaRepository
                                      .getCinemasByLocationID(_locationID);
                                },
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: _locationSelected == index
                                    ? Colors.yellow
                                    : Color(0xff1d2223),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                child: Text(
                                  snapshot.data![index].name,
                                  style: TextStyle(
                                    color: _locationSelected == index
                                        ? black
                                        : Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    ;
                  },
                ),
              ),
              Gap(30),
              Expanded(
                child: FutureBuilder(
                  future: _cinemas,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator(); // Hiển thị loading indicator nếu đang chờ dữ liệu
                    } else if (snapshot.hasError) {
                      return Text(
                          'Error: ${snapshot.error}'); // Xử lý lỗi nếu có
                    } else if (snapshot.data == null) {
                      return Text(
                          'No data available'); // Xử lý khi không có dữ liệu
                    } else {
                      return Container(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _cinemaSelected = index;
                                  _nameCinema = snapshot.data![index].name;
                                  _cinemaBooked =
                                      snapshot.data![index].cinemaID;
                                  _locationBookedSelected = true;
                                });
                              },
                              child: Container(
                                height: 150,
                                width: size.width,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.data![index].name,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _cinemaSelected == index
                                                ? Colors.yellow
                                                : Color(0xff3b4142),
                                          ),
                                          child: HeroIcon(
                                            HeroIcons.check,
                                            color: black,
                                            size: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gap(10),
                                    Text('1.8 km'),
                                    Gap(10),
                                    Row(
                                      children: [
                                        HeroIcon(
                                          HeroIcons.mapPin,
                                          color: white,
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data![index].address,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                    Gap(20),
                                    Container(
                                      height: 1.7,
                                      width: size.width * 0.8,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.yellow,
                                            Colors.yellow,
                                            Colors.yellow,
                                            Colors.black
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            left: 10,
            right: 10,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10),
                  width: size.width,
                  height: 60,

                  child: Row(
                    children: [
                      Container(
                        width: 5,
                        height: 60,
                        decoration: BoxDecoration(
                          color: yellow,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      Gap(20),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'CINEMA',
                                style: TextStyle(),
                              ),
                            ),
                            Gap(5),
                            Container(
                              child: Text(
                                _nameCinema != null ? _nameCinema : '',
                                // Kiểm tra _nameCinema, nếu null thì sử dụng chuỗi rỗng
                                style: TextStyle(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0,
                  child:

                  GestureDetector(
                    onTap: _locationBookedSelected
                        ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return Choose_Date(
                              movieID: widget.movieID, cinemaID: _cinemaBooked, locationID:  _locationID,);
                        }),
                      );
                    } // Vô hiệu hóa GestureDetector nếu _locationBookedSelected là true
                        : null,
                    child: Center(
                      child: Container(
                        height: 60,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: _locationBookedSelected ? yellow : Colors
                                .grey),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('NEXT', style: TextStyle(color: black,
                                fontWeight: FontWeight.w900,
                                fontSize: 20),),
                            HeroIcon(HeroIcons.arrowRight)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
