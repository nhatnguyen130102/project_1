import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:heroicons/heroicons.dart';
import 'package:project_1/repository/movie_repository.dart';
import 'package:project_1/screen/rating.dart';
import 'package:project_1/style/style.dart';

import '../model/movie_model.dart';
import 'chooselocation.dart';

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
  late String movieId = widget.movie['movieID']; // lấy movieID
  // repository
  MovieRepository _movieRepository = MovieRepository();

  // var
  late Future<List<Actor>> _listActor;

  @override
  void initState() {
    super.initState();
    _listActor = _movieRepository.getAllActorsForMovie(movieId);
    int anc = _listActor.hashCode;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: white,
        leading: IconButton(
          icon: HeroIcon(
            HeroIcons.chevronLeft,
            color: white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            //background-image
            Positioned(
              child: Container(
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        black.withOpacity(0.6),
                        black,
                      ]),
                ),
                child: Image.network('${widget.movie['image']}'),
              ),
            ),

            //ontop-widget
            Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Gap(112),
                      //Image-movie
                      Center(
                          child: Container(
                        width: size.width / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            '${widget.movie['image']}',
                            fit: BoxFit.fill,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: black.withOpacity(0.7),
                              // Màu của shadow và độ mờ
                              spreadRadius: 10,
                              // Bề rộng của shadow
                              blurRadius: 100,
                              // Độ mờ của shadow
                              offset: Offset(
                                  0, 3), // Vị trí của shadow (ngang, dọc)
                            ),
                          ],
                        ),
                      )),
                      Gap(32),

                      //body

                      Column(children: [
                        Container(
                          width: size.width - 80,
                          child: Text(
                            '${widget.movie['name']}',
                            style: TextStyle(fontSize: 24, fontWeight: bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Gap(8),
                        Text(
                          '${widget.movie['genre']}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ]),
                      Gap(24),

                      //Rating-time-age---------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return RatingPage(movieID:widget.movie['movieID']);
                                  },
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: yellow,
                                ),
                                Gap(4),
                                Text(
                                  '${widget.movie['rating'].toString()}',
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: medium),
                                )
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              HeroIcon(
                                HeroIcons.clock,
                                color: yellow,
                              ),
                              Gap(6),
                              Text(
                                '${widget.movie['time']}',
                                style:
                                    TextStyle(fontSize: 18, fontWeight: medium),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              HeroIcon(
                                HeroIcons.film,
                                color: yellow,
                              ),
                              Gap(8),
                              Text(
                                '${widget.movie['age']}',
                                style:
                                    TextStyle(fontSize: 18, fontWeight: medium),
                              )
                            ],
                          ),
                        ],
                      ),

                      //Trailer-booking-button-row
                      Gap(24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: white.withOpacity(0.1),
                              // border: Border.all(color: yellow),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'TRAILER',
                              style: TextStyle(
                                fontWeight: semibold,
                                color: yellow,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Gap(16),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      // Choose_Date(movieID: movieId),
                                      Choose_Location(movieID: movieId),
                                  // Choose_LocationTest(movieID: movieId),

                                  // ScreeningPage(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: yellow,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                'BOOK NOW',
                                style: TextStyle(
                                  fontWeight: semibold,
                                  color: black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Gap(16),

                //Director-ReleaseDate
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Director-info
                          Container(
                            width: size.width * 1 / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Director',
                                  style: TextStyle(
                                      color: yellow,
                                      fontWeight: bold,
                                      fontSize: 20),
                                ),
                                Gap(4),
                                Text(
                                  '${widget.movie['director']}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Gap(32),

                          //Slash
                          Text(
                            '⁄',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Gap(32),

                          //ReleaseDate-info
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Release Date',
                                  style: TextStyle(
                                      color: yellow,
                                      fontWeight: bold,
                                      fontSize: 20),
                                ),
                                Gap(4),
                                Text(
                                  '${widget.movie['date']}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(24),

                      //Summary
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ExpandableText(
                            '${widget.movie['summary']}',
                            style: TextStyle(color: white.withOpacity(0.8)),
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

                      //Actors
                    ],
                  ),
                ),

                Gap(20),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Actor',
                    style: TextStyle(
                        color: yellow, fontWeight: bold, fontSize: 20),
                  ),
                ),
                Gap(20),

                FutureBuilder(
                  future: _listActor,
                  builder: (context, SnapShot) {
                    return Container(
                      height: 80,
                      width: size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: SnapShot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 80,
                            margin: EdgeInsets.only(left: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              // Bán kính của các góc bo tròn
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                // Tỉ lệ chiều rộng/chiều cao của hình ảnh
                                child: Image.network(
                                  SnapShot.data![index].image,
                                  fit: BoxFit
                                      .cover, // Hình ảnh sẽ fit theo chiều rộng
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Gap(8),

                FutureBuilder(
                  future: _listActor,
                  builder: (context, SnapShot) {
                    return Container(
                      height: 50,
                      width: size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: SnapShot.data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                              width: 80,
                            margin: EdgeInsets.only(left: 20),
                            child: Text(SnapShot.data![index].name, style: TextStyle(fontSize: 12), textAlign: TextAlign.center,)
                          );
                        },
                      ),
                    );
                  },
                ),

                Gap(20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
