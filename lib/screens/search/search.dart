import 'package:flutter/material.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/utils/utility.dart';
import 'package:my_diary/widgets/back_button.dart';
import 'package:my_diary/widgets/basic_appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreen();
}

class _SearchScreen extends State<SearchScreen> {
  String searchQuery = "";
  List selectedMoods = [];
  bool showMoods = false;

  bool _isMoodSelected(String mood) {
    return selectedMoods.contains(mood);
  }

  void _onMoodSelect(String mood) {
    setState(() {
      selectedMoods.contains(mood)
          ? selectedMoods.remove(mood)
          : selectedMoods.add(mood);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Search'),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: GrayColor.color50,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 22.0,
              bottom: 22.0,
            ),
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) => setState(() {
                    searchQuery = value;
                  }),
                  cursorColor: GrayColor.color10,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    focusColor: GrayColor.color10,
                    hintText: 'Search Note',
                    isDense: true,
                    iconColor: GrayColor.color10,
                    prefixIcon: Icon(
                      Icons.search,
                      color: GrayColor.color10,
                      size: 28.0,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 5.0,
                    ),
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: GrayColor.color10,
                    ),
                  ),
                ),
                const SizedBox(height: 36.0),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      Colors.white,
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      BlueColor.color10,
                    ),
                    fixedSize: MaterialStateProperty.all(
                      const Size.fromHeight(48.0),
                    ),
                  ),
                  onPressed: () => setState(() {
                    showMoods = !showMoods;
                  }),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(showMoods
                          ? Icons.cancel_outlined
                          : Icons.control_point_outlined),
                      const SizedBox(width: 5.0),
                      const Text(
                        'Mood',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                if (showMoods) const SizedBox(height: 10.0),
                if (showMoods)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildMoodButton('happy'),
                      _buildMoodButton('laughing'),
                      _buildMoodButton('neutral'),
                      _buildMoodButton('angry'),
                      _buildMoodButton('sad'),
                    ],
                  )
              ],
            ),
          ),
        ),
        if (!showMoods)
          Image(
            image: const AssetImage("assets/images/searching-image.png"),
            width:
                MediaQuery.of(context).viewInsets.bottom != 0 ? 100.0 : 150.0,
            height:
                MediaQuery.of(context).viewInsets.bottom != 0 ? 100.0 : 150.0,
            fit: BoxFit.contain,
          ),
        Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 34.0,
          ),
          child: TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                Colors.white,
              ),
              backgroundColor: MaterialStateProperty.all(
                BlueColor.color10,
              ),
              fixedSize: MaterialStateProperty.all(
                const Size.fromHeight(48.0),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.search),
                SizedBox(width: 5.0),
                Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildMoodButton(String type) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        backgroundColor: MaterialStateProperty.all(
          _isMoodSelected(type) ? BlueColor.color10 : GrayColor.color10,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99.0),
          ),
        ),
      ),
      onPressed: () => _onMoodSelect(type),
      child: Image.asset(
        getMoodEmoji(type),
        width: 30.0,
        height: 30.0,
      ),
    );
  }
}
