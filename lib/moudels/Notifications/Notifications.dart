import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/components/componenets.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/styles.dart';

class NotificationsScrean extends StatefulWidget {
  const NotificationsScrean({super.key, required this.payload});
  final String payload;

  @override
  State<NotificationsScrean> createState() => _NotificationsScreanState();
}

class _NotificationsScreanState extends State<NotificationsScrean> {
  String _payload = '';

  @override
  void initState() {
    super.initState();

    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: primaryClr,
          ),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text(
          _payload.toString().split('|')[0],
          style: TextStyle(
            color: Get.isDarkMode ? Colors.white : darkGreyClr,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        ),
        titleSpacing: 20,
        toolbarHeight: 100,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Hello, Hassan',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : darkGreyClr,
                        fontSize: 26,
                        fontWeight: FontWeight.w900),
                  ),
                  bSize,
                  Text(
                    'You, have a new reminder ',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                    color: primaryClr, borderRadius: BorderRadius.circular(30)),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, bottom: 20, left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.text_format,
                              color: Colors.white,
                              size: 35,
                            ),
                            CSize,
                            Text(
                              'Title',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.justify,
                            )
                          ],
                        ),
                        bSize1,
                        Text(
                          _payload.toString().split('|')[0],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                        ),
                        bSize1,
                        Row(
                          children: [
                            const Icon(
                              Icons.description,
                              color: Colors.white,
                              size: 35,
                            ),
                            CSize,
                            Text('Description',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ))
                          ],
                        ),
                        bSize1,
                        Text(
                          _payload.toString().split('|')[1],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        bSize1,
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.white,
                              size: 35,
                            ),
                            CSize,
                            Text('Date',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ))
                          ],
                        ),
                        bSize1,
                        Text(
                          _payload.toString().split('|')[2],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
