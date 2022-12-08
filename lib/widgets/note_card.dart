import 'package:flutter/material.dart';
import '../constants/color_constanst.dart';

class NoteCard extends StatelessWidget {
  NoteCard({super.key, required this.data, this.onPressed});

  final dynamic data;
  final VoidCallback? onPressed;

  final List<String> months = <String>[
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  String _formattedDateTime(now) {
    return "${now.day} ${months[now.month - 1]} ${now.year}";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 192.0,
        margin:
            const EdgeInsets.only(top: 6.0, bottom: 6.0, right: 20, left: 20),
        decoration: BoxDecoration(
          border: Border.all(
            color: GrayColor.color20,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          Text(data["mood"]),
                          const SizedBox(width: 10),
                          Text(
                            _formattedDateTime(data["createdAt"]),
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                              color: GrayColor.color10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                PopupMenuButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: GrayColor.color10,
                    ),
                    splashRadius: 20,
                    position: PopupMenuPosition.under,
                    itemBuilder: (BuildContext context) => [
                          PopupMenuItem(
                            value: "Edit",
                            child: Row(children: const [
                              Icon(
                                Icons.edit,
                                color: GrayColor.color10,
                                size: 20,
                              ),
                              Padding(padding: EdgeInsets.only(left: 8.0)),
                              Text(
                                'Edit',
                                style: TextStyle(
                                  color: GrayColor.color10,
                                ),
                              ),
                            ]),
                          ),
                          PopupMenuItem(
                            value: "Delete",
                            child: Row(children: const [
                              Icon(
                                Icons.delete,
                                color: GrayColor.color10,
                                size: 20,
                              ),
                              Padding(padding: EdgeInsets.only(left: 8.0)),
                              Text(
                                'Delete',
                                style: TextStyle(
                                  color: GrayColor.color10,
                                ),
                              ),
                            ]),
                          ),
                        ])
              ],
            )
          ],
        ),
      ),
    );
  }
}
