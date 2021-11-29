import 'package:final_app/calcontroller.dart';
import 'package:final_app/calmodel.dart';
import 'package:final_app/calmodelprovider.dart';
import 'package:final_app/calservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late String answer;
  late String answerTemp;
  late String inputFull;
  late String operator;
  late bool calculateMode;

  Services? service;
  CalHistoryController? controller;
  List<CalHistory> calhistory = List.empty();

  @override
  void initState() {
    answer = "0";
    operator = "";
    answerTemp = "";
    inputFull = "";
    calculateMode = false;
    super.initState();
  }

  // void addcalhistorys(String inputFull, String answer, String operator, String ans){
  //   controller!.addcalhistory(inputFull, answer, operator, ans);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.dehaze),
              Text('   Standard'),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/2');
                },
                icon: Icon(Icons.history)),
          ]),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            constraints: BoxConstraints.expand(height: 200),
            color: Color(0xffecf0f1),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.only(bottom: 15),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(inputFull + "" + operator,
                            style: TextStyle(fontSize: 18)),
                        Text(answer,
                            style: TextStyle(
                                fontSize: 48, fontWeight: FontWeight.bold))
                      ]),
                )),
          ),
          Container(
            height: 40,
            padding: EdgeInsets.only(bottom: 5),
            color: Colors.blueGrey[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('MC', style: TextStyle(fontSize: 18)),
                Text('MR', style: TextStyle(fontSize: 18)),
                Text('M+', style: TextStyle(fontSize: 18)),
                Text('M-', style: TextStyle(fontSize: 18)),
                Text('MS', style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
          NumPad(),
        ],
      ),
    );
  }

  Widget NumPad() {
    return Expanded(
      child: Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(children: <Widget>[
            SignButton("%", onTap: () {}),
            SignButton("CE", onTap: () {
              clearAnswer();
            }),
            SignButton("C", onTap: () {
              clearAll();
            }),
            SignButton("⌫", onTap: () {
              removeAnswer();
            }),
          ]),
          Row(children: <Widget>[
            SignButton("1/x", onTap: () {}),
            SignButton("x²", onTap: () {}),
            SignButton("2√x", onTap: () {}),
            SignButton("÷", onTap: () {
              addOperatorToAnswer("÷");
            }),
          ]),
          Row(children: <Widget>[
            NumberButton("7", onTap: () {
              addNumberToAnswer(7);
            }),
            NumberButton("8", onTap: () {
              addNumberToAnswer(8);
            }),
            NumberButton("9", onTap: () {
              addNumberToAnswer(9);
            }),
            SignButton("×", onTap: () {
              addOperatorToAnswer("×");
            }),
          ]),
          Row(children: [
            NumberButton("4", onTap: () {
              addNumberToAnswer(4);
            }),
            NumberButton("5", onTap: () {
              addNumberToAnswer(5);
            }),
            NumberButton("6", onTap: () {
              addNumberToAnswer(6);
            }),
            SignButton("-", onTap: () {
              addOperatorToAnswer("-");
            }),
          ]),
          Row(children: [
            NumberButton("1", onTap: () {
              addNumberToAnswer(1);
            }),
            NumberButton("2", onTap: () {
              addNumberToAnswer(2);
            }),
            NumberButton("3", onTap: () {
              addNumberToAnswer(3);
            }),
            SignButton("+", onTap: () {
              addOperatorToAnswer("+");
            }),
          ]),
          Row(children: [
            SignButton("+/-", onTap: () {
              toggleNegative();
            }),
            NumberButton("0", onTap: () {
              addNumberToAnswer(0);
            }),
            SignButton(".", onTap: () {
              addDotToAnswer();
            }),
            SignButton(
              "=",
              onTap: () {
                print(inputFull + "" + operator + answer);
                context.read<CalHistoryProvider>().InputFull = inputFull;
                context.read<CalHistoryProvider>().Operator = operator;
                context.read<CalHistoryProvider>().Answer = answer;
                calculate();
                print(answer);
                context.read<CalHistoryProvider>().Ans = answer;
              },
            ),
          ]),
        ],
      )),
    );
  }

  void addNumberToAnswer(int number) {
    setState(() {
      if (number == 0 && answer == "0") {
      } else if (number != 0 && answer == "0") {
        answer = number.toString();
      } else {
        answer += number.toString();
      }
    });
  }

  void addDotToAnswer() {
    setState(() {
      if (!answer.contains(".")) {
        answer = answer + ".";
      } else {}
    });
  }

  void removeAnswer() {
    if (answer == "0") {
    } else {
      setState(() {
        if (answer.length > 1) {
          answer = answer.substring(0, answer.length - 1);
        } else {
          answer = "0";
        }
      });
    }
  }

  void clearAll() {
    setState(() {
      answer = "0";
      inputFull = "";
      calculateMode = false;
      operator = "";
    });
  }

  void calculate() {
    setState(() {
      if (calculateMode) {
        bool decimalMode = false;
        double value = 0;
        if (answer.contains(".") || answerTemp.contains(".")) {
          decimalMode = true;
        }
        if (operator == "+") {
          value = (double.parse(answerTemp) + double.parse(answer));
        } else if (operator == "-") {
          value = (double.parse(answerTemp) - double.parse(answer));
        } else if (operator == "×") {
          value = (double.parse(answerTemp) * double.parse(answer));
        } else if (operator == "÷") {
          value = (double.parse(answerTemp) / double.parse(answer));
        }
        if (!decimalMode) {
          answer = value.toInt().toString();
        } else {
          answer = value.toString();
        }

        calculateMode = false;
        operator = "";
        answerTemp = "";
        inputFull = "";
      }
    });
  }

  void addOperatorToAnswer(String operate) {
    setState(() {
      if (answer != "0" && !calculateMode) {
        calculateMode = true;
        answerTemp = answer;
        inputFull += operator + answerTemp;
        operator = operate;
        answer = "0";
      } else if (calculateMode) {
        if (answer.isNotEmpty) {
          calculate();
          answerTemp = "";
          inputFull = "";
          operator = "";
        } else {
          operator = operate;
        }
      }
    });
  }

  void toggleNegative() {
    setState(() {
      if (answer.contains("-")) {
        answer = answer.replaceAll("-", "");
      } else {
        answer = "-" + answer;
      }
    });
  }

  void clearAnswer() {
    setState(() {
      answer = "0";
    });
  }

  Widget NumberButton(String numberbutton, {required Function() onTap}) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.all(1),
          child: Material(
              color: Colors.grey[350],
              child: InkWell(
                  onTap: onTap,
                  splashColor: Colors.grey[850],
                  child: Container(
                      height: 73,
                      width: 90,
                      child: Center(
                          child: Text(numberbutton,
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold))))))),
    );
  }

  Widget SignButton(String signbutton, {required Function() onTap}) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.all(1),
          child: Material(
              color: Colors.blueGrey[100],
              child: InkWell(
                  onTap: onTap,
                  splashColor: Colors.grey[850],
                  child: Container(
                      height: 73,
                      width: 90,
                      child: Center(
                          child: Text(signbutton,
                              style: TextStyle(
                                  fontSize: 26,
                                  fontStyle: FontStyle.normal))))))),
    );
  }
}
