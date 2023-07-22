import 'dart:async';
import 'package:edu_app/questionsArray.dart';
import 'package:edu_app/resualt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'general.dart';

class Questions extends StatefulWidget {
  int level;

  Questions({
    required this.level,
  });

  @override
  State<StatefulWidget> createState() {
    return Code(level: this.level);
  }
}

int answer = 0;
Color colorOfalternativeTest = kRedFont;
int score = 0;
int number = 1;
double value = 1;

class Code extends State {
  int left = 9;
  int progress = 10;
  late Timer _timer;
  String image = '';
  String question = '';
  String choice1 = '';
  String choice2 = '';
  int level = 0;
  String choice3 = '';
  List<Color> colors = [];
  int count = 0;
  Code({
    required this.level,
  }) {
    if (level == 1) {
      count = 0;
      colorOfalternativeTest = kRedFont;
    }
    if (level == 2) {
      count = 10;
      colorOfalternativeTest = kBlueBg;
    }
    if (level == 3) {
      count = 20;
      colorOfalternativeTest = kL3;
    }
    if (level == 4) {
      count = 30;
      colorOfalternativeTest = kL3;
    }
    btn1color = defualtColor;
    btn2color = defualtColor;
    btn3color = defualtColor;
    image = imagesArray[count];
    choice1 = choice1Array[count];
    choice2 = choice2Array[count];
    choice3 = choice3Array[count];
    colors = colorsArrays[level - 1];
    question = questionsArrays[count];
    score = 0;
    number = 1;
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      value -= 0.1;
      progress--;

      if (value <= 0.0) {
        if (answersArray[count] == answer) {
          score++;
          answer = 0;
        }
        count++;
        number++;
        value = 1.0;
        progress = 10;
        if (count != 10 || count != 20 || count != 30 || count != 40) {
          image = imagesArray[count];
          choice1 = choice1Array[count];
          choice2 = choice2Array[count];
          choice3 = choice3Array[count];
          colors = colorsArrays[level - 1];
          question = questionsArrays[count];
          btn1color = defualtColor;
          btn2color = defualtColor;
          btn3color = defualtColor;
        }
        left--;
        if (count == 10 || count == 20 || count == 30 || count == 40) {
          _timer.cancel();

          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Resualt(
                        level: level + 1,
                      )));
        }
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter,
                  colors: colors),
            ),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 26),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OLB(
                          icon: Icons.close,
                          color: white,
                          function: () {
                            _timer.cancel();
                            Navigator.pop(context);
                          },
                          sizeOfIcon: 45,
                          shapBorder: const CircleBorder(),
                          colorOfBorder: white),
                      Stack(
                        children: [
                          Container(
                            width: 55,
                            height: 55,
                            child: CircularProgressIndicator(
                              strokeWidth: 6,
                              value: value,
                              color: Colors.white,
                              backgroundColor: const Color(0xff8abdf8),
                            ),
                          ),
                          SizedBox(
                              width: 55,
                              height: 55,
                              child: Center(
                                  child: Text(
                                '$progress',
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ))),
                        ],
                      ),
                      Container(
                        height: 42,
                        width: 75,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(width: 1, color: Colors.white)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(
                              Icons.favorite,
                              color: Colors.white,
                            ),
                            Text(
                              '$left',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Image(
                    fit: BoxFit.cover,
                    width: 250,
                    height: 250,
                    image: AssetImage(image)),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 40),
                  child: Row(
                    children: [
                      //
                      Text(
                        'question ${number} of 10',
                        style: const TextStyle(
                          fontSize: 23,
                          color: Color(0xffb6cef6),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 9),
                  child: Row(
                    children: [
                      Flexible(
                        child: Text(
                          maxLines: 3,
                          softWrap: true,
                          question,
                          style: const TextStyle(
                              color: Color(0xfffcfefc),
                              fontSize: 35,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 50,
                ),
                General().alternative(
                    colorOfalternative: colorOfalternativeTest,
                    context: context,
                    state: this,
                    textOf_first_alternative: choice1,
                    textOf_second_alternative: choice2,
                    textOf_thired_alternative: choice3)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
