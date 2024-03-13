import 'package:flutter/material.dart';
import '../screen/infomation_notification.dart';
import '../screen/promotion_notification.dart';
import '../screen/transaction_notification.dart';

class Notification_layout extends StatefulWidget {
  const Notification_layout({super.key});

  @override
  State<Notification_layout> createState() => _Notification_layoutState();
}

class _Notification_layoutState extends State<Notification_layout>
    with SingleTickerProviderStateMixin {
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
      backgroundColor: Color.fromARGB(255, 237, 237, 237),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          margin: EdgeInsets.only(left: 60),
          child: Text('Notification'),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: 'Transaction',
            ),
            Tab(
              text: 'Promotion',
            ),
            Tab(
              text: 'Infomation',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          //Transaction
          Transaction_Notification(size: size),

          //Promotion
          Promotion_Notification(size: size),

          //Infomation
          Infomation_Notification(size: size),
        ],
      ),
    );
  }
}
