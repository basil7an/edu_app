import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:edu_app/questions.dart';

import 'general.dart';

class Resualt extends StatefulWidget {
  int level;
  Resualt({required this.level});
  @override
  State<StatefulWidget> createState() {
    return resualt(level: this.level);
  }
}

class resualt extends State {
  int level = 0;
  resualt({required this.level});
  @override
  Widget build(BuildContext context) {
    double width = 0;
    width = MediaQuery.of(context).size.width;
    double height = 0;

    height = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          Container(
            width: width,
            decoration: const BoxDecoration(
              color: Color(0xff422972),
            ),
            height: 300,
            child: Center(
              child: Text(
                'your score',
                style: TextStyle(
                  fontSize: 42,
                  color: white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 38, left: 18),
              child: OLB(
                color: white,
                colorOfBorder: white,
                icon: Icons.close,
                function: () {
                  Navigator.pop(context);
                },
                sizeOfIcon: 45,
                shapBorder: CircleBorder(),
              )
              //
              ),
          Container(
            margin: const EdgeInsets.only(top: 220),
            width: width,
            height: 900,
            decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(60))),
            child: Center(
                child: Text(
              '$score / 10',
              style: TextStyle(
                  color: Color(0xff422972),
                  fontWeight: FontWeight.bold,
                  fontSize: 100),
            )),
          ),
          Padding(
            padding: EdgeInsets.only(top: height - 120, left: width - 280),
            child: Container(
              width: 280,
              height: 120,
              decoration: const BoxDecoration(
                  color: Color(
                    0xff422972,
                  ),
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
              child: TextButton(
                child: Text(
                  'Next Level',
                  style: TextStyle(
                      fontSize: 40, color: white, fontWeight: FontWeight.w600),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Questions(
                                level: level,
                              )));
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
