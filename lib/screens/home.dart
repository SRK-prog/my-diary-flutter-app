import 'package:flutter/material.dart';
import '../constants/color_constanst.dart';
import '../widgets/sidebar.dart';
import '../widgets/bottom_navigationbar.dart';
import '../widgets/note_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

final List<dynamic> data = [
  {
    'title': 'Good Day',
    'description': 'description',
    'mood': 'happy',
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  },
  {
    'title': 'Title',
    'description': 'description',
    'mood': 'neutral',
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  },
  {
    'title': 'Title',
    'description': 'description',
    'mood': 'sad',
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  },
  {
    'title': 'Title',
    'description': 'description',
    'mood': 'laughing',
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  },
  {
    'title': 'Title',
    'description': 'description',
    'mood': 'angry',
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  },
  {
    'title': 'Title',
    'description': 'description',
    'mood': 'laughing',
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  },
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: _buildAppBar(),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
              child: NoteCard(
            data: data[index],
          ));
        },
      ),
      drawer: const Sidebar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () => {},
            backgroundColor: BlueColor.color10,
            elevation: 0.0,
            splashColor: Colors.white10,
            focusElevation: 0.0,
            highlightElevation: 0.0,
            child: const Icon(Icons.add, size: 32),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size(0, 96),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 22.0, right: 20.0, top: 65.0, bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "My Diary",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: GrayColor.color10),
            ),
            IconButton(
              icon: const Icon(Icons.menu, size: 28, color: GrayColor.color10),
              onPressed: () => _key.currentState!.openDrawer(),
              splashRadius: 25,
            ),
          ],
        ),
      ),
    );
  }
}
