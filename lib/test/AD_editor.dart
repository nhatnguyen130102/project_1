import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../style/style.dart';

class EditorPage extends StatefulWidget {
  const EditorPage({super.key});

  @override
  State<EditorPage> createState() => _EditorPageState();
}

class _EditorPageState extends State<EditorPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        foregroundColor: white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // title: Text('Name movie ${widget.number}'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: size.width / 2 - 24,
                  margin: EdgeInsets.only(right: 8),
                  child: TextFormField(
                    //controller: ..,
                    style: TextStyle(color: white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: white.withOpacity(0.6), fontWeight: light),
                      filled: true,
                      fillColor: white.withOpacity(0.1),
                      prefixIconColor: white,
                    ),
                  ),
                ),
                Container(
                  width: size.width / 2 - 24,
                  child: TextFormField(
                    //controller: ..,
                    style: TextStyle(color: white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: white.withOpacity(0.6), fontWeight: light),
                      filled: true,
                      fillColor: white.withOpacity(0.1),
                      prefixIconColor: white,
                    ),
                  ),
                ),
              ],
            ),
            Gap(8),
            Container(
              width: size.width,
              child: TextFormField(
                //controller: ..,
                style: TextStyle(color: white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                      color: white.withOpacity(0.6), fontWeight: light),
                  filled: true,
                  fillColor: white.withOpacity(0.1),
                  prefixIconColor: white,
                ),
              ),
            ),
            Gap(8),
            Row(
              children: [
                Container(
                  width: size.width / 2 - 24,
                  margin: EdgeInsets.only(right: 8),
                  child: TextFormField(
                    //controller: ..,
                    style: TextStyle(color: white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: white.withOpacity(0.6), fontWeight: light),
                      filled: true,
                      fillColor: white.withOpacity(0.1),
                      prefixIconColor: white,
                    ),
                  ),
                ),
                Container(
                  width: size.width / 2 - 24,
                  child: TextFormField(
                    //controller: ..,
                    style: TextStyle(color: white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: white.withOpacity(0.6), fontWeight: light),
                      filled: true,
                      fillColor: white.withOpacity(0.1),
                      prefixIconColor: white,
                    ),
                  ),
                ),
              ],
            ),
            Gap(16),
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: yellow,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text('SAVE', style: TextStyle(color: black), textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}
