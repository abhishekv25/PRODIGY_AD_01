import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    home: RegistrationForm(),
    debugShowCheckedModeBanner: false,
  ));
}

class RegistrationForm extends StatefulWidget {
  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  // Controllers for text fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  // Gender selection
  String gender = " ";

  // Hobbies
  bool hobbyCricket = false;
  bool hobbyFootball = false;
  bool hobbyPlaying = false;
  bool hobbyStudies = false ;

  // Dropdown (Country)
  String selectedCountry = "India";
  List<String> countries = ["India", "USA", "UK", "Russia", "Australia"];

  void fetchDetails() {
    String name = nameController.text;
    String email = emailController.text;

    String hobbies = "";
    if (hobbyCricket) hobbies += "Cricket ";
    if (hobbyFootball) hobbies += "Football ";
    if (hobbyPlaying) hobbies += "Gaming ";
    if (hobbyStudies) hobbies += "Coding ";

    String details =
        "Name: $name\nEmail: $email\nGender: $gender\nHobbies: $hobbies\nCountry: $selectedCountry";

    // Option 1: Show Dialog
    showDialog(

        context: context,
        builder: (context) {
          return AlertDialog(
            elevation: 5,
            icon: Icon(Icons.save),
            title: Text("Registration Details"),
            content: Text(details),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK"))
            ],
          );
        });

    // Option 2: Toast (uncomment if you want)
    // Fluttertoast.showToast(msg: details, toastLength: Toast.LENGTH_LONG);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Registration Form",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
      backgroundColor: Colors.blue.shade500,),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              Card(
                elevation: 5,shadowColor: Colors.purpleAccent.shade100,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: "Name", border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )),
                ),
              ),
              SizedBox(height: 15),
          // Email
           Card(
                elevation: 5,
                shadowColor: Colors.purpleAccent.shade100,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email", border: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )),
                ),
              ),
              SizedBox(height: 15),

              // Gender
              Text("Gender:", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Row(
                children: [
                  Radio(
                      value: "Male",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      }),
                  Text("Male"),
                  Radio(
                      value: "Female",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      }),
                  Text("Female"),
                ],
              ),
              SizedBox(height: 15),

              // Hobbies
              Text("Hobbies:", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              Card(elevation: 5,shadowColor: Colors.red.shade100,
                child: CheckboxListTile(
                  title: Text("Cricket"),
                  value: hobbyCricket,
                  onChanged: (value) {
                    setState(() {
                      hobbyCricket = value!;
                    });
                  },
                ),
              ),
              Card(elevation: 5,shadowColor: Colors.red.shade100,
                child: CheckboxListTile(
                  title: Text("Football"),
                  value: hobbyFootball,
                  onChanged: (value) {
                    setState(() {
                      hobbyFootball = value!;
                    });
                  },
                ),
              ),
              Card(elevation: 5,shadowColor: Colors.red.shade100,
                child: CheckboxListTile(
                  title: Text("Gaming"),
                  value: hobbyPlaying,
                  onChanged: (value) {
                    setState(() {
                      hobbyPlaying =value!;
                    });
                  },
                ),
              ),
              Card(elevation: 5,shadowColor: Colors.red.shade100,
                child: CheckboxListTile(title:Text("Coding"),value: hobbyStudies, onChanged: (value){
                  setState(() {
                    hobbyStudies =value!;
                  });
                }),
              ),
              SizedBox(height: 15),

              // Dropdown
              Text("Select Country:", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
              DropdownButton<String>(
                value: selectedCountry,
                items: countries.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value!;
                  });
                },
              ),
              SizedBox(height: 25),

              // Button
              Center(
                child: ElevatedButton(
                  onPressed: fetchDetails,
                  child: Text("Submit"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
