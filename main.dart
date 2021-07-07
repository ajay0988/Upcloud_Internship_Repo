import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
import 'package:upcloud_app/showdata.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, initialRoute: "/", routes: {
      "/": (context) => MyApp(),
      "/db": (context) => MyApp1(),
    }),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<MyApp> {
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
                    onPressed: funct1,

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
                      Navigator.pushNamed(context, "/db");
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
              width: 500,
              child: TextField(
                onChanged: (value) {
                  name = value;
                },
                //obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name:',
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: 500,
              child: TextField(
                onChanged: (value) {
                  email = value;
                },
                //obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email:',
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: 500,
              child: TextField(
                onChanged: (value) {
                  phone = value;
                },
                //obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone:',
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: 500,
              child: TextField(
                onChanged: (value) {
                  address = value;
                },
                //obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address:',
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              height: 40,
              width: 80,
              margin: const EdgeInsets.only(top: 10.0),
              color: Colors.amber[600],
              child: TextButton(
                onPressed: adduser,
                //onLongPress: senddata,
                child: Text(
                  "Save",
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
      ),
    );
  }
}
