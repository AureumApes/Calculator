import 'dart:math';

import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<HomePage> {
  var curr = "";
  var ans = "";
  Map<int, String> history = { };
  var latestHistory = 0;

  append(String char) {
    setState(() {
      curr += char;
    });
  }

  zero() {
    append("0");
  }

  one() {
    append("1");
  }

  two() {
    append("2");
  }

  three() {
    append("3");
  }

  four() {
    append("4");
  }

  five() {
    append("5");
  }

  six() {
    append("6");
  }

  seven() {
    append("7");
  }

  eight() {
    append("8");
  }

  nine() {
    append("9");
  }

  add() {
    append("+");
  }

  sub() {
    append("-");
  }

  div() {
    append("/");
  }

  mult() {
    append("*");
  }

  clear() {
    setState(() {
      ans = curr;
      curr = "";
    });
  }

  del() {
    setState(() {
      curr = curr.substring(0, curr.length - 1);
    });
  }

  dot() {
    append(".");
  }

  addAns() {
    append("Ans");
  }

  calculate(String input) {
    setState(() {
      history[latestHistory] = input;
      num result =
          const ExpressionEvaluator().eval(Expression.parse(input), {}) as num;
      curr = result.toString();
    });
  }

  calc() {
    calculate(curr.replaceAll("Ans", ans));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
          ),
          Text(
            curr,
            style: const TextStyle(fontSize: 30),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  onPressed: seven,
                  child: const Text("7"),
                  color: Colors.blueAccent
              ),
              MaterialButton(
                  onPressed: eight,
                  child: const Text("8"),
                  color: Colors.blueAccent
              ),
              MaterialButton(
                  onPressed: nine,
                  child: const Text("9"),
                  color: Colors.blueAccent
              ),
              MaterialButton(
                  onPressed: add,
                  child: const Text("+"),
                  color: Colors.blueAccent
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  onPressed: four,
                  child: const Text("4"),
                  color: Colors.blueAccent
              ),
              MaterialButton(
                  onPressed: five,
                  child: const Text("5"),
                  color: Colors.blueAccent
              ),
              MaterialButton(
                  onPressed: six,
                  child: const Text("6"),
                  color: Colors.blueAccent
              ),
              MaterialButton(
                  onPressed: sub,
                  child: const Text("-"),
                  color: Colors.blueAccent
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  onPressed: one,
                  child: const Text("1"),
                  color: Colors.blueAccent
              ),
              MaterialButton(
                  onPressed: two,
                  child: const Text("2"),
                  color: Colors.blueAccent
              ),
              MaterialButton(
                  onPressed: three,
                  child: const Text("3"),
                  color: Colors.blueAccent
              ),
              MaterialButton(
                  onPressed: mult,
                  child: const Text("×"),
                  color: Colors.blueAccent
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                  onPressed: zero,
                  child: const Text("0"),
                  color: Colors.blueAccent
              ),
              MaterialButton(
                  onPressed: dot,
                  child: const Text("."),
                  color: Colors.blueAccent
              ),
              MaterialButton(
                  onPressed: del,
                  child: const Text("DEL"),
                  color: Colors.red
              ),
              MaterialButton(
                  onPressed: clear,
                  child: const Text("AC"),
                  color: Colors.red
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: addAns,
                child: const Text("Ans"),
                color: Colors.blueAccent,
              ),
              MaterialButton(
                onPressed: calc,
                child: const Text("="),
                color: Colors.blueAccent,
              )
            ],
          )
        ],
      ),
    );
  }
}
