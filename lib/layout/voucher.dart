import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Voucher extends StatefulWidget {
  const Voucher({Key? key}) : super(key: key);

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Voucher'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100, // Adjust the height of the banner as needed
            color: Colors.blue,
            child: Center(child: Text('Banner')),
          ),
          // CarouselSlider(
          //     options: CarouselOptions(
          //       height: 200,
          //       autoPlay: true, // Tự động lướt
          //       autoPlayInterval:
          //           Duration(seconds: 3), // Thời gian mỗi lượt lướt
          //       autoPlayAnimationDuration: Duration(
          //           milliseconds:
          //               800), // Thời gian chuyển đổi giữa các lượt lướt
          //       autoPlayCurve: Curves
          //           .fastOutSlowIn, // Đường cong chuyển động của lướt tự động
          //     ),
          //     items: [1, 2, 3, 4, 5].map((i) {
          //       return Builder(
          //         builder: (BuildContext context) {
          //           return Container(
          //             width: MediaQuery.of(context).size.width,
          //             margin: EdgeInsets.symmetric(horizontal: 10),
          //             decoration: BoxDecoration(
          //               color: Colors.grey[200],
          //               borderRadius: BorderRadius.circular(15),
          //             ),
          //             child: Stack(
          //               children: [
          //                 Positioned(
          //                   child: Text('Text $i'),
          //                   bottom: 20,
          //                   left: 20,
          //                 ),
          //               ],
          //             ),
          //           );
          //         },
          //       );
          //     }).toList(),
          //   ),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                text: 'Voucher',
              ),
              Tab(
                text: 'Points',
              ),
              Tab(
                text: 'Spend',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 15,
                        ),
                        height: 140,
                        width: size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              width: 140,
                              height: 140,
                              color: Colors.amber,
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 5,
                                    ),
                                    child: Text(
                                      'Hello123',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    child: Text(
                                      'Hello1211111111111111111111113',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 5,
                                          ),
                                          height: 30,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              width: 0.5,
                                              color: Colors.black,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Voucher ${index}',
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 5,
                                      vertical: 5,
                                    ),
                                    child: Text(
                                      'Hello123',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Icon(
                                Icons.bookmark_border,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Content for Points tab
                      // Example content
                      ListTile(title: Text('Points content 1')),
                      ListTile(title: Text('Points content 2')),
                      ListTile(title: Text('Points content 3')),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Content for Spend tab
                      // Example content
                      ListTile(title: Text('Spend content 1')),
                      ListTile(title: Text('Spend content 2')),
                      ListTile(title: Text('Spend content 3')),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
