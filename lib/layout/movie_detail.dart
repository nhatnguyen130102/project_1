import 'package:flutter/material.dart';
import 'package:project_1/layout/booking.dart';
import '../screen/heading_1.dart';

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
          'Name Movie ${widget.number}',
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(217, 210, 210, 210),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name movie ${widget.number}',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text('Time movie'),
                          Text('Actor'),
                          Text('Category'),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Booking(
                              number: widget.number,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        child: Text('Booking'),
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Text(
                  'skldjfl;askjdfl;kasjdfl;asjdfl;jaskdlfjal;skdjflka;sjdfl;kasjdfl;kjasdl;kfjals;kdjflkasdjfl;asjdl;fkjasl;dkfjal;sdjfl;aksjdfl;kasjdflk;jasdlk;fjl'),
            ),
            Headline_1(StringA: 'Actor'),
            Container(
              margin: EdgeInsets.only(left: 15),
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(
                      'https://i.pinimg.com/564x/93/cd/6f/93cd6f16d1e0a76a91f4beb6fd8e2a86.jpg',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Headline_1(StringA: 'Trailer'),
            Container(
              margin: EdgeInsets.only(top: 15, left: 15),
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    padding: EdgeInsets.symmetric(horizontal: 2.5),
                    width: 250,
                    child: Image.network(
                        'https://i.pinimg.com/564x/7c/d6/dc/7cd6dc7b34af544375336c288aec69da.jpg'),
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
