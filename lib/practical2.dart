import 'package:flutter/material.dart';

class pract extends StatefulWidget{
  @override
  State<pract> createState() => _practState();
}

class _practState extends State<pract> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
   appBar: AppBar(title: Text("Flutter"),),
     body: Padding(
       padding: const EdgeInsets.all(16),
       child: ListView(children: [
         Center(child: Text("Hello Wold ! ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
         SizedBox(height: 11,),
         
         //Image 
         Image.asset("assests/png.jpeg",height: 200,fit: BoxFit.cover,),
         SizedBox(height: 11,),
         
         //container 
         
         Container(
           alignment: Alignment.center,
           height: 100,
           width: 20,
           decoration: BoxDecoration(
             color:Colors.blue.shade100,
             border: Border.all(width: 2,color: Colors.black),
             borderRadius: BorderRadius.circular(21),
             boxShadow: [
               BoxShadow(blurRadius: 10,spreadRadius: 5,color: Colors.deepOrange)
             ]
           ),
           child: Text("Its a Container"),
         ),
         SizedBox(height: 20,),
         
         //Buttons
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             ElevatedButton(onPressed: (){}, child: Text("Elevated")),
             OutlinedButton(onPressed: (){}, child: Text("Outline")),
             TextButton(onPressed: (){}, child: Text("Text")),
             

           ],
         ),
         SizedBox(height: 15,),


         //listTile
         Card(
           elevation: 10,
           child: ListTile(
             leading: Icon(Icons.account_circle),
             title: Text('Username'),
             subtitle: Text('Details about user'),
             trailing: Icon(Icons.arrow_circle_right_outlined),

           ),
         ),
         Card(
           elevation: 10,
           child: ListTile(
             leading: Icon(Icons.account_circle),
             title: Text('Username'),
             subtitle: Text('Details about user'),
             trailing: Icon(Icons.arrow_circle_right_outlined),

           ),
         ),

         



       ]),
     ),

     
   );
  }
}