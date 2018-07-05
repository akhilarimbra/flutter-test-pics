import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

import 'models/ImageModel.dart';
import 'widgets/ImageList.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> imageModelList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Let's see some pics"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add),
        ),
        drawer: Drawer(),
        body: ImageList(imageModelList),
      ),
    );
  }

  void fetchImage() async {
    this.counter++;
    final response =
        await get('http://jsonplaceholder.typicode.com/photos/${this.counter}');
    final imageModel = ImageModel.fromJson(json.decode(response.body));
    setState(() {
      imageModelList.add(imageModel);
    });
  }
}
