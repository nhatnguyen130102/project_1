import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_1/component_widget/voucher_item_modun.dart';
import 'package:project_1/style/style.dart';

import '../component_widget/widget_voucher.dart';

class Voucher extends StatefulWidget {
  const Voucher({Key? key}) : super(key: key);

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: white,
        title: Text('Voucher'),
      ),
      body: SingleChildScrollView(
        child: Column(
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
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 223, 223, 223),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text('Banner'),
              ),
            ),
            Gap(30),
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
            Column(
              children: [
                voucher_item_modun(size: size),
                voucher_item_modun(size: size),
                voucher_item_modun(size: size),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
