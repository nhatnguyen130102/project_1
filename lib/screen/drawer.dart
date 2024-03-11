import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:project_1/layout/account.dart';

import '../layout/voucher.dart';

class DrawerLeft extends StatelessWidget {
  const DrawerLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Account Name'),
            accountEmail: Text('Account Email'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/5b/04/6e/5b046e698036db4c57e70314a26fad70.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              image: DecorationImage(
                image: NetworkImage(
                    'https://i.pinimg.com/564x/5b/04/6e/5b046e698036db4c57e70314a26fad70.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(FontAwesome.home),
                  title: const Text(
                    'Home',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.tags),
                  title: const Text(
                    'Voucher',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Voucher();
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text(
                    'Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  titleAlignment: ListTileTitleAlignment.center,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Account(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
