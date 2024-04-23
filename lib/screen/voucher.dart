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
    Size size = MediaQuery
        .of(context)
        .size;
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
// }
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import '../style/style.dart';
//
// class VoucherPage extends StatefulWidget {
//   const VoucherPage({super.key});
//
//   @override
//   State<VoucherPage> createState() => _VoucherPageState();
// }
//
// class _VoucherPageState extends State<VoucherPage> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back_ios,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//
//             //Voucher-Item
//             Container(
//               padding: EdgeInsets.all(16),
//               margin: EdgeInsets.only(bottom: 16),
//               decoration: BoxDecoration(
//                 color: white.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //Movie-Details
//                 children: [
//                   Container(
//                     width: size.width / 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //Movie-Info
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               padding: EdgeInsets.all(16),
//                               decoration: BoxDecoration(
//                                 color: yellow.withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Icon(Icons.favorite_border, color: yellow, size: 24),
//                             ),
//                             Container(
//                               width: size.width / 3,
//                               padding: EdgeInsets.only(left: 8),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Free Drinks',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(fontSize: 16, fontWeight: bold,),),
//                                   Gap(4),
//                                   Text(
//                                     'Valid until 12/05/2024',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(fontSize: 10, color: white.withOpacity(0.5)),),
//                                   Gap(8),
//                                   Text(
//                                     'For couple tickets only ',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(fontSize: 12, fontWeight: medium,),),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//
//
//                   //Get-Button
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                     decoration: BoxDecoration(
//                       color: yellow,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Text('GET', style: TextStyle(fontSize: 10, fontWeight: bold, color: black),),
//                   ),
//                 ],
//               ),
//             ),
//
//             //Voucher-Item
//             Container(
//               padding: EdgeInsets.all(16),
//               margin: EdgeInsets.only(bottom: 16),
//               decoration: BoxDecoration(
//                 color: white.withOpacity(0.1),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 //Movie-Details
//                 children: [
//                   Container(
//                     width: size.width / 2,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         //Movie-Info
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Container(
//                               padding: EdgeInsets.all(16),
//                               decoration: BoxDecoration(
//                                 color: yellow.withOpacity(0.1),
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Icon(Icons.favorite_border, color: yellow, size: 24),
//                             ),
//                             Container(
//                               width: size.width / 3,
//                               padding: EdgeInsets.only(left: 8),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     'Free Drinks',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(fontSize: 16, fontWeight: bold,),),
//                                   Gap(4),
//                                   Text(
//                                     'Valid until 12/05/2024',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(fontSize: 10, color: white.withOpacity(0.5)),),
//                                   Gap(8),
//                                   Text(
//                                     'For couple tickets only ',
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: TextStyle(fontSize: 12, fontWeight: medium,),),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//
//
//                   //Get-Button
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//                     decoration: BoxDecoration(
//                       color: white.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Text('GET', style: TextStyle(fontSize: 10, fontWeight: bold, color: black),),
//                   ),
//                 ],
//               ),
//             ),
//
//             //Voucher-Item
//             //Voucher-Item
//           ],
//         ),
//       ),
//     );
//   }
// }