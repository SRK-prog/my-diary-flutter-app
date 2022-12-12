import 'package:flutter/material.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/utils/utility.dart';
import 'package:my_diary/widgets/basic_appbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingsScreen> {
  bool reminderIsOn = false;
  TimeOfDay reminderTime = const TimeOfDay(hour: 8, minute: 0);

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: reminderTime,
    );
    if (pickedTime != null && pickedTime != reminderTime) {
      setState(() {
        reminderTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(
        title: 'Settings',
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          GestureDetector(
            child: Container(
              height: 58.0,
              margin: const EdgeInsets.only(top: 12.0),
              width: double.infinity,
              color: GrayColor.color50,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.photo_library_rounded,
                      color: BlueColor.color10,
                      size: 30.0,
                    ),
                    SizedBox(width: 14.0),
                    Text(
                      "Photo Gallery",
                      style: TextStyle(
                        color: GrayColor.color60,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          _buildreminderButton(),
          if (reminderIsOn) _buildReminderMenu(),
      
        ],
      ),
    );
  }

  Widget _buildreminderButton() {
    return GestureDetector(
      child: Container(
        height: 58.0,
        margin: const EdgeInsets.only(top: 12.0),
        width: double.infinity,
        color: GrayColor.color50,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.add_alert_rounded,
                        color: BlueColor.color10,
                        size: 30.0,
                      ),
                      SizedBox(width: 14.0),
                      Text(
                        "Photo Gallery",
                        style: TextStyle(
                          color: GrayColor.color60,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  Switch(
                    value: reminderIsOn,
                    activeColor: BlueColor.color10,
                    onChanged: (bool value) {
                      setState(() {
                        reminderIsOn = value;
                      });
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildReminderMenu() {
    return GestureDetector(
      onTap: () => _selectTime(),
      child: Container(
        height: 58.0,
        width: double.infinity,
        color: GrayColor.color50,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
          ),
          child: Row(
            children: [
              const Icon(
                Icons.timer,
                color: BlueColor.color10,
                size: 30.0,
              ),
              const SizedBox(width: 14.0),
              Text(
                getHmaFromTime(reminderTime),
                style: const TextStyle(
                  color: GrayColor.color60,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingsButton({
    name,
    icon,
    subName,
    onPressed,
    showSwitch,
  }) {
    return GestureDetector(
      child: Container(
        height: 58.0,
        margin: const EdgeInsets.only(top: 12.0),
        width: double.infinity,
        color: GrayColor.color50,
        child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.add_alert_rounded,
                          color: BlueColor.color10,
                          size: 30.0,
                        ),
                        SizedBox(width: 14.0),
                        Text(
                          "Photo Gallery",
                          style: TextStyle(
                            color: GrayColor.color60,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    Switch(
                      value: reminderIsOn,
                      activeColor: BlueColor.color10,
                      onChanged: (bool value) {
                        setState(() {
                          reminderIsOn = value;
                        });
                      },
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
