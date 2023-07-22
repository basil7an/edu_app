import 'package:edu_app/questions.dart';
import 'package:edu_app/waitepage.dart';
import 'package:flutter/material.dart';

import 'general.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeP();
  }
}

class HomeP extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 15),
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 1, color: kGreyFont)),
                            child: const Icon(
                              color: kBlueIcon,
                              Icons.favorite,
                              size: 25,
                            )),
                        Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(width: 1, color: kGreyFont)),
                            child: const Icon(
                              color: kBlueIcon,
                              Icons.person,
                              size: 28,
                            )),
                      ],
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Let\'s Play',
                        style: TextStyle(
                            color: kRedFont,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Be the first!',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: kGreyFont,
                            fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(height: 26),
                  Column(
                    children: [
                      Levels(
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WitePage(
                                      page: Questions(level: 1),
                                      // colorOfalternativeTest: kBlueBg,
                                      title1: 'level 1',
                                      title2: 'Travel Newbie',
                                      image: 'assets/images/baggs.png',
                                      descrbtion:
                                          'do you fell confident ? here you\'ll challenge on of our most difficult travel question',
                                      gradient: [kRedFont, kL12],
                                    )),
                          );
                        },
                        colors: [kRedFont, kL12],
                        icon: Icons.favorite,
                        ImageLoc: 'assets/images/bags.png',
                        subtitle: 'Level 1',
                        maintitle: 'Travel Newbie',
                        context: context,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Levels(
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WitePage(
                                  page: Questions(level: 2),
                                  gradient: [kBlueBg, kL2],
                                  image: 'assets/images/ballon-b.png',
                                  title1: 'level 2',
                                  title2: 'Continuing',
                                  // colorOfalternativeTest: kBlueBg,
                                  descrbtion:
                                      'do you fell confident ? here you\'ll challenge on of our most difficult travel question',
                                );
                              },
                            ),
                          );
                        },
                        icon: Icons.play_arrow,
                        colors: [kBlueBg, kL22],
                        ImageLoc: 'assets/images/ballon-s.png',
                        subtitle: 'Level 2',
                        maintitle: 'Continuing',
                        context: context,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Levels(
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WitePage(
                                  page: Questions(level: 3),
                                  gradient: [kL3, kL32],
                                  image: 'assets/images/camera.png',
                                  title1: 'level 3',
                                  title2: 'Experinced',
                                  // colorOfalternativeTest: kBlueBg,
                                  descrbtion:
                                      'do you fell confident ? here you\'ll challenge on of our most difficult travel question',
                                );
                              },
                            ),
                          );
                        },
                        icon: Icons.lock,
                        colors: [kL3, kL32],
                        ImageLoc: 'assets/images/camera.png',
                        subtitle: 'Level 3  ',
                        maintitle: 'Experinced',
                        context: context,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Levels(
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return WitePage(
                                  page: Questions(level: 4),
                                  gradient: [
                                    Colors.deepPurple,
                                    Colors.indigoAccent
                                  ],
                                  image: 'assets/images/gaza-b.png',
                                  title1: 'level 4',
                                  title2: 'Visit Gaza',
                                  descrbtion:
                                      'do you fell confident ? here you\'ll challenge on of our most difficult travel question',
                                );
                              },
                            ),
                          );
                        },
                        icon: Icons.lock,
                        colors: [Colors.deepPurple, Colors.indigoAccent],
                        ImageLoc: 'assets/images/gaza-s.png',
                        subtitle: 'Level 4',
                        maintitle: 'Visit Gaza',
                        context: context,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
