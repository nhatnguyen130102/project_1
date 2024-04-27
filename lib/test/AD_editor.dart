import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:heroicons/heroicons.dart';

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
          icon: HeroIcon(
            HeroIcons.chevronLeft,
          ),
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
            //HEADING 1
            Text('Heading', style: TextStyle(fontSize: 18, fontWeight: medium),),
            Gap(16),
            //BODY 1
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
            Gap(32),

            //HEADING 2
            Text('Heading', style: TextStyle(fontSize: 18, fontWeight: medium),),
            Gap(16),
            //BODY 2
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: size.width / 2 + 16,
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
                    Gap(8),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: yellow.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: HeroIcon(HeroIcons.plus, color: yellow,),
                    ),
                    Gap(8),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: pink.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: HeroIcon(HeroIcons.arrowUp, color: pink,),
                    ),
                  ],
                ),
              ],
            ),
            Gap(24),
            
            //SAVE BUTTON
            Container(
              width: size.width,
              padding: EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: yellow,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text('SAVE', style: TextStyle(fontSize: 16, color: black, fontWeight: bold), textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}
