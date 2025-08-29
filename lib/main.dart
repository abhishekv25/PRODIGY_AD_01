import 'package:flutter/material.dart';
import 'package:practical/pract3.dart';
import 'package:practical/practical2.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:pract3()
    );
  }
}
class MyHomePageState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('row and column layout'),
      ),
      body: Column(
          children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 20,
              color: Colors.orangeAccent.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Row widgets',style: TextStyle(fontSize: 20),),
                  Icon(Icons.account_circle, size: 40,),
                  Icon(Icons.account_balance,size: 40,),
                ],),),),
            SizedBox(height: 11,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                shadowColor: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Column widgets:- ',style: TextStyle(fontSize: 20),),
                    SizedBox(height: 10,),
                    Container(width: 200,height:100,color: Colors.blue,
                      alignment: Alignment.center,
                      child: Text("1"),
                    ),
                    SizedBox(height: 10,),
                    Container(width: 200,height: 100,color: Colors.green,
                      alignment: Alignment.center,
                      child: Text("2"),),

                  ],
                  
                ),
              ),
            ),
            SizedBox(height: 12,),
            Card(
              elevation: 100,
              shadowColor: Colors.purple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Icons Widgets :- ",style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                    Column(children: [Icon(Icons.adb_rounded),
                      Text("Android"),]
                    ),
                    SizedBox(height: 20,),
                    Column(children: [Icon(Icons.g_translate),
                      Text("Translate"),]
                    ),
                    SizedBox(height: 20,),
                    Column(children: [Icon(Icons.keyboard),
                      Text("Keyboard"),]
                    ),
                  ],

                ),
              ),
            )
            
            
          ],
        ),




    );
  }
}
