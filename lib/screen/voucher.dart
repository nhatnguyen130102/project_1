import 'package:flutter/material.dart';

import '../screen/widget_voucher.dart';

class Voucher extends StatefulWidget {
  const Voucher({Key? key}) : super(key: key);

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  late TabController _tabController;

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
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 10,
            ),
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 223, 223, 223),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text('Banner'),
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  child: Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    'Email@gmail.com',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 108, 108, 108),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Widget_Voucher(
                  stringA: 'voucher',
                  stringB: '3',
                ),
                Widget_Voucher(
                  stringA: 'Points',
                  stringB: '20',
                ),
                Widget_Voucher(
                  stringA: 'Spend',
                  stringB: '1M',
                ),
              ],
            ),
          ),
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
                        color: const Color.fromARGB(255, 223, 223, 223),
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
                                      borderRadius: BorderRadius.circular(15),
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
                                vertical: 15,
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
        ],
      ),
    );
  }
}
