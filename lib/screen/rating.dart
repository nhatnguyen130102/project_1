import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:project_1/style/style.dart';

class Rating_Page extends StatefulWidget {
  const Rating_Page({super.key});

  @override
  State<Rating_Page> createState() => _Rating_PageState();
}

class _Rating_PageState extends State<Rating_Page> {
  String _selectedItem = '5 stars';

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            //Header--------
            children: [
              Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 30,
                          ),
                          Gap(5),
                          Text(
                            '4.9',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                      Gap(2),
                      Text(
                        '182 Ratings',
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  //Selection menu----------------------------
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: DropdownButton<String>(
                      // underline: null,
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue!;
                        });
                      },
                      items: <String>[
                        '5 stars',
                        '4 stars',
                        '3 stars',
                        '2 stars',
                        '1 stars'
                      ].map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      underline: SizedBox(), // Tắt khung hình vuông
                    ),
                  ),
                ],
              ),
              Gap(30),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ratings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gap(5),
                  RatingBar.builder(
                    initialRating: 5,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
