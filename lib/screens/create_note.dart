import 'package:flutter/material.dart';
import 'dart:async';
import '../constants/color_constanst.dart';
import '../widgets/bottom_navigationbar.dart';
import '../utils/utility.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  DateTime selectedDate = DateTime.now();

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
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  _buildAppBar() {
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
            ElevatedButton.icon(
              icon: const Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: () => {},
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

  _buildBody() {
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
}
