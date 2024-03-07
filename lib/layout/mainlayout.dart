import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
                    builder: (context) => Notification_layout(),
                  ),
                );
              },
              child: Icon(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(217, 210, 210, 210),
                ),
                height: 35,
                width: size.width,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: Color.fromARGB(255, 61, 61, 61),
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
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
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(217, 210, 210, 210),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          'text $i',
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    margin: const EdgeInsets.only(left: 5),
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(217, 210, 210, 210),
                        border: Border.all(color: Colors.black, width: 1)),
                    child: Center(child: Text('Hello $index')),
                  );
                },
              ),
            ),
            const Headline_1(StringA: 'Coming Soon'),
            SizedBox(
              height: size.height,
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
                              builder: (context) => MovieDetail(
                                number: index,
                              ), // Thay YourNewPage bằng tên trang bạn muốn điều hướng tới
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 15),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          height: size.height * 1 / 3,
                          width: size.width * 1 / 2,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(217, 210, 210, 210),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black, width: 1),
                          ),
                        ),
                      ),
                      const Text('Name Movie'),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text('4.5'),
                        ],
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
