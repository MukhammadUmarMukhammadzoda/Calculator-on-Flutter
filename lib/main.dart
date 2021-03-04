import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


void main() {
  runApp(HomePage());
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}



class _CalculatorState extends State<Calculator> {
  String result = "0" ;
  String equation = "0";
  String expression = "";
  String lastEqua = "";
  double fontSize = 45;
  


  buttonPressed(String buttonText){
    setState(() {
      if(buttonText == "C"){
        lastEqua = "";
        equation = "0";
        result = "0";
        fontSize = 45;
      }else if(buttonText == "b"){
        equation = equation.substring(0, equation.length - 1);
        if(equation == "") {
          equation = "0";
        }

      }
      else if(buttonText == "coder"){
        equation = "Mukhammad Umar";
        lastEqua = "AbRabDa Company";
        fontSize = 35;
      }
      else if(buttonText == "="){
        lastEqua = equation;
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('/', '/');
        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          equation =result;
        }catch(e){
          result = "Error";

        }

      }else{
        if(equation == "0"){
          equation = buttonText;
        }else{
          equation = equation + buttonText;
        }
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [ Column(
                  children:[
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end
                          ,children:[
                          Padding(padding: EdgeInsets.fromLTRB(0, 0, 12, 15),
                            child: Text(
                              lastEqua,

                              style: TextStyle(
                                  color: Colors.grey,
                                fontSize: 17
                              ),
                            ),
                          ),


                        ]),
                      ],
                    ),

                    Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:[
                      Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 10, 20),
                      child: Text(
                        equation,

                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fontSize,
                          fontWeight: FontWeight.bold

                        ),
                      ),
                    ),
                  ]),
                ]),
              ]),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                        RaisedButton(
                          shape: CircleBorder(),
                          color: Colors.grey,
                          onPressed:(){
                            buttonPressed("C");
                          },
                          child: Text("AC",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                        )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey,
                              onPressed:(){
                                buttonPressed('coder');
                              },
                              child: Text("CODER?",

                                style: TextStyle(

                                  fontSize: 11,
                                  color: Colors.brown[900],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey,
                              onPressed:(){
                                buttonPressed('b');
                              },
                              child: Icon(
                                Icons.backspace_sharp,
                                size: 22,
                                color: Colors.black,
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.orange[400],
                              onPressed:(){
                                buttonPressed('/');
                              },
                              child: Text(
                                "/",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                        ),


                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey[850],
                              onPressed:(){
                                 buttonPressed('7');
                              },
                              child: Text("7",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey[850],
                              onPressed:(){
                                buttonPressed("8");
                              },
                              child: Text("8",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey[850],
                              onPressed:(){
                                buttonPressed("9");
                              },
                              child: Text("9",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.orange[400],
                              onPressed:(){
                                buttonPressed('*');
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 22,

                              ),
                            )
                        ),


                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey[850],
                              onPressed:(){
                                buttonPressed("4");
                              },
                              child: Text("4",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey[850],
                              onPressed:(){
                                buttonPressed("5");
                              },
                              child: Text("5",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey[850],
                              onPressed:(){
                                buttonPressed("6");
                              },
                              child: Text("6",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.orange[400],
                              onPressed:(){
                                buttonPressed('-');
                              },
                              child: Text (
                                "-",
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                            )
                        ),


                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey[850],
                              onPressed:(){
                                buttonPressed('1');
                              },
                              child: Text("1",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey[850],
                              onPressed:(){
                                buttonPressed('2');
                              },
                              child: Text("2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey[850],
                              onPressed:(){
                                buttonPressed('3');
                              },
                              child: Text("3",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.orange[400],
                              onPressed:(){
                                buttonPressed('+');
                              },
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 24,

                              ),
                            )
                        ),


                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey[850],
                              onPressed:(){
                                buttonPressed('0');
                              },
                              child: Text("0",
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey[850],
                              onPressed:(){
                                buttonPressed('.');
                              },
                              child: Text(".",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.grey[850],
                              onPressed:(){
                                buttonPressed('00');
                              },
                              child: Text("00",

                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                        ),
                        SizedBox(
                            width: 74,
                            height: 74,
                            child:
                            RaisedButton(
                              shape: CircleBorder(),
                              color: Colors.orange[400],
                              onPressed:(){
                                buttonPressed("=");
                              },
                              child: Text(
                                "=",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                        ),


                      ],
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
