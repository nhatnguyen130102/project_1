import 'package:heroicons/heroicons.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:project_1/screen/login.dart';
import 'package:project_1/screen/notification.dart';
import 'package:project_1/screen/movie_detail.dart';
import 'package:project_1/screen/search.dart';
import 'package:project_1/style/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    double height = 560;
    double itemMargin = 20;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: white,
        leading: IconButton(
          icon: HeroIcon(HeroIcons.user),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPage(),
                      ),
                    );
                  },
                  child: HeroIcon(HeroIcons.magnifyingGlass),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NotificationPage(),
                      ),
                    );
                  },
                  child: HeroIcon(HeroIcons.bell),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            //Category-list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width / 5,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(),
                    child: Text(
                      'Now Playing',
                      style: TextStyle(
                          color: yellow, fontWeight: medium, fontSize: 16),
                    ),
                  ),
                  Container(
                    width: size.width / 5,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(),
                    child: Text(
                      'Coming Soon',
                      style: TextStyle(
                        fontSize: 16,
                        color: white.withOpacity(0.5),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 5,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(),
                    child: Text(
                      'Early Screening',
                      style: TextStyle(
                        fontSize: 16,
                        color: white.withOpacity(0.5),
                      ),
                    ),
                  )
                ],
              ),
            ),

            //Carousel-slider--------------------------------------------
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
                return Container(
                  child: Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1.0,
                          height: height,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 1000),
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
                                      builder: (context) =>
                                          MovieDetail(movie: i),
                                    ),
                                  );
                                },

                                //Card-movie
                                child: Container(
                                  width: size.width,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: itemMargin),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(i['image']),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),

                                  //Short-movie-info-------------------
                                  child: Container(
                                    alignment: Alignment.topCenter,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                          black.withOpacity(0.9),
                                          Colors.transparent,
                                        ])),
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 20, right: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        //Rating-movie
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              color: yellow,
                                            ),
                                            Gap(8),
                                            Text(
                                              i['rating'].toDouble().toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: medium,
                                                color: Colors.grey.shade100,
                                              ),
                                            ),
                                          ],
                                        ),

                                        //Age-movie
                                        Container(
                                          padding: EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: yellow.withOpacity(0.9),
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          child: Text(i['age'],
                                              style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: black,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      Positioned(
                        top: height / 2,
                        left: 10,
                        right: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: yellow.withOpacity(0.7),
                              ),
                              child: HeroIcon(HeroIcons.chevronLeft),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: yellow.withOpacity(0.7),
                              ),
                              child: HeroIcon(HeroIcons.chevronRight),
                            ),
                          ],
                        ),
                      ),
                    ],
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
