import 'package:flutter/material.dart';
import 'appbar.dart';
import 'app_body.dart';

class NoteDetail extends StatelessWidget {
  const NoteDetail({super.key, required this.note});
  final dynamic note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, note),
      body: buildBody(context, note),
    );
  }
}
