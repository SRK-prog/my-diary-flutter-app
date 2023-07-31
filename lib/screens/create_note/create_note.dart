import 'package:flutter/material.dart';
import 'dart:async';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/utils/utility.dart';
import 'package:my_diary/widgets/back_button.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key, required this.onSubmitted});
  final Function onSubmitted;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  DateTime selectedDate = DateTime.now();
  String title = "";
  String note = "";
  String mood = "happy";
  bool isFavorite = false;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      final DateTime now = DateTime.now();
      setState(() {
        selectedDate = picked.add(
          Duration(
            hours: now.hour,
            minutes: now.minute,
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size(0, 96),
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.0,
          right: 20.0,
          top: (MediaQuery.of(context).viewPadding.top + 14).roundToDouble(),
          bottom: 12.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BackArrowButton(
              onPressed: () => {
                Navigator.pop(context),
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: () => {
                widget.onSubmitted({
                  'title': title,
                  'description': note,
                  'mood': mood,
                  'images': [],
                  'createdAt': DateTime.now(),
                  'updatedAt': DateTime.now(),
                }),
                Navigator.pop(context)
              },
              label: const Text(
                "Save",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: BlueColor.color10,
                fixedSize: const Size(116, 40),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      color: GrayColor.color40,
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 10.0),
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    formattedDateTime(selectedDate),
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                      color: GrayColor.color10,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Text(
                    getHmaFromDate(selectedDate),
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w700,
                      color: GrayColor.color10,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: GrayColor.color10,
                  )
                ],
              ),
            ),
            TextFormField(
              onChanged: (value) => setState(() {
                title = value;
              }),
              cursorColor: GrayColor.color10,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Note Title',
                isDense: true,
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
            TextFormField(
              onChanged: (value) => setState(() {
                note = value;
              }),
              cursorColor: GrayColor.color10,
              maxLines: 15,
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 5.0,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Note...',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: GrayColor.color10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      child: SizedBox(
        height: 65.0,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 30.0,
            left: 30.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildEmojiPopupMenu(),
              IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () => {},
                icon: const Icon(
                  Icons.add_a_photo,
                  size: 28,
                  color: GrayColor.color10,
                ),
              ),
              IconButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () => setState(() {
                  isFavorite = !isFavorite;
                }),
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  size: 32,
                  color: isFavorite ? RedColor.color10 : GrayColor.color10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmojiPopupMenu() {
    return Theme(
      data: Theme.of(context).copyWith(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: PopupMenuButton(
        onSelected: (value) => setState(() {
          mood = value;
        }),
        padding: const EdgeInsets.all(0),
        splashRadius: 0.0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        itemBuilder: (context) => [
          PopupMenuItem(
            height: 30.0,
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => {Navigator.pop(context, "happy")},
                  child: Image.asset(
                    getMoodEmoji('happy'),
                    scale: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () => {Navigator.pop(context, "laughing")},
                  child: Image.asset(
                    getMoodEmoji('laughing'),
                    scale: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () => {Navigator.pop(context, "neutral")},
                  child: Image.asset(
                    getMoodEmoji('neutral'),
                    scale: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () => {Navigator.pop(context, "angry")},
                  child: Image.asset(
                    getMoodEmoji('angry'),
                    scale: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () => {Navigator.pop(context, "sad")},
                  child: Image.asset(
                    getMoodEmoji('sad'),
                    scale: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
        offset: const Offset(-10.0, -70.0),
        child: Image.asset(
          getMoodEmoji(mood),
          scale: 18,
        ),
      ),
    );
  }
}
