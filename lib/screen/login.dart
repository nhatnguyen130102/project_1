import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_1/screen/account.dart';
import 'package:project_1/style/style.dart';

import '../repository/login_repository.dart';

class Login extends StatefulWidget {
  // final UserRepository userRepository;
  const Login({super.key});

  // const Login({required this.userRepository, super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late UserRepository userRepository;
  bool isLoggedIn = false;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    userRepository = UserRepository(); // Khởi tạo biến userRepository ở đây
  }

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: size.height,
          width: size.width,
          margin: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Welcome',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: white.withOpacity(0.8)),
              ),
              Gap(30),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(
                    Icons.mail_outline,
                    color: white.withOpacity(0.8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: white.withOpacity(0.9)),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: white.withOpacity(0.8),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: white.withOpacity(0.9)),
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              Container(
                alignment: Alignment.centerRight,
                child: Text('Forgot Password?'),
              ),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                // margin: EdgeInsets.symmetric(
                //   horizontal: 15,
                // ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: yellow,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account? ',
                    ),
                    Text(
                      'Sign Up',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'or',
              ),
              SizedBox(height: 20.0),
              Text(
                'Sign Up With',
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: Icon(Icons.apple_outlined),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        signInWithGoogle();
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[200],
                      ),
                      child: Icon(
                        FontAwesome.google,
                        weight: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    if (userCredential.user != null) {
      await _saveUserDataToFirestore(userCredential.user!);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Account(),
        ),
      );
    }
  }

  Future<void> _saveUserDataToFirestore(User user) async {
    // Tạo một tài liệu mới trong Firestore với ID là UID của người dùng
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('user').doc(user.uid).get();
    String _itemUser = documentSnapshot.id;
    if (_itemUser.isEmpty) {
      final DocumentReference userDocRef =
          _firestore.collection('user').doc(user.uid);
      // Lưu thông tin người dùng vào tài liệu Firestore
      await userDocRef.set({
        'userID': user.uid,
        'username': user.displayName,
        'email': user.email,
        'photoURL': user.photoURL,
        // Thêm các trường khác mà bạn muốn lưu trữ
      });
    }
  }
}
