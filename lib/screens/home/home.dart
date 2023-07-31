import 'package:flutter/material.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/screens/search/search.dart';
import 'package:my_diary/widgets/sidebar.dart';
import 'package:my_diary/widgets/bottom_navigationbar.dart';
import 'package:my_diary/widgets/note_card.dart';
import 'package:my_diary/utils/utility.dart';
import 'package:my_diary/screens/note_detail/note_detail.dart';
import 'package:my_diary/screens/create_note/create_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

final List<dynamic> data = [
  {
    'title': 'Good Day',
    'description':
        'Lorem ipsum dolor sit amet consectetur. Mi massa pulvinar consequat nec augue sit euismod. Ultrices dolor sit amet consectetur. Mi massa pulvinar consequat nec augue sit euismod. Ultrices amet sit blandit viverra dui vel velit viverra. Mi massa pulvinar consequat nec augue sit euismod.',
    'mood': 'happy',
    'images': [
      "https://source.unsplash.com/random/",
    ],
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  },
  {
    'title': 'Title',
    'description':
        'Lorem ipsum dolor sit amet consectetur. Mi massa pulvinar consequat nec augue sit euismod. Ultrices dolor sit amet consectetur. Mi massa pulvinar consequat nec augue sit euismod. Ultrices amet sit blandit viverra dui vel velit viverra. Mi massa pulvinar consequat nec augue sit euismod.',
    'mood': 'neutral',
    'images': [
      "https://source.unsplash.com/random/",
      "https://source.unsplash.com/random/",
      "https://source.unsplash.com/random/",
      "https://source.unsplash.com/random/",
      "https://source.unsplash.com/random/",
      "https://source.unsplash.com/random/",
    ],
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  },
  {
    'title': 'Title',
    'description':
        'Lorem ipsum dolor sit amet consectetur. Mi massa pulvinar consequat nec augue sit euismod. Ultrices dolor sit amet consectetur. Mi massa pulvinar consequat nec augue sit euismod. Ultrices amet sit blandit viverra dui vel velit viverra. Mi massa pulvinar consequat nec augue sit euismod.',
    'mood': 'sad',
    'images': [
      "https://source.unsplash.com/random/",
      "https://source.unsplash.com/random/"
    ],
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  },
  {
    'title': 'Title',
    'description':
        'Lorem ipsum dolor sit amet consectetur. Mi massa pulvinar consequat nec augue sit euismod. Ultrices dolor sit amet consectetur. Mi massa pulvinar consequat nec augue sit euismod. Ultrices amet sit blandit viverra dui vel velit viverra. Mi massa pulvinar consequat nec augue sit euismod.',
    'mood': 'laughing',
    'images': [
      "https://source.unsplash.com/random/",
      "https://source.unsplash.com/random/"
    ],
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  },
  {
    'title': 'Title',
    'description':
        'Lorem ipsum dolor sit amet consectetur. Mi massa pulvinar consequat nec augue sit euismod. Ultrices dolor sit amet consectetur. Mi massa pulvinar consequat nec augue sit euismod. Ultrices amet sit blandit viverra dui vel velit viverra. Mi massa pulvinar consequat nec augue sit euismod.',
    'mood': 'angry',
    'images': [
      "https://source.unsplash.com/random/",
      "https://source.unsplash.com/random/"
    ],
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  },
  {
    'title': 'Title',
    'description':
        'Lorem ipsum dolor sit amet consectetur. Mi massa pulvinar consequat nec augue sit euismod. Ultrices dolor sit amet consectetur. Mi massa pulvinar consequat nec augue sit euismod. Ultrices amet sit blandit viverra dui vel velit viverra. Mi massa pulvinar consequat nec augue sit euismod.',
    'mood': 'laughing',
    'images': [
      "https://source.unsplash.com/random/",
      "https://source.unsplash.com/random/"
    ],
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  },
];

class _HomePageState extends State<HomePage> {
  List notes = data;

  void _createNote(noteData) {
    setState(() {
      notes = [noteData, ...notes];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: _buildAppBar(),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: NoteCard(
              data: notes[index],
              onPressed: () => {
                Navigator.of(context).push(
                  navigateRoute(context, NoteDetail(note: notes[index])),
                )
              },
            ),
          );
        },
      ),
      drawer: const Sidebar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 65.0,
        height: 65.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () => Navigator.of(context).push(
              navigateRoute(
                context,
                CreateNote(onSubmitted: (value) => _createNote(value)),
              ),
            ),
            backgroundColor: BlueColor.color10,
            elevation: 0.0,
            splashColor: Colors.white10,
            focusElevation: 0.0,
            highlightElevation: 0.0,
            child: const Icon(
              Icons.add,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onSearch: () => {
          Navigator.of(context).push(
            navigateRoute(context, const SearchScreen()),
          )
        },
      ),
    );
  }

  _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size(0, 96),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: (MediaQuery.of(context).viewPadding.top + 18).roundToDouble(),
          bottom: 15.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "My Diary",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: GrayColor.color10,
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(50.0),
              child: const Icon(
                Icons.menu,
                size: 28,
                color: GrayColor.color10,
              ),
              onTap: () => _key.currentState!.openDrawer(),
            ),
          ],
        ),
      ),
    );
  }
}
