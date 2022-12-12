import 'package:flutter/material.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/screens/settings/settings.dart';
import 'package:my_diary/utils/utility.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 75.0, left: 14.0, bottom: 40),
            child: Text("My Diary",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: GrayColor.color10)),
          ),
          ListItem(
            title: "Favourites",
            icon: Icons.favorite_border,
            onPressed: () => {},
          ),
          ListItem(
            title: "Calender",
            icon: Icons.calendar_today_outlined,
            onPressed: () => {},
          ),
          ListItem(
            title: "Sort by",
            icon: Icons.sort,
            onPressed: () => {},
          ),
          ListItem(
            title: "Trash bin",
            icon: Icons.delete_outline,
            onPressed: () => {},
          ),
          ListItem(
            title: "Settings",
            icon: Icons.settings,
            onPressed: () => {
              Navigator.of(context).push(
                navigateRoute(
                  context,
                  const SettingsScreen(),
                ),
              )
            },
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 10,
      minLeadingWidth: 0,
      title: Text(title,
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: GrayColor.color10)),
      leading: Icon(
        icon,
        size: 26,
        color: GrayColor.color10,
      ),
      onTap: onPressed,
    );
  }
}
