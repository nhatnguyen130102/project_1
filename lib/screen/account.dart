import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_1/screen/login.dart';
import 'package:project_1/screen/mainlayout.dart';
import 'package:project_1/screen/ticket.dart';
import 'package:project_1/style/style.dart';

import '../component_widget/loading.dart';

class Account extends StatefulWidget {


  Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  late String _accountName;
  late String _accountEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _accountEmail = 'AccountEmail';
    _accountName = 'AccountName';
    _checkIfUserIsLoggedIn();
  }
  void _checkIfUserIsLoggedIn() async {
    // Kiểm tra xem có người dùng nào đã đăng nhập trước đó hay không
    User? user = _auth.currentUser;

    if (user != null) {

      _accountEmail = FirebaseAuth.instance.currentUser!.email!;
      _accountName = FirebaseAuth.instance.currentUser!.displayName!;
    } else {

      _accountEmail = 'AccountEmail';
      _accountName = 'AccountName';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: white,
          ), // Biểu tượng menu
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainLayout(),
              ),
            );
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

                  Text(
                    _accountName,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(_accountEmail),
                  Gap(20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: yellow,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: StreamBuilder<User?>(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) {
                          return Text(
                            snapshot.error.toString(),
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.data == null) {
                            return Center(
                              child: GestureDetector(
                                onTap: () async {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: black),
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: GestureDetector(
                                onTap: () async {
                                  await GoogleSignIn().signOut();
                                  FirebaseAuth.instance.signOut();
                                  setState(() {
                                    _accountEmail = 'AccountEmail';
                                    _accountName = 'AccountName';
                                  });
                                },
                                child: Text(
                                  'Logout',
                                  style: TextStyle(color: black),
                                ),
                              ),
                            );
                          }
                        }
                        return Center(
                          child: Loading(),
                        );
                      },
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
                        color: white,
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
                  Icon(
                    Icons.arrow_forward_ios,
                    color: white,
                  )
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
                        color: white,
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
                  Icon(
                    Icons.arrow_forward_ios,
                    color: white,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TicketPage(),
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
                        color: white,
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
                  Icon(
                    Icons.arrow_forward_ios,
                    color: white,
                  )
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
                        color: white,
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
                  Icon(
                    Icons.arrow_forward_ios,
                    color: white,
                  )
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
                        color: white,
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
                  Icon(
                    Icons.arrow_forward_ios,
                    color: white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
