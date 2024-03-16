import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class demo extends StatefulWidget {
  const demo({super.key});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  late DatabaseReference dbRef;
  @override
  void initState() {
    dbRef = FirebaseDatabase.instance.ref().child("user");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("okokokk"),
      ),
      floatingActionButton: TextButton(
        child: Text("gui"),
        onPressed: () {
          dbRef.push().set("Hellooo");
        },
      ),
    );
  }
}
