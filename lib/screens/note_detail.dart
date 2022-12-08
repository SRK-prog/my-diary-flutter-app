import 'package:flutter/material.dart';
import '../constants/color_constanst.dart';
import '../utils/utility.dart';

class NoteDetail extends StatelessWidget {
  const NoteDetail({super.key, required this.note});

  final dynamic note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  _buildAppBar(context) {
    return PreferredSize(
      preferredSize: const Size(0, 96),
      child: Padding(
        padding: EdgeInsets.only(
          left: 12.0,
          right: 12.0,
          top: (MediaQuery.of(context).viewPadding.top + 14).roundToDouble(),
          bottom: 10.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.arrow_back,
                size: 28,
                color: Colors.black,
              ),
              onPressed: () => {
                Navigator.pop(context),
              },
              splashRadius: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  getMoodEmoji(note['mood']),
                  scale: 18,
                ),
                const SizedBox(width: 10),
                Text(
                  formattedDateTime(note["createdAt"]),
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: GrayColor.color10,
                  ),
                )
              ],
            ),
            PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: GrayColor.color10,
                size: 28.0,
              ),
              splashRadius: 28,
              position: PopupMenuPosition.under,
              itemBuilder: (BuildContext context) => [
                PopupMenuItem(
                  value: "Edit",
                  child: Row(
                    children: const [
                      Icon(
                        Icons.edit,
                        color: GrayColor.color10,
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                        ),
                      ),
                      Text(
                        'Edit',
                        style: TextStyle(
                          color: GrayColor.color10,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: "Delete",
                  child: Row(
                    children: const [
                      Icon(
                        Icons.delete,
                        color: GrayColor.color10,
                        size: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                        ),
                      ),
                      Text(
                        'Delete',
                        style: TextStyle(
                          color: GrayColor.color10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _buildBody(context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 25,
        right: 25,
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
    );
  }
}
