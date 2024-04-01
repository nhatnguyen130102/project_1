import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:project_1/model/screening_model.dart';
import 'package:project_1/screen/booking.dart';
import 'package:project_1/style/style.dart';
import '../component_widget/choosedate_modun.dart';
import '../component_widget/headline_2_component.dart';

class Choose_Date extends StatefulWidget {
  List<String> displayedDates = [];
  late Future<List<ScreeningModel>> screenings;
  Choose_Date({required this.screenings, super.key});

  @override
  State<Choose_Date> createState() => _Choose_DateState();
}

class _Choose_DateState extends State<Choose_Date> {
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
              //Choose-Date-------------------------------------
              HeadLine2Component(
                StringA: 'Date & Time',
                StringB: '7 days · 24 hours',
              ),
              // xử lý data ngày

              FutureBuilder<List<ScreeningModel>>(
                future: widget.screenings, // model
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return Container(
                      width: size.width,
                      height: 100,
                      margin: EdgeInsets.only(top: 20, bottom: 25),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          ScreeningModel screening = snapshot.data![index];
                          String dateFirstPart = screening.date.split('/')[0];
                          String date = screening.date;
                          DateTime dateTime =
                              DateFormat('dd/MM/yyyy').parse(date);
                          int dayOfWeek = dateTime.weekday;
                          String dayOfWeekString =
                              _getDayOfWeekString(dayOfWeek);
                          if (!widget.displayedDates.contains(dateFirstPart)) {
                            widget.displayedDates.add(dateFirstPart);
                            return ChooseDate_Modun(
                              StringA: dateFirstPart,
                              StringB: dayOfWeekString,
                            );
                          } else {
                            return SizedBox
                                .shrink(); // Return an empty SizedBox if the date has been displayed before
                          }
                        },
                      ),
                    );
                  } else {
                    return Center(child: Text('No screenings available'));
                  }
                },
              ),
              // xử lý data giờ
              FutureBuilder<List<ScreeningModel>>(
                future: widget.screenings,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Gap(20),

                            //Cinema: Time & Info--------------------------------------
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Cinema & Address-------------
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'CGV Hoang Van Thu',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Gap(2),
                                    Row(
                                      children: [
                                        Text(
                                          'Tan Binh District',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.grey[400],
                                          ),
                                        ),
                                        Gap(10),
                                        Icon(
                                          FontAwesome.circle,
                                          size: 4,
                                          color: Colors.grey[400],
                                        ),
                                        Gap(5),
                                        Text(
                                          '1.8 km',
                                          style: TextStyle(
                                              color: Colors.grey[400]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                //Favorite-Icon
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Icon(
                                    FontAwesome.heart_empty,
                                    size: 20,
                                    color: Colors.grey[600],
                                  ),
                                )
                              ],
                            ),

                            Gap(15),
                            Text(
                              'Floor 1st & 2nd, Gala Center, 415 Hoang Van Thu',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            Gap(10),

                            //Screening---------------------------------
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              width: size.width,
                              child: Wrap(
                                direction: Axis.horizontal,
                                spacing: 15,
                                runSpacing: 15,
                                children: List.generate(6, (index) {
                                  return Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return Booking();
                                            },
                                          ),
                                        );
                                      },

                                      //Screening-Item---------------
                                      child: Row(
                                        mainAxisSize:
                                            MainAxisSize.min, //wrap-content
                                        children: [
                                          Text(
                                            '08:00',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Gap(5),
                                          Text(
                                            '~ 10:00',
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey.shade500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            Gap(40),

                            Container(
                              width: size.width,
                              height: 0.3,
                              decoration: BoxDecoration(color: white),
                            )
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: Text('No screening available'),
                    );
                  }
                },
              ),

              // ListView.builder(
              //   scrollDirection: Axis.vertical,
              //   physics: BouncingScrollPhysics(),
              //   shrinkWrap: true,
              //   itemCount: 1,
              //   itemBuilder: (context, index) {
              //     return Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       children: [
              //         Gap(20),

              //         //Cinema: Time & Info--------------------------------------
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             //Cinema & Address-------------
              //             Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Text(
              //                   'CGV Hoang Van Thu',
              //                   style: TextStyle(
              //                     fontSize: 16,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),
              //                 Gap(2),
              //                 Row(
              //                   children: [
              //                     Text(
              //                       'Tan Binh District',
              //                       style: TextStyle(
              //                         fontWeight: FontWeight.w400,
              //                         color: Colors.grey[400],
              //                       ),
              //                     ),
              //                     Gap(10),
              //                     Icon(
              //                       FontAwesome.circle,
              //                       size: 4,
              //                       color: Colors.grey[400],
              //                     ),
              //                     Gap(5),
              //                     Text(
              //                       '1.8 km',
              //                       style: TextStyle(color: Colors.grey[400]),
              //                     ),
              //                   ],
              //                 ),
              //               ],
              //             ),

              //             //Favorite-Icon
              //             Container(
              //               padding: EdgeInsets.all(8),
              //               decoration: BoxDecoration(
              //                 border: Border.all(color: Colors.grey.shade300),
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: Icon(
              //                 FontAwesome.heart_empty,
              //                 size: 20,
              //                 color: Colors.grey[600],
              //               ),
              //             )
              //           ],
              //         ),

              //         Gap(15),
              //         Text(
              //           'Floor 1st & 2nd, Gala Center, 415 Hoang Van Thu',
              //           style: TextStyle(
              //             fontSize: 14,
              //             color: Colors.grey.shade500,
              //           ),
              //         ),
              //         Gap(10),

              //         //Screening---------------------------------
              //         Container(
              //           margin: EdgeInsets.only(top: 10),
              //           width: size.width,
              //           child: Wrap(
              //             direction: Axis.horizontal,
              //             spacing: 15,
              //             runSpacing: 15,
              //             children: List.generate(6, (index) {
              //               return Container(
              //                 padding: EdgeInsets.symmetric(
              //                   horizontal: 16,
              //                   vertical: 8,
              //                 ),
              //                 decoration: BoxDecoration(
              //                   border: Border.all(color: Colors.grey.shade300),
              //                   borderRadius: BorderRadius.circular(10),
              //                 ),
              //                 child: GestureDetector(
              //                   onTap: () {
              //                     Navigator.push(
              //                       context,
              //                       MaterialPageRoute(
              //                         builder: (context) {
              //                           return Booking();
              //                         },
              //                       ),
              //                     );
              //                   },

              //                   //Screening-Item---------------
              //                   child: Row(
              //                     mainAxisSize: MainAxisSize.min, //wrap-content
              //                     children: [
              //                       Text(
              //                         '08:00',
              //                         style: TextStyle(
              //                           fontSize: 18,
              //                           fontWeight: FontWeight.w500,
              //                         ),
              //                       ),
              //                       Gap(5),
              //                       Text(
              //                         '~ 10:00',
              //                         style: TextStyle(
              //                           fontSize: 12,
              //                           color: Colors.grey.shade500,
              //                         ),
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //               );
              //             }),
              //           ),
              //         ),
              //         Gap(5),
              //       ],
              //     );
              //   },
              // ),
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
