import 'package:calculater_bd/colors_code.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String equation = "0";
  String result = "0";
  String expression = "";

  void buttonPresed(String buttontext) {
    setState(() {
      if (buttontext == "C") {
        equation = "0";
        result = "0";
      } else if (buttontext == "⌫") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttontext == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
        expression = expression.replaceAll('%', '/100');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        if (equation == "0") {
          equation = buttontext;
        } else {
          equation = equation + buttontext;
        }
      }
    });
  }

  @override
  Widget buildbutton(
      {required String buttontext,
      required Color buttoncolor,
      required Color textcolor}) {
    final screenhight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: screenhight * 0.09,
        child: FlatButton(
            onPressed: () => buttonPresed(buttontext),
            color: buttoncolor,
            child: Text(
              buttontext,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textcolor,
                fontSize: 30,
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Calculater".toUpperCase(),
          style: const TextStyle(fontSize: 30, color: buttonColor2),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Text(
                equation,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                child: Text(
              result,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )),
            Table(
              children: [
                TableRow(children: [
                  buildbutton(
                    buttoncolor: buttonColor2.withOpacity(0.3),
                    textcolor: buttonColor2,
                    buttontext: "C",
                  ),
                  buildbutton(
                    buttoncolor: buttonColor2.withOpacity(0.3),
                    textcolor: buttonColor2,
                    buttontext: "⌫",
                  ),
                  buildbutton(
                    buttoncolor: buttonColor2.withOpacity(0.3),
                    textcolor: buttonColor2,
                    buttontext: "%",
                  ),
                  buildbutton(
                    buttoncolor: buttonColor2.withOpacity(0.3),
                    textcolor: buttonColor2,
                    buttontext: "÷",
                  )
                ]),
                TableRow(children: [
                  buildbutton(
                    buttoncolor: buttonColor,
                    textcolor: TextColor,
                    buttontext: "7",
                  ),
                  buildbutton(
                    buttoncolor: buttonColor,
                    textcolor: TextColor,
                    buttontext: "8",
                  ),
                  buildbutton(
                      buttoncolor: buttonColor,
                      textcolor: TextColor,
                      buttontext: "9"),
                  buildbutton(
                    buttoncolor: buttonColor2.withOpacity(0.3),
                    textcolor: buttonColor2,
                    buttontext: "×",
                  )
                ]),
                TableRow(children: [
                  buildbutton(
                    buttoncolor: buttonColor,
                    textcolor: TextColor,
                    buttontext: "4",
                  ),
                  buildbutton(
                    buttoncolor: buttonColor,
                    textcolor: TextColor,
                    buttontext: "5",
                  ),
                  buildbutton(
                      buttoncolor: buttonColor,
                      textcolor: TextColor,
                      buttontext: "6"),
                  buildbutton(
                    buttoncolor: buttonColor2.withOpacity(0.3),
                    textcolor: buttonColor2,
                    buttontext: "+",
                  )
                ]),
                TableRow(children: [
                  buildbutton(
                    buttoncolor: buttonColor,
                    textcolor: TextColor,
                    buttontext: "1",
                  ),
                  buildbutton(
                    buttoncolor: buttonColor,
                    textcolor: TextColor,
                    buttontext: "2",
                  ),
                  buildbutton(
                      buttoncolor: buttonColor,
                      textcolor: TextColor,
                      buttontext: "3"),
                  buildbutton(
                    buttoncolor: buttonColor2.withOpacity(0.3),
                    textcolor: buttonColor2,
                    buttontext: "-",
                  )
                ]),
                TableRow(children: [
                  buildbutton(
                    buttoncolor: buttonColor,
                    textcolor: TextColor,
                    buttontext: "0",
                  ),
                  buildbutton(
                    buttoncolor: buttonColor,
                    textcolor: TextColor,
                    buttontext: ".",
                  ),
                  buildbutton(
                      buttoncolor: buttonColor,
                      textcolor: TextColor,
                      buttontext: "00"),
                  buildbutton(
                    buttoncolor: buttonColor2.withOpacity(0.5),
                    textcolor: buttonColor2,
                    buttontext: "=",
                  )
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
