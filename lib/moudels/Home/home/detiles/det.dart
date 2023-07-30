import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../shared/components/componenets.dart';

class detailsScrean extends StatefulWidget {
  const detailsScrean({super.key});

  @override
  State<detailsScrean> createState() => _detailsScreanState();
}

class _detailsScreanState extends State<detailsScrean> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/images/my.jpg'),
                ),
              ),
            ),
            Text(
              'Ahmed Shaban',
              style: TextStyle(
                  shadows: [Shadow(color: Colors.amber, offset: Offset(2, 1))],
                  color: Colors.grey,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            line(context),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Ago',
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                    ),
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 30,
                      child: Text(
                        '15',
                        style: TextStyle(
                            color: Colors.amber,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    )
                  ],
                ),
              ),
            ),
            line(context),
            Title(
                color: Colors.amber,
                child: Text(
                  'Accounts',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.amber),
                )),
            line3(context),
            line3(context),
            SizeBox(context),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.amber,
              ),
              child: MaterialButton(
                onPressed: () => launch(faceBook),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Image(image: AssetImage(faceBookIcon)),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        '   Facebook ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            line(context),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.amber,
              ),
              child: MaterialButton(
                onPressed: () => launch(instagram),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Image(image: AssetImage(instagramIcon)),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        '   instagram ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            line(context),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.amber,
              ),
              child: MaterialButton(
                onPressed: () => launch(gitHub),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Image(image: AssetImage(gitHubIcon)),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        '   Github ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            line(context),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.amber,
              ),
              child: MaterialButton(
                onPressed: () => launch(linkedin),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Image(image: AssetImage(LinkedInIcon)),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        '   Linkedin ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            line(context),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.amber,
              ),
              child: MaterialButton(
                onPressed: () => launch(WhatApp),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Image(image: AssetImage(WhatsAppIcon)),
                      SizedBox(
                        width: 40,
                      ),
                      Text(
                        '   WhatsApp ',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
