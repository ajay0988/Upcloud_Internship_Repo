import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

class MyApp1 extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<MyApp1> {
  funct1() {
    print("pressed add data");
  }

  var name;
  var email;
  var phone;
  var address;

  adduser() {
    Map jsondata = {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address
    };
    print(jsondata);
  }

  Future getuserdata() async {
    var response =
        await http.get(Uri.https("dry-bayou-99944.herokuapp.com", '/profiles'));

    var jsondata = jsonDecode(response.body);

    //var jsondata = jsonDecode(response.body);
    print(jsondata[0]["name"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upcloud App"),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 80,
                  color: Colors.amber[600],
                  margin: EdgeInsets.only(top: 10.0),
                  child: TextButton(
                    //TextAlign: Center,
                    onPressed: () {
                      Navigator.pushNamed(context, "/");
                    },

                    child: Text(
                      "Add Data",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        //backgroundColor: Colors.amber,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 80,
                  margin: const EdgeInsets.only(top: 10.0),
                  color: Colors.amber[100],
                  child: TextButton(
                    onPressed: () {
                      getuserdata();
                    },
                    child: Text(
                      "Show Data",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        //backgroundColor: Colors.blue,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              height: 150,
              width: 300,
              padding: EdgeInsets.all(20.0),
              //padding: Padding(padding: padding),
              //margin: const EdgeInsets.only(top: 10.0),
              color: Colors.black12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //textDirection: TextAlign.left,
                //mainAxisAlignment: MainAxisAlignment.left,
                children: [
                  Text("Ajay Kumar Yadav"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("131ajay0@gmail.com"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("7707062562"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Jaipur, Rajasthan"),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              height: 150,
              width: 300,
              color: Colors.black12,
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Abhimanyu"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("abhikumar12@gmail.com"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("8956782342"),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Siwan, Bihar"),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),

              //Text("Hello"),
            )
          ],
        ),
      ),
    );
  }
}

class User {
  final String name, email, phone, address;
  User(this.name, this.email, this.phone, this.address);
}
