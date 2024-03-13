import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:project_1/screen/choosedate.dart';
import 'package:project_1/screen/rating.dart';
import '../component_widget/headline_1_component.dart';

class MovieDetail extends StatefulWidget {
  final number;
  MovieDetail({this.number, super.key});

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'MovieName ${widget.number}',
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Gap(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Movie-Image
                Container(
                  margin: EdgeInsets.only(left: 15, right: 25),
                  height: 200,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(217, 210, 210, 210),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),

                //Movie-Info
                Container(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MovieName ${widget.number}',
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Gap(5),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                              ),
                              child: Center(
                                child: Text(
                                  'Genre',
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_outline,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                Gap(4),
                                Text(
                                  '4.5',
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
                                      width: 0.7,
                                      color: Colors.black,
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
                                      '182 Ratings >',
                                      style: TextStyle(
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                'add your content here.',
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Ionicons.time_outline,
                                  size: 14,
                                  color: Colors.grey[500],
                                ),
                                Gap(4),
                                Text(
                                  '1h00',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //Booking-Button
                      Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Choose_Date();
                                },
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Book Now',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
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
            Container(
              width: size.width,
              padding: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eget semper risus. Nullam facilisis ligula sit amet justo vehicula, nec eleifend ipsum lacinia. Vivamus vestibulum eros eu dapibus vehicula.',
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.grey[600]),
              ),
            ),

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
                        borderRadius: BorderRadius.circular(10),
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
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://i.pinimg.com/564x/7c/d6/dc/7cd6dc7b34af544375336c288aec69da.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
