import 'package:flutter/material.dart';

import '../model/login_model.dart';

class ProfilePage extends StatelessWidget {
  final UserModel user;

  ProfilePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${user.username}'),
            SizedBox(height: 20),
            Text('User ID: ${user.userID}'),
            // Các thông tin người dùng khác có thể được hiển thị ở đây
          ],
        ),
      ),
    );
  }
}
