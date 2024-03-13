import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:project_1/layout/booking.dart';

import '../screen/choosedate_modun.dart';
import '../screen/headline_2_component.dart';

class Choose_Date extends StatefulWidget {
  const Choose_Date({super.key});

  @override
  State<Choose_Date> createState() => _Choose_DateState();
}

class _Choose_DateState extends State<Choose_Date> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HeadLine2Component(
                StringA: 'Choose Date',
                StringB: '7 days of week',
              ),
              Container(
                width: size.width,
                height: 100,
                margin: EdgeInsets.symmetric(
                  vertical: 15,
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChooseDate_Modun(
                      StringA: 'Ngày',
                      StringB: 'Thứ',
                    );
                  },
                ),
              ),
              HeadLine2Component(
                StringA: 'Choose Time',
                StringB: '24 hours of day',
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Text(
                          'Standard',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        width: size.width,
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 10,
                          runSpacing: 10,
                          children: List.generate(5, (index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return Booking();
                                      },
                                    ),
                                  );
                                },
                                child: Text(
                                  '08:00 AM',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
