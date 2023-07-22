import 'package:edu_app/questions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'general.dart';

class WitePage extends StatelessWidget {
  final List<Color> gradient;
  // Color colorOfalternativeTest = kBlueBg;
  final String image;
  final String title1;
  final String title2;
  final String descrbtion;
  final Widget page;
  WitePage(
      {required this.gradient,
      // required this.colorOfalternativeTest,
      required this.page,
      required this.image,
      required this.title1,
      required this.title2,
      required this.descrbtion});
  @override
  Widget build(BuildContext context) {
    final double height = (MediaQuery.of(context).size.height);
    final double width = (MediaQuery.of(context).size.width);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(top: 26),
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 30,
                    ),
                    Center(
                        child: Container(
                            width: 350,
                            height: 350,
                            child: Image(image: AssetImage(image)))),
                    Text(
                      title1,
                      style: TextStyle(
                        color: softwite,
                        fontSize: 21,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      title2,
                      style: TextStyle(
                        color: white,
                        fontSize: 34,
                      ),
                    ),
                    SizedBox(height: height / 44),
                    Text(
                      descrbtion,
                      style: TextStyle(
                        color: white,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: height / 10),
                    Center(
                      child: Container(
                        width: width - 60,
                        height: height / 13,
                        decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => page));
                            },
                            child: Text(
                              'Play',
                              style: TextStyle(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w500,
                                  color: gradient[0]),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
