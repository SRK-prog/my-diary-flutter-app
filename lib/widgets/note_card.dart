import 'package:flutter/material.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/utils/utility.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.data, this.onPressed});

  final dynamic data;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 172.0,
        margin: const EdgeInsets.only(
          top: 6.0,
          bottom: 6.0,
          right: 15.0,
          left: 15.0,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: GrayColor.color20,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTopSection(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getHmaFromDate(data["createdAt"]),
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: GrayColor.color10,
                        height: 2.0,
                      ),
                    ),
                    Text(
                      data["title"],
                      style: const TextStyle(
                        color: GrayColor.color30,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                    Text(
                      data["description"],
                      overflow: TextOverflow.fade,
                      maxLines: 4,
                      softWrap: true,
                      style: const TextStyle(
                        color: GrayColor.color30,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  _buildTopSection() {
    return Row(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 12,
                top: 15.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    getMoodEmoji(data['mood']),
                    scale: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    formattedDateTime(data["createdAt"]),
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
                ])
      ],
    );
  }
}
