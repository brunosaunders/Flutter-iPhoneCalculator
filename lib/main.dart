import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}

switchNumberToEN(String number) {
  var listWords;
  for (var i=0; i<number.length; i++){
    if (number[i] == ".") {
      continue;
    } else if (number[i] == ",") {
      listWords = listWords + ".";
    } else {
      listWords = listWords == null ? number[i] : listWords + number[i];
    }
  }

  return listWords;
}

String doubleToString(double number){
  var stringNumber = number.toStringAsFixed(2);
  var stringNumber2;
  var listWords;
  var decimals;

  if (number >= 1000000){
    var integerDigits = number.toInt().toString().length;
    for (var i=0; i<stringNumber.length; i++){
      if (i == (integerDigits)-6 ||i == (integerDigits)-3) {
        stringNumber2 = stringNumber2 + "," + stringNumber[i];
        continue;
      }
      stringNumber2 = stringNumber2 == null ? stringNumber[i] : stringNumber2 + stringNumber[i];
    }
  } else if (number >= 1000) {
    var integerDigits = number.toInt().toString().length;
    for (var i=0; i<stringNumber.length; i++) {
      if (i == (integerDigits)-3) {
        stringNumber2 = stringNumber2 + "," + stringNumber[i];
        continue;
      }
      stringNumber2 = stringNumber2 == null ? stringNumber[i] : stringNumber2 + stringNumber[i];
    }
  } else stringNumber2 = stringNumber;

  decimals = dropDots(stringNumber2);
  listWords = switchDotsToCommas(decimals);

  return listWords;
}

switchDotsToCommas(String decimals) {
  var listWords;
  for (var i=0; i<decimals.length; i++){
    if (decimals[i] == ".") {
      listWords = listWords + ",";
    } else if (decimals[i] == ","){
      listWords = listWords + ".";
    } else {
      listWords = listWords == null ? decimals[i] : listWords + decimals[i];
    }
  }
  return listWords;
}

dropDots(String name) {
  var decimals;
  for (var i=(name.length - 1); i>=0; i--) {
    decimals = decimals == null ? name[i] : name[i] + decimals;
    if (i-1 == -1) continue;

    if (name[i-1] == ".") {

      if (int.parse(decimals) == 0) {
        decimals = null;
        i = i -1;
      }
    }
  }
  return decimals;
}

class Number {
  String textScreen, number;
  bool savingLastNumber = false;

  Number(this.textScreen, this.number, this.savingLastNumber);

