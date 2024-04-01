import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_1/screen/mainlayout.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:project_1/screen/rating.dart';
import 'package:project_1/style/style.dart';
import '../component_widget/headline_1_component.dart';
import '../model/screening_model.dart';
import '../repository/screening_repository.dart';
import 'choosedate.dart';

class MovieDetail extends StatefulWidget {
  final Map<String, dynamic> movie;
  MovieDetail({
    required this.movie,
    super.key,
  });

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  late String movieId = widget.movie['movieID'];
  late Future<List<ScreeningModel>> _screeningsFuture;
  late ScreeningRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = ScreeningRepository();
    _screeningsFuture = _repository.getScreeningsByMovieId(movieId);
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
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          '${widget.movie['name']}',
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Gap(10),
            Container(
              width: size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Movie-Image
                  Container(
                    margin: EdgeInsets.only(left: 15, right: 15),
                    height: 220,
                    width: 150,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          widget.movie['image'],
                          fit: BoxFit.cover,
                        )),
                  ),

                  //Movie-Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 140,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //Name-----------------
                              Text(
                                '${widget.movie['name']}',
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              Gap(4),

                              //Ratings-----------------
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  Gap(2),
                                  Text(
                                    widget.movie['rating'].toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 0.8,
                                        color: Colors.grey.shade400,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 2,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return Rating_Page();
                                            },
                                          ),
                                        );
                                      },
                                      child: Text(
                                        '182 ratings',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey.shade500),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Gap(8),

                              Text('${widget.movie['date']}',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 12,
                                  )),
                              Gap(10),
                              //Movie Length--------
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Ionicons.time_outline,
                                        size: 14,
                                        color: Colors.grey.shade300,
                                      ),
                                      Gap(4),
                                      Text(
                                        '1h00',
                                        style: TextStyle(
                                          color: Colors.grey.shade300,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Gap(8),

                              //Genre----------------------------
                              Text(
                                widget.movie['genre'].toString().trim(),
                                style: TextStyle(
                                    fontSize: 12, color: Colors.red.shade400),
                              ),
                            ],
                          ),
                        ),

                        Gap(38),

                        //Booking-Button
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: white),
                                borderRadius: BorderRadius.circular(10),
                              ),

                              //T16: for 16+, T18: for 18+
                              //P, C, K

                              child: Text(
                                widget.movie['age'],
                                style: TextStyle(color: white),
                              ),
                            ),
                            Gap(10),
                            Container(
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Choose_Date(
                                            screenings: _screeningsFuture);
                                        // return MainLayout();
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: red500,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Book Now',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
                width: size.width,
                padding: EdgeInsets.only(top: 25, left: 15, right: 15),
                child: ExpandableText(
                  widget.movie['summary'].toString().trim(),
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.grey.shade400),
                  expandText: 'show more',
                  collapseText: 'show less',
                  maxLines: 3,
                  linkColor: Colors.blue,
                )),

            //Actor-Slider
            Headline1Component(StringA: 'Actor'),
            Container(
              margin: EdgeInsets.only(left: 15),
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 100,
                    width: 100,

                    // ClipRRect -> Widget that clips its child using a rounded retangle.
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          'https://i.pinimg.com/564x/93/cd/6f/93cd6f16d1e0a76a91f4beb6fd8e2a86.jpg',
                          fit: BoxFit.cover,
                        )),
                  );
                },
              ),
            ),

            //Trailer-Slider
            Headline1Component(StringA: 'Trailer'),
            Container(
              margin: EdgeInsets.only(left: 15),
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 15),
                    height: 150,
                    width: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        'https://i.pinimg.com/564x/7c/d6/dc/7cd6dc7b34af544375336c288aec69da.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
