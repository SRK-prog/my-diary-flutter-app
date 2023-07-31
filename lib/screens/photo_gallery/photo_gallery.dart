import "package:flutter/material.dart";
import 'package:my_diary/widgets/basic_appbar.dart';

class PhotoGallery extends StatefulWidget {
  const PhotoGallery({super.key});

  @override
  State<PhotoGallery> createState() => _PhotoGallery();
}

class _PhotoGallery extends State<PhotoGallery> {
  List photos = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 50; i++) {
      photos.add("https://source.unsplash.com/random/");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Photo Gallery'),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(photos.length, (index) {
          return Container(
            height: 200,
            color: Colors.amber,
            child: Image.network(
              photos[index],
              height: 180.0,
              fit: BoxFit.fill,
            ),
          );
        }),
      ),
    );
  }
}