  addTo(bool controller) {
    int commas = 0;
    int dots = 0;
    for (var i=0; i < textScreen.length; i++) {
      if (textScreen[i] == ",") commas++;
      if (textScreen[i] == ".") dots++;
    }

    if (controller) {
      return [number, true];
    }

    if (textScreen.length < (8 + commas + dots)) {
      textScreen = textScreen == "0" ? number : textScreen + number;
    }

    if (dots != 0 && commas == 0) {
      String removeDots;
      for (var j=0; j < textScreen.length-commas; j++){
        if (removeDots == null) {
          removeDots = textScreen[j];
          continue;
        }
        if (textScreen[j] == ".") continue;
        removeDots = removeDots + textScreen[j];
      }
      textScreen = removeDots;
      dots = 0;
    }

    if (!textScreen.contains(",")) { // add dot
      String text;
      if (textScreen.length >= 7) {
        for (var i=0; i < textScreen.length; i++) {
          if (text == null) {
            text = textScreen[i];
            continue;
          }

          if (i == textScreen.length-6 || i == textScreen.length-3) {
            text = text + ".";
            text = text + textScreen[i];
          } else {
            text = text + textScreen[i];
          }
        }
        textScreen = text;

      } else if (textScreen.length >= 4) {
        for (var i=0; i < textScreen.length; i++){
          if (text == null) {
            text = textScreen[i];
            continue;
          }

          if (i == textScreen.length-3) {
            text = text + ".";
            text = text + textScreen[i];
          } else {
            text = text + textScreen[i];
          }
        }
        textScreen = text;
      }
    }

    return [textScreen, savingLastNumber];
  }
}



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  setNumber0() {
    var constructor = Number(numberTile, "0", savingLastNumber);
    setState(() {
      var listConstructor = constructor.addTo(recentButtonOperation);
      numberTile = listConstructor[0];
      recentButtonOperation = false;

      if (operationsList[1] == "=") {
        firstNumberOperation = double.parse(switchNumberToEN(numberTile));
      }
    });
  }

  setNumber1() {
    var constructor = Number(numberTile, "1", savingLastNumber);
    setState(() {
      var listConstructor = constructor.addTo(recentButtonOperation);
      numberTile = listConstructor[0];
      recentButtonOperation = false;

      if (operationsList[1] == "=") {
        firstNumberOperation = double.parse(switchNumberToEN(numberTile));
      }
    });
  }

  setNumber2() {
    var constructor = Number(numberTile, "2", savingLastNumber);
    setState(() {
      var listConstructor = constructor.addTo(recentButtonOperation);
      numberTile = listConstructor[0];
      recentButtonOperation = false;

      if (operationsList[1] == "=") {
        firstNumberOperation = double.parse(switchNumberToEN(numberTile));
      }
    });
  }

  setNumber3() {
    var constructor = Number(numberTile, "3", savingLastNumber);
    setState(() {
      var listConstructor = constructor.addTo(recentButtonOperation);
      numberTile = listConstructor[0];
      recentButtonOperation = false;

      if (operationsList[1] == "=") {
        firstNumberOperation = double.parse(switchNumberToEN(numberTile));
      }
    });
  }

  setNumber4() {
    var constructor = Number(numberTile, "4", savingLastNumber);
    setState(() {
      var listConstructor = constructor.addTo(recentButtonOperation);
      numberTile = listConstructor[0];
      recentButtonOperation = false;

      if (operationsList[1] == "=") {
        firstNumberOperation = double.parse(switchNumberToEN(numberTile));
      }
    });
  }

  setNumber5() {
    var constructor = Number(numberTile, "5", savingLastNumber);
    setState(() {
      var listConstructor = constructor.addTo(recentButtonOperation);
      numberTile = listConstructor[0];
      recentButtonOperation = false;

      if (operationsList[1] == "=") {
        firstNumberOperation = double.parse(switchNumberToEN(numberTile));
      }
    });
  }

  setNumber6() {
    var constructor = Number(numberTile, "6", savingLastNumber);
    setState(() {
      var listConstructor = constructor.addTo(recentButtonOperation);
      numberTile = listConstructor[0];
      recentButtonOperation = false;

      if (operationsList[1] == "=") {
        firstNumberOperation = double.parse(switchNumberToEN(numberTile));
      }
    });
  }

  setNumber7() {
    var constructor = Number(numberTile, "7", savingLastNumber);
    setState(() {
      var listConstructor = constructor.addTo(recentButtonOperation);
      numberTile = listConstructor[0];
      recentButtonOperation = false;

      if (operationsList[1] == "=") {
        firstNumberOperation = double.parse(switchNumberToEN(numberTile));
      }
    });
  }

  setNumber8() {
    var constructor = Number(numberTile, "8", savingLastNumber);
    setState(() {
      var listConstructor = constructor.addTo(recentButtonOperation);
      numberTile = listConstructor[0];
      recentButtonOperation = false;

      if (operationsList[1] == "=") {
        firstNumberOperation = double.parse(switchNumberToEN(numberTile));
      }
    });
  }

  setNumber9() {
    var constructor = Number(numberTile, "9", savingLastNumber);
    setState(() {
      var listConstructor = constructor.addTo(recentButtonOperation);
      numberTile = listConstructor[0];
      recentButtonOperation = false;

      if (operationsList[1] == "=") {
        firstNumberOperation = double.parse(switchNumberToEN(numberTile));
      }
    });
  }

  percentButton(){
    setState(() {
      if (numberInScreen != 0) {
        numberTile = doubleToString(numberInScreen/100);
        adjustScreen(numberTile);
        numberInScreen = numberInScreen/100;
        return;
      }
      numberTile = doubleToString(double.parse(switchNumberToEN(numberTile))/100);
      adjustScreen(numberTile);
    });
  }

  moreOrLessButton(){
    setState(() {
      numberInScreen = -double.parse(numberTile);
      numberTile = doubleToString(numberInScreen);
    });
  }

  addComma(){
    var dots = 0;
    for (var i=0; i < numberTile.length; i++) {
      if (numberTile[i] == ".") dots++;
    }

    if (dots == 2 && numberTile.length == 9) {
      setState(() {
        fontSize = 50;
        numberTile = numberTile + ",";
        recentButtonOperation = false;
      });
    }

    if (numberTile.length < 8){
      setState(() {
        numberTile = numberTile + ",";
        recentButtonOperation = false;
      });
    }
  }

  resetScreen() {
    setState(() {
      fontSize = 60;
      numberTile = "0";

      operationsList = [0, 0];
      firstNumberOperation = "0";
      numberInScreen = 0;
      savingLastNumber = false;
    });
  }

  operator(String operation) {
    if (operationsList[1] != "=" && operationsList[1] != 0 && !recentButtonOperation) {
      setState(() {
        savedNumberLastOperation = double.parse(switchNumberToEN(numberTile));
        var result = doTheCalculation(firstNumberOperation, savedNumberLastOperation);
        firstNumberOperation = result;
        numberTile = doubleToString(result);
        adjustScreen(numberTile);
      });
    } else if (operationsList[1] == "=") {
      setState(() {
        if (!recentButtonOperation) {
          numberInScreen = double.parse(switchNumberToEN(numberTile));
        }
        firstNumberOperation = numberInScreen;
      });
    }
    else if (operationsList[1] == 0) {
      setState(() {
        firstNumberOperation = double.parse(switchNumberToEN(numberTile));
      });
    }

    operationsList[0] = operation;
    operationsList[1] = operation;
    recentButtonOperation = true;
  }

  operatorSum() => operator("+");
  operatorSubtraction() => operator("-");
  operatorMultiply() => operator("x");
  operatorDivision() => operator("/");

  doTheCalculation(double first, double last){
    double result;


    if (operationsList[0] == "+") {
      result = first + last;
    } else if (operationsList[0] == "-") {
      result = first - last;
    } else if (operationsList[0] == "x") {
      result = first * last;
    } else if (operationsList[0] == "/") {
      result = first / last;
    }
    return result;
  }

  operatorEqual() {
    if (operationsList[1] == "=") {
      setState(() {
        firstNumberOperation = numberInScreen;
        double result = doTheCalculation(firstNumberOperation, savedNumberLastOperation);
        numberInScreen = result;
        numberTile = doubleToString(numberInScreen);
        adjustScreen(numberTile);
        recentButtonOperation = true;
      });
    } else if (operationsList[0] != 0) {
      setState(() {
        savedNumberLastOperation = double.parse(switchNumberToEN(numberTile));
        double result = doTheCalculation(firstNumberOperation, savedNumberLastOperation);

        numberInScreen = result;
        numberTile = doubleToString(numberInScreen);
        adjustScreen(numberTile);
        //firstNumberOperation = result; // now the last number is bring to the first to be saved.


        recentButtonOperation = true;
        operationsList[1] = "=";
      });
    }
  }

  adjustScreen(String name) {
    if (name.length > 11) {
      setState(() {
        numberInScreen = double.parse(switchNumberToEN(name));
        numberTile = double.parse(switchNumberToEN(name)).toStringAsPrecision(3);

      });
    } else if(name.length > 10) {
      setState(() => fontSize = 48);
    } else {
      setState(() {
        fontSize = 60;
      });
    }
  }

  bool numbersTapped = false;
  bool savingLastNumber = false;
  double fontSize = 60;
  String numberTile = "0";
  dynamic firstNumberOperation = "0";
  double numberInScreen = 0;
  dynamic savedNumberLastOperation = "0";
  var operationsList = <dynamic>[0, 0];
  bool recentButtonOperation = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    constraints: BoxConstraints.tight(Size(0,90))
                  )
                )
              ]
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container( //40 + 48 * i
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    constraints: BoxConstraints.expand(width:105,height: 90),
                    child: ListTile(
                      title: Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          numberTile,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: fontSize
                          )
                        ),
                      ),
                    )
                  ),
                )
            ]),
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomizedButtons("AC", Colors.white60, size: 23, function: resetScreen),
                  CustomizedButtons("+/-", Colors.white60, function: moreOrLessButton),
                  CustomizedButtons("%", Colors.white60, function: percentButton),
                  CustomizedButtons("÷", Colors.orange, function: operatorDivision)
                ]
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomizedButtons("7", Colors.white12, function: setNumber7),
                  CustomizedButtons("8", Colors.white12, function: setNumber8),
                  CustomizedButtons("9", Colors.white12, function: setNumber9),
                  CustomizedButtons("x", Colors.orange, size: 28, function: operatorMultiply)
                ]
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomizedButtons("4", Colors.white12, function: setNumber4),
                  CustomizedButtons("5", Colors.white12, function: setNumber5),
                  CustomizedButtons("6", Colors.white12, function: setNumber6),
                  CustomizedButtons("-", Colors.orange, size:40, function: operatorSubtraction),
                ]
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  CustomizedButtons("1", Colors.white12, function: setNumber1),
                  CustomizedButtons("2", Colors.white12, function: setNumber2),
                  CustomizedButtons("3", Colors.white12, function: setNumber3),
                  CustomizedButtons("+", Colors.orange, function: operatorSum),
                ]
              )
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(10,0,10,0),
                    child: RawMaterialButton( // envolver em um container!
                      fillColor: Colors.white12,
                      constraints: BoxConstraints.tight(Size(150,60)),
                      onPressed: setNumber0,
                      child: Row( //To align the number zero with 1st col
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              constraints: BoxConstraints.tight(Size(40,60)),
                              child: Center(
                                child: Text("0",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32
                                  )
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              constraints: BoxConstraints.tight(Size(40,60))
                            ),
                          )
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),

                      )
                    ),
                  ),
                  CustomizedButtons(",", Colors.white12, function: addComma),
                  CustomizedButtons("=", Colors.orange, function: operatorEqual)
                ]
              )
            )
          ]
        ),
      )
    );
  }
}

class CustomizedButtons extends StatefulWidget {
  String text;
  Color cor;
  double size;
  Function function;

  CustomizedButtons(this.text, this.cor, {this.size = 32, this.function});
  @override
  _CustomizedButtonsState createState() => _CustomizedButtonsState();
}

class _CustomizedButtonsState extends State<CustomizedButtons> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        constraints: BoxConstraints.tight(Size(0,65)),
        onPressed: widget.function,
        fillColor: widget.cor,
        shape: CircleBorder(),
        elevation: 2.0,
        child: Center(
          child: Text(widget.text,
              style: TextStyle(color: Colors.white,
              fontSize: widget.size)),
        ),
      ),
    );
  }
}