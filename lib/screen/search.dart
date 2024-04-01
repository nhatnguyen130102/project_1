import 'package:flutter/material.dart';
import 'package:project_1/component_widget/search_modun.dart';
import 'package:project_1/style/style.dart';

class Search_Page extends StatefulWidget {
  const Search_Page({super.key});

  @override
  State<Search_Page> createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
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
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 0),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: TextField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Search',
                        hintStyle:
                            TextStyle(color: Colors.grey[600], fontSize: 18),
                        prefixIcon: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          child: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 15,
                left: 15,
              ),
              child: Text(
                'ALL ( 230 results )',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Search_Modun(size: size),
            Search_Modun(size: size),
            Search_Modun(size: size),
            Search_Modun(size: size),
          ],
        ),
      ),
    );
  }
}
