import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:project_1/model/login_model.dart';
import 'package:project_1/screen/notification.dart';
import 'package:project_1/component_widget/drawer.dart';
import 'package:project_1/screen/movie_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../component_widget/headline_1_component.dart';
import '../data/user_preferences.dart';
import '../repository/movie_repository.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  late String username = '';
  late String userID = '';
  late bool isLoggedIn = false;
  final MovieRepository _movieRepository = MovieRepository();
  late Future<List<Map<String, dynamic>>> _moviesFuture;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
    _moviesFuture = _movieRepository.getMovies();
  }

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      String username = prefs.getString('username') ?? '';
      String userID = prefs.getString('userID') ?? '';
      setState(() {
        this.isLoggedIn = isLoggedIn;
        this.username = username;
        this.userID = userID;
      });
    } else {
      setState(() {
        this.isLoggedIn = false;
        this.username = '';
        this.userID = '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String _text = '';
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Center(
          child: Text(
            'My App',
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Notification_layout(),
                  ),
                );
              },
              child: const Icon(
                Icons.notifications_none_outlined,
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerLeft(
          userID: userID, username: username, isLoggedIn: isLoggedIn),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Searchbar-------------------------------------------------------
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 0),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          _text =
                              text; // Update the text variable when text changes
                        });
                      },
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Search',
                        hintStyle:
                            TextStyle(color: Colors.grey[600], fontSize: 18),
                        prefixIcon: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          child: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //Heading-NowPlaying-------------------------------------------------------
            const Headline1Component(StringA: 'Now Playing'),

            //Now-Playing-Carousel-------------------------------------------------------

            FutureBuilder(
              future: _moviesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                    ),
                  );
                }
                List<Map<String, dynamic>> movie_modun =
                    snapshot.data as List<Map<String, dynamic>>;
                return CarouselSlider(
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                  ),
                  items: movie_modun.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MovieDetail(movie: i),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(i['image']),
                                fit: BoxFit.cover,
                              ),
                              // color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                i['name'],
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              },
            ),
            // CarouselSlider(
            //   options: CarouselOptions(
            //     height: 200,
            //     autoPlay: true, // Tự động lướt
            //     autoPlayInterval:
            //         Duration(seconds: 3), // Thời gian mỗi lượt lướt
            //     autoPlayAnimationDuration: Duration(
            //         milliseconds:
            //             800), // Thời gian chuyển đổi giữa các lượt lướt
            //     autoPlayCurve: Curves
            //         .fastOutSlowIn, // Đường cong chuyển động của lướt tự động
            //   ),
            //   items: [1, 2, 3, 4, 5].map((i) {
            //     return Builder(
            //       builder: (BuildContext context) {
            //         return Container(
            //           width: MediaQuery.of(context).size.width,
            //           margin: EdgeInsets.symmetric(horizontal: 10),
            //           decoration: BoxDecoration(
            //             color: Colors.grey[200],
            //             borderRadius: BorderRadius.circular(15),
            //           ),
            //           child: Stack(
            //             children: [
            //               Positioned(
            //                 child: Text('Text $i'),
            //                 bottom: 20,
            //                 left: 20,
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     );
            //   }).toList(),
            // ),

            const SizedBox(
              height: 25,
            ),

            //Genres-list
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      margin: const EdgeInsets.only(
                        left: 15,
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                      ),
                      child: Center(child: Text('Option $index')),
                    ),
                  );
                },
              ),
            ),

            //Heading-ComingSoon
            const Headline1Component(StringA: 'Coming Soon'),

            FutureBuilder(
              future: _moviesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                    ),
                  );
                }
                List<Map<String, dynamic>> movies =
                    snapshot.data as List<Map<String, dynamic>>;
                return Container(
                  margin: EdgeInsets.only(bottom: 30),
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> movie_modun = movies[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetail(movie: movie_modun),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 20),
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(movie_modun['image']),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      movie_modun['name'],
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20,
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '4.5',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
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
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
