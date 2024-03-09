import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gap/gap.dart';
import 'package:project_1/layout/notification.dart';
import 'package:project_1/screen/drawer.dart';
import 'package:project_1/layout/movie_detail.dart';

import '../screen/heading_1.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
      drawer: const DrawerLeft(),
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
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none),
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
            const HeadlineComponent(StringA: 'Now Playing'),

            //Now-Playing-Carousel-------------------------------------------------------
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true, // Tự động lướt
                autoPlayInterval:
                    Duration(seconds: 3), // Thời gian mỗi lượt lướt
                autoPlayAnimationDuration: Duration(
                    milliseconds:
                        800), // Thời gian chuyển đổi giữa các lượt lướt
                autoPlayCurve: Curves
                    .fastOutSlowIn, // Đường cong chuyển động của lướt tự động
              ),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Text('Text $i'),
                            bottom: 20,
                            left: 20,
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            const SizedBox(
              height: 25,
            ),

            //Genres-list
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
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
            const HeadlineComponent(StringA: 'Coming Soon'),

            SizedBox(
              height: 500,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (conetxt) {
                                return MovieDetail();
                              },
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                          ),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),

                      //Movie-Card-Info
                      Container(
                        width: 200,
                        padding: EdgeInsets.only(top: 10, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                'This is a long title ${index}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Gap(4),
                            Row(
                              children: [
                                Container(
                                  child: const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                                Gap(5),
                                Container(
                                  child: const Text(
                                    '4.5',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
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
