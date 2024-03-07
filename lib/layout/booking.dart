import 'package:flutter/material.dart';

class Booking extends StatefulWidget {
  final number;
  const Booking({this.number, super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> {
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
        title: Text('Name movie ${widget.number}'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Divider(
              color: Colors.red, // Màu sắc của đường ngang
              thickness: 2, // Độ dày của đường ngang
              height: 20, // Chiều cao của đường ngang
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      'In',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                Text(
                  'Screen',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      'Out',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  height: 300,
                  width: size.width - 50,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, // Số cột
                      childAspectRatio:
                          1.5, // Tỉ lệ giữa chiều rộng và chiều cao của mỗi ô
                      crossAxisSpacing: 10, // Khoảng cách giữa các cột
                      mainAxisSpacing: 10, // Khoảng cách giữa các hàng
                    ),
                    itemCount: 25, // Tổng số ghế
                    itemBuilder: (BuildContext context, int index) {
                      // Tính toán tên ghế dựa trên số thứ tự cột và số thứ tự hàng
                      int row = index ~/ 5 +
                          1; // Tính số thứ tự hàng (index / số cột + 1)
                      int column = index % 5 +
                          1; // Tính số thứ tự cột (index % số cột + 1)
                      String seatName =
                          '${String.fromCharCode(65 + row - 1)}$column'; // Tạo tên ghế

                      // Tạo widget cho từng ghế
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300], // Màu của ghế
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            seatName, // Tên của ghế
                            style: const TextStyle(
                              fontSize: 11,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Row(
                  children: [
                    Icon(Icons.circle),
                    Text('Unavailable'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.grey[300],
                    ),
                    const Text('Available'),
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.red,
                    ),
                    Text('Booking'),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.topLeft,
              child: const Text(
                'Choose Date',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: 100, // Đặt chiều cao cho ListView.builder
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text('Date ${index}'),
                              Text('Time: $index'),
                              Text('Available: $index/${25}'),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(
                  top: 60,
                ),
                height: 100,
                width: size.width,
                color: Colors.grey[300],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'SubTotal',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black38,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '20\$',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '20\$',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black38,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Booking'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
