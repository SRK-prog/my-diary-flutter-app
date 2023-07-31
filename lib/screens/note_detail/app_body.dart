import 'package:flutter/material.dart';
import 'package:my_diary/utils/utility.dart';
import 'package:my_diary/constants/color_constanst.dart';

Widget buildBody(context, note) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getHmaFromDate(note['createdAt']),
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: GrayColor.color10,
              height: 2.0,
            ),
          ),
          Text(
            note['title'],
            style: const TextStyle(
              color: GrayColor.color30,
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              height: 1.4,
            ),
          ),
          Text(
            note['description'],
            style: const TextStyle(
              color: GrayColor.color30,
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              height: 1.3,
            ),
          ),
          Column(
            children: <Widget>[
              for (var image in note['images'])
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Image.network(
                    image,
                    height: 180.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  ),
                )
            ],
          ),
        ],
      ),
    ),
  );
}
