import 'package:flutter/material.dart';

class Promotion_Notification_Modun extends StatelessWidget {
  const Promotion_Notification_Modun({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 150,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 186, 186, 186),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
          Container(
            height: 150,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                      left: 15,
                    ),
                    child: Text(
                      '08:32 AM - 05/03/2024',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 80, 80, 80)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 15),
                    child: Text(
                      'YOU HAVE A GIFT FROM CINEONE',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                      left: 15,
                      right: 15,
                    ),
                    child: Text(
                      'asdfasdflasdfaslkdjflaafsdfasdfasdfasdfasflasdfaslkddfasdflasdfaslkdjflaafsdfasdfasdfasdfasflasdfaslkdjflaafsdfasdfasdfasdfasdfasdfasdfjflaafsdfasdfasdfasdfasdfasdfasdfasddfasflasdfaslkdjflaafsdfasdfasdfasdfasdfasdfasdfasddfasdfasdfasdf',
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
