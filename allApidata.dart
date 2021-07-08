import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  final String url = "https://dry-bayou-99944.herokuapp.com/profiles";
  late List data;
  @override
  void initState() {
    super.initState();
    this.getJsondata();
  }

  Future<String> getJsondata() async {
    var response =
        await http.get(Uri.parse(url), headers: {"Accept": "application/json"});
    print(response.body);
    setState(() {
      var convertDataToJson =
          jsonDecode(response.body); //JSON.decode(response.body);
      data = convertDataToJson;
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API App"),
      ),
      body: Center(
        child: Container(
          width: 300,
          child: ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Center(
                    child: Column(
                  children: [
                    Card(
                      child: Container(
                        color: Colors.black12,
                        width: 300,
                        height: 150,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                         
                          children: [
                            Text(data[index]['name'] == null
                                ? "This user not have name"
                                : data[index]['name']),
                            SizedBox(height: 10),
                            Text(data[index]['email'] == null
                                ? "Email not present"
                                : data[index]['email']),
                            SizedBox(height: 10),
                            Text(data[index]['contact'] == null
                                ? "phone not present"
                                : data[index]['contact']),
                            SizedBox(height: 10),
                            Text(data[index]['address'] == null
                                ? "Not present"
                                : data[index]['address']),
                            SizedBox(height: 10),
                          ],
                        ),
                        padding: EdgeInsets.all(20.0),
                      ),
                    )
                  ],
                )),
              );
            },
          ),
        ),
      ),
    );
  }
}
