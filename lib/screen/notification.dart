import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:gap/gap.dart';
import '../style/style.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
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
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //Notification-Item
            Container(
              padding: const EdgeInsets.all(16),
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border: GradientBoxBorder(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [pink.withOpacity(0.6), yellow.withOpacity(0.6)]),
                  width: 1.5,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: yellow,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Notice of payment',
                    style: TextStyle(fontSize: 20, fontWeight: bold),
                  ),
                  Gap(8),
                  Text(
                    'You have 1 new ticket',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: light,
                        color: white.withOpacity(0.5)),
                  ),
                  Gap(16),
                  Text(
                    '1200 USD - TAROT',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: semibold,
                        color: white.withOpacity(0.7)),
                  ),
                  Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '04/10/2024 - 08:30 AM',
                        style: TextStyle(
                          color: yellow.withOpacity(0.5),
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Gap(16),

            //Notification-Item
            Container(
              padding: const EdgeInsets.all(16),
              width: size.width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: white.withOpacity(0.3),
                    width: 1.5,
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: white.withOpacity(0.3),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Announcement',
                    style: TextStyle(fontSize: 20, fontWeight: bold),
                  ),
                  Gap(8),
                  Text(
                    'You have 2 discounts valid until next month',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: light,
                        color: white.withOpacity(0.5)),
                  ),
                  Gap(16),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: semibold,
                        color: white.withOpacity(0.7)),
                  ),
                  Gap(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '03/10/2024 - 09:43 AM',
                        style: TextStyle(
                          color: white.withOpacity(0.5),
                          fontSize: 12,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Gap(16),

            //Notification-Item
            //Notification-Item
          ],
        ),
      ),
    );
  }
}
