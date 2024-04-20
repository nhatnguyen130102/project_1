import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_1/repository/booking_repository.dart';
import 'package:project_1/repository/format.dart';
import 'package:project_1/repository/movie_repository.dart';
import 'package:project_1/repository/screening_repository.dart';
import 'package:project_1/screen/mainlayout.dart';

import '../component_widget/loading.dart';
import '../model/format_model.dart';
import '../model/movie_model.dart';
import '../model/screening_model.dart';
import '../style/style.dart';

class BillingPage extends StatefulWidget {
  String movieID;
  String cinemaID;
  String locationID;
  List<String> booked;
  String screeningID;
  double total;
  double subtotal;

  BillingPage(
      {required this.screeningID,
      required this.booked,
      required this.cinemaID,
      required this.locationID,
      required this.movieID,
        required this.total,
        required this.subtotal,
      super.key});

  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  // repository
  Screening_Repository _screening_repository = Screening_Repository();
  MovieRepository _movieRepository = MovieRepository();
  FormatRepository _formatRepository = FormatRepository();
  BookingRepository _bookingRepository = BookingRepository();

  // var
  late Future<MovieModel?> _movie;



 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _movie = _movieRepository.getMoviesByMovieID(widget.movieID);
    _bookingRepository.addBooking(widget.screeningID,'', widget.booked, widget.total, widget.subtotal, widget.cinemaID, '');
  }

  @override
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
      body: FutureBuilder(
        future: _movie,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading(); // Hiển thị loading indicator nếu đang chờ dữ liệu
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Xử lý lỗi nếu có
          } else if (snapshot.data == null) {
            return Text('No data available'); // Xử lý khi không có dữ liệu
          } else {
            MovieModel item = snapshot.data!;
            return SingleChildScrollView(

              scrollDirection: Axis.vertical,
              child: Stack(
                children: [
                  //Background-banner
                  Positioned(
                    top: 0,
                    left: 20,
                    right: 20,
                    child: Column(
                      children: [
                        //Note-line
                        Text(
                          'Use QR code to pre-show tickets',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: medium,
                            color: white.withOpacity(0.8),
                          ),
                        ),
                        Gap(12),

                        //Banner-background
                        Container(
                          width: size.width,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              item.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                          foregroundDecoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [black.withOpacity(0.5), black])),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Ticket-info
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 64, left: 32, right: 32),
                      child: Column(
                        children: [
                          //QR-code
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: BarcodeWidget(
                              barcode: Barcode.qrCode(
                                errorCorrectLevel:
                                    BarcodeQRCorrectionLevel.high,
                              ),
                              data: 'https://pub.dev/packages/barcode_widget',
                              width: size.width * 0.4,
                              height: size.width * 0.4,
                            ),
                          ),
                          Gap(24),

                          //Ticket-details
                          Container(
                              width: size.width * 0.8,
                              child: Column(
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontWeight: bold,
                                      fontSize: 28,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Gap(8),
                                  Text(
                                    item.genre,
                                    style: TextStyle(
                                      fontWeight: medium,
                                      fontSize: 10,
                                      color: white.withOpacity(0.8),
                                    ),
                                  ),
                                ],
                              )),
                          Gap(24),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //ROOM
                              Column(
                                children: [
                                  Text(
                                    'ROOM',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: medium,
                                      color: white.withOpacity(0.6),
                                    ),
                                  ),
                                  Gap(4),
                                  Text(
                                    '01',
                                    style: TextStyle(
                                      fontWeight: semibold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),

                              //FORMAT
                              Column(
                                children: [
                                  Text(
                                    'FORMAT',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: medium,
                                      color: white.withOpacity(0.6),
                                    ),
                                  ),
                                  Gap(4),
                                  Text(
                                    'CINE & SUITE',
                                   
                                    style: TextStyle(
                                      fontWeight: semibold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),

                              //AGE
                              Column(
                                children: [
                                  Text(
                                    'AGE',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: medium,
                                      color: white.withOpacity(0.6),
                                    ),
                                  ),
                                  Gap(4),
                                  Text(
                                    // 'T13',
                                    item.age,
                                    style: TextStyle(
                                      fontWeight: semibold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Gap(24),

                          //Seat-list
                          Container(
                            width: size.width * 0.8,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  color: yellow, // Specify the border color
                                  width: 2, // Specify the border width
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SEAT',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: bold,
                                    color: yellow,
                                  ),
                                ),
                                Gap(10),
                                Text(
                                  widget.booked.join(', '),
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: medium,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Gap(32),

                          Container(
                            width: size.width * 0.8,
                            height: 1.5,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: [yellow, Colors.transparent],
                            )),
                          ),
                          Gap(32),

                          //
                          Container(
                              width: size.width * 0.8,
                              child: Column(
                                children: [
                                  //Datetime
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.date_range,
                                            color: yellow,
                                            size: 14,
                                          ),
                                          Gap(6),
                                          Text(
                                            '11/04/2024',
                                            style: TextStyle(
                                                fontWeight: medium,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: yellow,
                                            size: 14,
                                          ),
                                          Gap(6),
                                          Text(
                                            '08:00',
                                            style: TextStyle(
                                                fontWeight: medium,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Gap(16),
                                  //Address
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: yellow,
                                        size: 14,
                                      ),
                                      Gap(6),
                                      Container(
                                        width: size.width * 0.7,
                                        child: Text(
                                          'Tầng 7 | Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh',
                                          style: TextStyle(
                                            fontWeight: medium,
                                            fontSize: 12,
                                            height: 1.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Gap(24),

                                  //2-active-buttons
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: size.width * 0.4 - 16,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 16),
                                        decoration: BoxDecoration(
                                          color: white.withOpacity(0.1),
                                          // border:
                                          //     Border.all(color: yellow, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Text(
                                          'SWITCH SEAT',
                                          style: TextStyle(
                                            fontWeight: bold,
                                            fontSize: 14,
                                            color: yellow,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(
                                            () {
                                              _screening_repository
                                                  .addBookedScreening(
                                                      widget.screeningID,
                                                      widget.booked);
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return MainLayout();
                                                  },
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: size.width * 0.4 - 16,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          decoration: BoxDecoration(
                                            color: yellow,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            'MY TICKETS',
                                            style: TextStyle(
                                              fontWeight: bold,
                                              fontSize: 14,
                                              color: black,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          //Text-here
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
