import 'package:flutter/material.dart';

class Headline_1 extends StatelessWidget {
  final StringA;
  const Headline_1({
    this.StringA,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            StringA,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Text(
              'See All',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 53, 53, 53),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
