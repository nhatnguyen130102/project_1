import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_1/screen/billing.dart';

class Booking extends StatefulWidget {
  final number;
  const Booking({this.number, super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  final int _rowSeat = 17;
  final int _quantitySeat = 187;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // title: Text('Name movie ${widget.number}'),
      ),
      body: Center(
        child: Stack(
          children: [
            InteractiveViewer(
              boundaryMargin:
                  EdgeInsets.all(20), // Độ lề giữa nội dung và ranh giới
              minScale: 0.1, // Phạm vi thu phóng tối thiểu
              maxScale: 4.0, // Phạm vi thu phóng tối đa
              constrained: false, // Vô hạn cuộn
              child: Container(
                width: 1000, // Độ rộng của nội dung
                height: size.height + 200, // Độ cao của nội dung
                color: const Color.fromARGB(
                    255, 255, 255, 255), // Màu sắc của nội dung
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'MOVIE NAME',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'TUE 04/04/2024 - 08:00 PM',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap(4),
                      Text(
                        '236 Park Streetm Pleston, California CA',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Gap(25),
                      Text(
                        'Screen',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap(15),
                      Container(
                        width: 900,
                        height: size.height - 100,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: _rowSeat, // Số cột
                            childAspectRatio:
                                1.2, // Tỉ lệ giữa chiều rộng và chiều cao của mỗi ô
                            crossAxisSpacing: 10, // Khoảng cách giữa các cột
                            mainAxisSpacing: 20, // Khoảng cách giữa các hàng
                          ),
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _quantitySeat, // Tổng số ghế
                          itemBuilder: (BuildContext context, int index) {
                            // Tính toán tên ghế dựa trên số thứ tự cột và số thứ tự hàng
                            int row = index ~/ _rowSeat +
                                1; // Tính số thứ tự hàng (index / số cột + 1)
                            int column = index % _rowSeat +
                                1; // Tính số thứ tự cột (index % số cột + 1)
                            String seatName =
                                '${String.fromCharCode(65 + row - 1)}$column'; // Tạo tên ghế

                            // Tạo widget cho từng ghế
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[300], // Màu của ghế
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    seatName, // Tên của ghế
                                    style: const TextStyle(
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 0,
              right: 5,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle),
                        Gap(4),
                        Text('Unavailable'),
                      ],
                    ),
                    Gap(30),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.grey[300],
                        ),
                        Gap(4),
                        const Text('Available'),
                      ],
                    ),
                    Gap(30),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.red,
                        ),
                        Gap(4),
                        Text('Booking'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: size.width,
                height: 60,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Billing();
                        },
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      '\$0.00 - Checkout',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
