import 'package:flutter/material.dart';

import '../models/ImageModel.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.images.length,
      itemBuilder: (context, int index) {
        return Card(child: buildImage(images[index]));
      },
    );
  }

  Widget buildImage(ImageModel image) {
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(image.url),
          Padding(
            child: Text(
              image.title,
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 25.0,
              ),
            ),
            padding: EdgeInsets.only(
              top: 5.0,
            ),
          ),
        ],
      ),
      margin: EdgeInsets.all(25.0),
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
