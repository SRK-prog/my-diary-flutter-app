import 'package:flutter/material.dart';
import 'package:my_diary/constants/color_constanst.dart';
import 'package:my_diary/utils/utility.dart';
import 'package:my_diary/widgets/basic_appbar.dart';
import 'package:my_diary/screens/photo_gallery/photo_gallery.dart';

class RadioItem {
  String name;
  String keyName;
  RadioItem({required this.name, required this.keyName});
}

List<RadioItem> colorThemes = [
  RadioItem(
    keyName: "systemDefault",
    name: "System default",
  ),
  RadioItem(
    keyName: "light",
    name: "Light",
  ),
  RadioItem(
    keyName: "dark",
    name: "Dark",
  ),
];

List<RadioItem> fontSizes = [
  RadioItem(
    keyName: "small",
    name: "Small",
  ),
  RadioItem(
    keyName: "medium",
    name: "Medium",
  ),
  RadioItem(
    keyName: "large",
    name: "Large",
  ),
  RadioItem(
    keyName: "huge",
    name: "Huge",
  ),
];

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingsScreen> {
  bool reminderIsOn = false;
  TimeOfDay reminderTime = const TimeOfDay(hour: 8, minute: 0);
  bool showThemeOptions = false;
  bool showFontOptions = false;
  RadioItem colorTheme = RadioItem(
    keyName: "systemDefault",
    name: "System default",
  );
  RadioItem fontSize = RadioItem(
    keyName: "medium",
    name: "Medium",
  );

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
          _settingsButton(
            name: "Photo Gallery",
            icon: Icons.photo_library_rounded,
            subName: "",
            onPressed: () => Navigator.of(context).push(
              navigateRoute(context, const PhotoGallery()),
            ),
            showSwitch: false,
          ),
          _settingsButton(
            name: "Reminder",
            icon: Icons.add_alert_rounded,
            subName: "",
            onPressed: () => {},
            showSwitch: true,
          ),
          if (reminderIsOn)
            _settingsButton(
              name: getHmaFromTime(reminderTime),
              icon: Icons.timer,
              subName: "",
              onPressed: () => _selectTime(),
              showSwitch: false,
              showMargin: false,
            ),
          _settingsButton(
            name: "Color Theme",
            icon: Icons.wb_sunny_outlined,
            subName: "System default",
            onPressed: () => {
              setState(() {
                showThemeOptions = !showThemeOptions;
              })
            },
            showSwitch: false,
          ),
          if (showThemeOptions)
            _buildRadioMenu(
              values: colorTheme,
              onChange: (RadioItem value) => setState(() {
                colorTheme = RadioItem(
                  name: value.name,
                  keyName: value.keyName,
                );
              }),
              options: colorThemes,
            ),
          _settingsButton(
            name: "Font Size",
            icon: Icons.text_increase_rounded,
            subName: "Medium",
            onPressed: () => setState(() {
              showFontOptions = !showFontOptions;
            }),
            showSwitch: false,
          ),
          if (showFontOptions)
            _buildRadioMenu(
              values: fontSize,
              onChange: (RadioItem value) => setState(() {
                fontSize = RadioItem(
                  name: value.name,
                  keyName: value.keyName,
                );
              }),
              options: fontSizes,
            ),
          _settingsButton(
            name: "Export Entries",
            icon: Icons.logout,
            subName: "",
            onPressed: () => {},
            showSwitch: false,
          ),
        ],
      ),
    );
  }

  Widget _settingsButton({
    required String name,
    required IconData icon,
    required String subName,
    required VoidCallback onPressed,
    required bool showSwitch,
    bool showMargin = true,
  }) {
    final double marginTop = showMargin ? 10.0 : 0.0;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 58.0,
        margin: EdgeInsets.only(top: marginTop),
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
                    children: [
                      Icon(
                        icon,
                        color: BlueColor.color10,
                        size: 30.0,
                      ),
                      const SizedBox(width: 14.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              color: GrayColor.color60,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (subName.isNotEmpty)
                            Text(
                              subName,
                              style: const TextStyle(
                                color: GrayColor.color60,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                  if (showSwitch)
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

  Widget _buildRadioMenu({
    required RadioItem values,
    required Function onChange,
    required List options,
  }) {
    return Container(
      width: double.infinity,
      color: GrayColor.color50,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 5.0,
        ),
        child: Column(
          children: options
              .map(
                (data) => RadioListTile(
                  dense: true,
                  visualDensity: const VisualDensity(horizontal: -4.0),
                  title: Text(
                    data.name,
                    style: const TextStyle(
                      color: GrayColor.color60,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  groupValue: values.keyName,
                  value: data.keyName,
                  onChanged: (val) => onChange(
                    RadioItem(name: data.name, keyName: val),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
