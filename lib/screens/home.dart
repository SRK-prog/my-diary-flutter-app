import 'package:flutter/material.dart';
import '../constants/color_constanst.dart';
import '../widgets/sidebar.dart';
import '../widgets/bottom_navigationbar.dart';
import '../widgets/note_card.dart';
import '../utils/utility.dart';
import 'note_detail.dart';
import 'create_note.dart';

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
      "https://source.unsplash.com/random/"
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
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const CreateNote(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

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
              onPressed: () => {
                Navigator.of(context).push(
                  navigateRoute(context, NoteDetail(note: data[index])),
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
            onPressed: () => {
              Navigator.of(context).push(
                navigateRoute(context, const CreateNote()),
              )
            },
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
      bottomNavigationBar: const BottomNavBar(),
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
