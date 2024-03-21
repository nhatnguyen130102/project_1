import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:gap/gap.dart';
import 'package:project_1/screen/booking.dart';
import 'package:selection_menu/selection_menu.dart';
import 'package:selection_menu/components_configurations.dart';
import '../component_widget/choosedate_modun.dart';
import '../component_widget/headline_2_component.dart';
import '../model/login_model.dart';

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
              //Choose-Date-------------------------------------
              HeadLine2Component(
                StringA: 'Choose Date',
                StringB: '7 days of week',
              ),
              Container(
                width: size.width,
                height: 100,
                margin: EdgeInsets.only(top: 20, bottom: 25),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ChooseDate_Modun(
                      StringA: '12',
                      StringB: 'MON',
                    );
                  },
                ),
              ),

              //Choose-Time-------------------------------------
              HeadLine2Component(
                StringA: 'Choose Time',
                StringB: '24 hours of day',
              ),
              ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Gap(20),

                      //Cinema: Time & Info--------------------------------------
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //Cinema & Address-------------
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'CGV Hoang Van Thu',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Gap(2),
                              Row(
                                children: [
                                  Text(
                                    'Tan Binh District',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                  Gap(10),
                                  Icon(
                                    FontAwesome.circle,
                                    size: 4,
                                    color: Colors.grey[400],
                                  ),
                                  Gap(5),
                                  Text(
                                    '1.8 km',
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          //Favorite-Icon
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              FontAwesome.heart_empty,
                              size: 20,
                              color: Colors.grey[600],
                            ),
                          )
                        ],
                      ),

                      Gap(15),
                      Text(
                        'Floor 1st & 2nd, Gala Center, 415 Hoang Van Thu',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade500,
                        ),
                      ),
                      Gap(10),

                      //Screening---------------------------------
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: size.width,
                        child: Wrap(
                          direction: Axis.horizontal,
                          spacing: 15,
                          runSpacing: 15,
                          children: List.generate(6, (index) {
                            return Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10),
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

                                //Screening-Item---------------
                                child: Row(
                                  mainAxisSize: MainAxisSize.min, //wrap-content
                                  children: [
                                    Text(
                                      '08:00',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Gap(5),
                                    Text(
                                      '~ 10:00',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey.shade500,
                                      ),
                                    )
                                  ],
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
