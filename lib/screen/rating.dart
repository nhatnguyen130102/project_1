import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:project_1/repository/movie_repository.dart';

import '../component_widget/loading.dart';
import '../model/movie_model.dart';
import '../style/style.dart';

class RatingPage extends StatefulWidget {
  String movieID;

  RatingPage({required this.movieID, super.key});

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  late Future<MovieModel?> _item;

  MovieRepository _movieRepository = MovieRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _item = _movieRepository.getMoviesByMovieID(widget.movieID);
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
        future: _item,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loading(); // Hiển thị loading indicator nếu đang chờ dữ liệu
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Xử lý lỗi nếu có
          } else if (snapshot.data == null) {
            return Text('No data available'); // Xử lý khi không có dữ liệu
          } else {
            MovieModel item = snapshot.data!;
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 8,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //Header--------
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            width: 120,
                            height: 120 * 1.5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                item.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Gap(24),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    item.name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: yellow,
                                      fontSize: 20,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ),
                                Gap(2),
                                Container(
                                  child: Text(
                                    item.genre,
                                    style: TextStyle(
                                      color: white.withOpacity(0.8),
                                    ),
                                  ),
                                ),
                                Gap(16),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            color: yellow,
                                            size: 14,
                                          ),
                                          Gap(4),
                                          Text(
                                            item.time,
                                            style: TextStyle(
                                              fontWeight: medium,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Gap(40),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.movie,
                                            color: yellow,
                                            size: 14,
                                          ),
                                          Gap(6),
                                          Text(
                                            item.age,
                                            style: TextStyle(
                                              fontWeight: medium,
                                              fontSize: 12,
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
                        ],
                      ),
                    ),
                    Gap(24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '4.9',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: bold,
                                  ),
                                ),
                                Text(
                                  '/5',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: white.withOpacity(0.8),
                                  ),
                                ),
                              ],
                            ),
                            Gap(2),
                            Text(
                              '182 Ratings',
                              style: TextStyle(
                                fontSize: 10,
                                color: white.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),

                        //Rating-bar
                        Container(
                          child: RatingBar.builder(
                            initialRating: 5,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: yellow,
                              size: 16,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                        ),
                      ],
                    ),

                    //Comment-Item
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: white.withOpacity(0.05),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //User-info
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(50),
                                      child: Image.network(
                                        'https://th.bing.com/th/id/OIP.pGA3lGMjR2ZTIL_eBqytugHaHa?rs=1&pid=ImgDetMain',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Gap(8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nguyen Van A',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: semibold,
                                        ),
                                      ),
                                      Gap(4),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: yellow, size: 14),
                                          Gap(4),
                                          Text(
                                            '5',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: medium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.menu,
                                  size: 14, color: white.withOpacity(0.7)),
                            ],
                          ),
                          Gap(8),

                          //Comment
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ExpandableText(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                                style: TextStyle(
                                    color: white.withOpacity(0.8),
                                    fontSize: 12),
                                expandText: 'show more',
                                collapseText: 'show less',
                                maxLines: 3,
                                linkColor: yellow,
                                linkStyle: TextStyle(
                                  fontWeight: bold,
                                ),
                              ),
                            ],
                          ),
                          Gap(10),

                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      size: 10,
                                      color: white.withOpacity(0.6),
                                    ),
                                    Gap(4),
                                    Text(
                                      '1',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: white.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gap(8),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: white.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.chat_bubble,
                                      size: 10,
                                      color: white.withOpacity(0.6),
                                    ),
                                    Gap(4),
                                    Text(
                                      '2',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: white.withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),

                    //Comment-Item
                    //Comment-Item
                  ],
                ),
              ),
            );
          };
        },
      ),
    );
  }
}
