import 'package:calculator_app/components/cust_button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent.withOpacity(0.3)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(userInput.toString(),
                                style: const TextStyle(
                                    fontSize: 25, color: Colors.blueGrey)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(answer.toString(),
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.blueGrey)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Row(
                    children: [
                      MyButton(
                        title: 'AC',
                        onPress: () {
                          userInput = '';
                          answer = '';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '+/-',
                        onPress: () {
                          userInput += '+/-';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '%',
                        onPress: () {
                          userInput += '%';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '/',
                        onPress: () {
                          userInput += '/';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '7',
                        onPress: () {
                          userInput += '7';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '8',
                        onPress: () {
                          userInput += '8';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '9',
                        onPress: () {
                          userInput += '9';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: 'x',
                        onPress: () {
                          userInput += 'x';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '4',
                        onPress: () {
                          userInput += '4';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '5',
                        onPress: () {
                          userInput += '5';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '6',
                        onPress: () {
                          userInput += '6';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '-',
                        onPress: () {
                          userInput += '-';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '1',
                        onPress: () {
                          userInput += '1';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '2',
                        onPress: () {
                          userInput += '2';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '3',
                        onPress: () {
                          userInput += '3';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '+',
                        onPress: () {
                          userInput += '+';
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      MyButton(
                        title: '0',
                        onPress: () {
                          userInput += '0';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '.',
                        onPress: () {
                          userInput += '.';
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: 'DEL',
                        onPress: () {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                          setState(() {});
                        },
                      ),
                      MyButton(
                        title: '=',
                        color: Colors.pinkAccent.withOpacity(0.3),
                        onPress: () {
                          equalPress();
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser parser = Parser();
    Expression expression = parser.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double evaluate = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = evaluate.toString();
  }
}
