import 'package:flutter/material.dart';
import 'package:project_1/component_widget/movie_order.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> with SingleTickerProviderStateMixin {
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
        title: Text('Orders'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'All'),
            Tab(text: 'Completed'),
            Tab(text: 'Canceled'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                movie_orders(size: size),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
