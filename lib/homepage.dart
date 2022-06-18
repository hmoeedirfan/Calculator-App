// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, sort_child_properties_last, deprecated_member_use
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Function of creating buttons of calculator
  Widget CalcButton(String btntxt) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text(
          btntxt,
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: Theme.of(context).textTheme.button?.color,
            fontSize: 35,
          ),
        ),
        color: Theme.of(context).buttonColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
      ),
    );
  }

// This is zero button
  Widget ZeroButton(String btntxt) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text(
          btntxt,
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: Theme.of(context).textTheme.button?.color,
            fontSize: 35,
          ),
        ),
        color: Theme.of(context).buttonColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.fromLTRB(35.0, 20.0, 115.0, 20.0),
      ),
    );
  }

  // Function to write operators button
  Widget OprButton(String btntxt) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          calculation(btntxt);
        },
        child: Text(
          btntxt,
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: Colors.orange,
            fontSize: 35,
          ),
        ),
        color: Theme.of(context).buttonColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.all(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CalButton(),
    );
  }

  Container CalButton() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '$text',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 100,
                      color: Theme.of(context).textTheme.button?.color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton('AC'),
              CalcButton('+/-'),
              CalcButton('%'),
              OprButton('/'),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton('7'),
              CalcButton('8'),
              CalcButton('9'),
              OprButton('x'),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton('4'),
              CalcButton('5'),
              CalcButton('6'),
              OprButton('-'),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CalcButton('1'),
              CalcButton('2'),
              CalcButton('3'),
              OprButton('+'),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ZeroButton('0'),
              CalcButton('.'),
              OprButton('='),
            ],
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }

// Logic of Calculator
  dynamic text = 0;
  dynamic num1 = 0;
  dynamic num2 = 0;
  dynamic result = '';
  dynamic finalResult = '0';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(btnText) {
    if (btnText == 'AC') {
      text = 0;
      num1 = 0;
      num2 = 0;
      result = '';
      finalResult = '';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (num1 == 0) {
        num1 = double.parse(result);
      } else {
        num2 = double.parse(result);
      }
      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      result = num1 / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = '$result.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-$result';
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

// Function of Adding two numbers
  String add() {
    result = (num1 + num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }

// Function of Subtracting two numbers
  String sub() {
    result = (num1 - num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }

// Function of Multiplying two numbers
  String mul() {
    result = (num1 * num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }

// Function of Dividing two numbers
  String div() {
    result = (num1 / num2).toString();
    num1 = double.parse(result);
    return doesContainDecimal(result);
  }

// Function of Removing Decimal point
  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0)) {
        return result = splitDecimal[0].toString();
      }
    }
    return result;
  }
}
