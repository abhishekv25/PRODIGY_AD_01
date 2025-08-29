import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart'; // Add this package

class pract3 extends StatefulWidget{
  @override
  State<pract3> createState() => pract3State();
}

class pract3State extends State<pract3> {
  var TextCon= TextEditingController();
  var result = " ";

  void onButtonClick(String value){
    setState(() {
      if(value == "AC"){
        TextCon.text = "";
      }else if(value == "⌫"){   // Backspace logic
        if(TextCon.text.isNotEmpty){
          TextCon.text = TextCon.text.substring(0, TextCon.text.length - 1);
        }
      }else if(value == "="){
        try{
          Parser p = Parser();
          Expression exp = p.parse(TextCon.text.replaceAll("X", "*"));
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          TextCon.text = eval.toString();
        }catch(e){
          TextCon.text = "Error";
        }
      }else{
        TextCon.text += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Calculator') ,),
      body: Center(
        child: Card(
          elevation: 100,
          shadowColor: Colors.purpleAccent.shade100,
          child: Container(
            height:500,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Column(
            children: [
              SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  enabled: true, // user will only press buttons
                  controller: TextCon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hoverColor: Colors.red,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(color: Colors.blue,width: 1)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                          borderSide: BorderSide(color: Colors.blue,width: 1)
                      )
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){ onButtonClick("7"); }, child: Text("7")),
                      ElevatedButton(onPressed: (){ onButtonClick("8"); }, child: Text("8")),
                      ElevatedButton(onPressed: (){ onButtonClick("9"); }, child: Text("9")),
                      ElevatedButton(onPressed: (){ onButtonClick("AC"); }, child: Text("AC")),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){ onButtonClick("4"); }, child: Text("4")),
                      ElevatedButton(onPressed: (){ onButtonClick("5"); }, child: Text("5")),
                      ElevatedButton(onPressed: (){ onButtonClick("6"); }, child: Text("6")),
                      ElevatedButton(onPressed: (){ onButtonClick("X"); }, child: Text(" X ")),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){ onButtonClick("1"); }, child: Text("1")),
                      ElevatedButton(onPressed: (){ onButtonClick("2"); }, child: Text("2")),
                      ElevatedButton(onPressed: (){ onButtonClick("3"); }, child: Text("3")),
                      ElevatedButton(onPressed: (){ onButtonClick("-"); }, child: Text(" - ")),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){ onButtonClick("%"); }, child: Text("%")),
                      ElevatedButton(onPressed: (){ onButtonClick("0"); }, child: Text("0")),
                      ElevatedButton(onPressed: (){ onButtonClick("."); }, child: Text(".")),
                      ElevatedButton(onPressed: (){ onButtonClick("+"); }, child: Text("+")),
                    ],
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: (){ onButtonClick("/"); }, child: Text("/")),
                      ElevatedButton(onPressed: (){ onButtonClick("="); }, child: Text("=")),
                      ElevatedButton(onPressed: (){ onButtonClick("⌫"); }, child: Text("⌫")), // Backspace button
                    ],
                  )
                ],
              )
            ],
          ),
          ),
        ),
      ),
    );
  }
}
