import 'package:edu_app/questionsArray.dart';
import 'package:flutter/material.dart';
import 'package:edu_app/questions.dart';

Gradient defualtColor = LinearGradient(colors: [Colors.white, Colors.white]);
Gradient onpressedColor =
    LinearGradient(colors: [Color(0xfff1d601), Color(0xffb3ba08)]);
Gradient btn1color = defualtColor;
Gradient btn2color = defualtColor;
Gradient btn3color = defualtColor;
const kBlueIcon = Color(0xff0bbbfe);
const kRedFont = Color(0xfff45e7a);
const kGreyFont = Color(0xffb7adac);
const kL1 = Color(0xffed6f9f);
final Color white = Colors.white;
const kL12 = Color(0xffec8c6a);
const kL2 = Color(0xff5471ec);
const kL22 = Color(0xff0bbbfe);
const kL3 = Color(0xffa28dd0);
const kL32 = Color(0xfff4bee7);
const kBlueBg = Color(0xff3293f4);
const kG1 = Color(0xffb5bd05);
const softwite = Color(0xffb7d3fb);
const kFontFamily = 'Sf-Pro-Text';

class General {
  Color colorOfalternativeTest = kBlueBg;

  Column alternative({
    required Color colorOfalternative,
    required BuildContext context,
    required State state,
    required String textOf_first_alternative,
    required String textOf_second_alternative,
    required String textOf_thired_alternative,
  }) {
    colorOfalternativeTest = colorOfalternative;

    return Column(
      children: [
        rows(context, state, textOf_first_alternative, 1),
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        rows(context, state, textOf_second_alternative, 2),
        SizedBox(height: MediaQuery.of(context).size.height / 50),
        rows(context, state, textOf_thired_alternative, 3)
      ],
    );
  }

  Container rows(BuildContext context, State state, String text, int numOfMe) {
    Gradient? gradient;
    switch (numOfMe) {
      case 1:
        {
          return Container(
            height: MediaQuery.of(context).size.height / 13,
            width: MediaQuery.of(context).size.width - 55,
            decoration: BoxDecoration(
                gradient: btn1color, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
                onPressed: () {
                  state.setState(() {
                    btn1color = onpressedColor;
                    btn2color = defualtColor;
                    btn3color = defualtColor;
                    answer = 1;
                    value = 0;
                  });
                },
                child: Text(
                  '$text',
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w500,
                      color: colorOfalternativeTest),
                )),
          );
        }
      case 2:
        return Container(
          height: MediaQuery.of(context).size.height / 13,
          width: MediaQuery.of(context).size.width - 55,
          decoration: BoxDecoration(
              gradient: btn2color, borderRadius: BorderRadius.circular(20)),
          child: TextButton(
              onPressed: () {
                state.setState(() {
                  btn2color = onpressedColor;
                  btn1color = defualtColor;
                  btn3color = defualtColor;
                  answer = 2;
                  value = 0;
                });
              },
              child: Text(
                '$text',
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                    color: colorOfalternativeTest),
              )),
        );
      default:
        return Container(
          height: MediaQuery.of(context).size.height / 13,
          width: MediaQuery.of(context).size.width - 55,
          decoration: BoxDecoration(
              gradient: btn3color, borderRadius: BorderRadius.circular(20)),
          child: TextButton(
              onPressed: () {
                state.setState(() {
                  btn3color = onpressedColor;
                  btn2color = defualtColor;
                  btn1color = defualtColor;
                  answer = 3;
                  value = 0;
                });
              },
              child: Text(
                '$text',
                style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                    color: colorOfalternativeTest),
              )),
        );
    }
  }
}

class OLB extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double sizeOfIcon;
  final OutlinedBorder shapBorder;
  final Function() function;
  final Color colorOfBorder;
  OLB({
    required this.icon,
    required this.color,
    required this.function(),
    required this.sizeOfIcon,
    required this.shapBorder,
    required this.colorOfBorder,
  });
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ButtonStyle().copyWith(
            padding: const MaterialStatePropertyAll(EdgeInsets.all(8)),
            side: MaterialStatePropertyAll(
                BorderSide(color: colorOfBorder, width: 1)),
            shape: MaterialStatePropertyAll(
              shapBorder,
            )),
        onPressed: () {
          function();
        },
        child: Icon(
          icon,
          size: sizeOfIcon,
          color: color,
        ));
  }
}

class Levels extends StatelessWidget {
  final BuildContext context;
  final List<Color> colors;
  final String ImageLoc;
  final String subtitle;
  final String maintitle;
  final IconData icon;
  final Function() function;
  Levels(
      {required this.maintitle,
      required this.icon,
      required this.subtitle,
      required this.function,
      required this.ImageLoc,
      required this.colors,
      required this.context});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            margin: EdgeInsets.only(top: 48),
            width: double.infinity,
            padding: EdgeInsets.all(24),
            height: MediaQuery.of(context).size.height / 4.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: colors)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 44,
                  width: 44,
                  child: OLB(
                    color: Colors.white,
                    colorOfBorder: (Colors.white),
                    icon: icon,
                    shapBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    sizeOfIcon: 25,
                    function: () {},
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 27,
                ),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 18, color: Color(0xfffad9e6)),
                ),
                Text(
                  maintitle,
                  style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(right: 40),
              child: Image(image: AssetImage(ImageLoc)))
        ],
      ),
    );
  }
}
