import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:gap/gap.dart';
import 'package:project_1/screen/login.dart';
import 'package:project_1/screen/mainlayout.dart';
import 'package:project_1/screen/orders.dart';
import 'package:project_1/style/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Account extends StatefulWidget {
  final isLoggedIn;
  final username;
  final userID;
  const Account({super.key, this.isLoggedIn, this.username, this.userID});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Future<void> _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn'); // Xóa trạng thái đăng nhập
    await prefs.remove('username'); // Xóa tên người dùng
    await prefs.remove('userID'); // Xóa tên người dùng

    // Gán các giá trị state về giá trị mặc định hoặc rỗng
    // setState(() {});
    // Chuyển hướng về màn hình đăng nhập hoặc màn hình khác tùy thuộc vào logic của ứng dụng
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainLayout(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), // Biểu tượng menu
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, right: 40),
                child: const CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/564x/6e/7f/7d/6e7f7dd7cf3b29a0ba697cb6b770ccd2.jpg'),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.isLoggedIn
                      ? Text(
                          widget.username,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          'Account Name',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                  widget.isLoggedIn
                      ? Text(widget.userID)
                      : Text('Account Email'),
                  Gap(20),
                  Container(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: widget.isLoggedIn
                            ? GestureDetector(
                                onTap: () {
                                  _logout();
                                },
                                child: Center(
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Login();
                                      },
                                    ),
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(25),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width * 0.9,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesome.lock,
                      ),
                      Gap(10),
                      Text(
                        'Change Password',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width * 0.9,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesome.star,
                      ),
                      Gap(10),
                      Text(
                        'Favorite',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Orders(),
                ),
              );
            },
            child: Container(
              width: size.width * 0.9,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesome.tag,
                      ),
                      Gap(10),
                      Text(
                        'Orders',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width * 0.9,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesome.info,
                      ),
                      Gap(10),
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width * 0.9,
              margin: EdgeInsets.only(top: 30),
              padding: EdgeInsets.only(left: 20),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesome.mic,
                      ),
                      Gap(10),
                      Text(
                        'Help',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
