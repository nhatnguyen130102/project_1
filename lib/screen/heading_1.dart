import 'package:flutter/material.dart';

class HeadlineComponent extends StatelessWidget {
  final StringA;
  const HeadlineComponent({
    this.StringA,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 10),
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
            child: Text(
              'See All',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
