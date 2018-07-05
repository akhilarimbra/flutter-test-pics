import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

import '../models/ImageModel.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Let's see some pics"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => fetchImage(),
          child: Icon(Icons.add),
        ),
        drawer: Drawer(),
        body: Center(
          child: Text(
            'Pressed ${this.counter} times',
            style: TextStyle(
              fontSize: 25.00,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
      ),
    );
  }

  void fetchImage() async {
    this.counter++;
    var response =
        await get('http://jsonplaceholder.typicode.com/photos/${this.counter}');
    ImageModel imageModel = new ImageModel.fromJson(json.decode(response.body));
  }
}
