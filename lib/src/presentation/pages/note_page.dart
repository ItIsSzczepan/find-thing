import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NotePage extends StatelessWidget {
  final int id;
  final String title, content;
  final Function(String) onTitleSave, onContentSave;

  const NotePage(
      {Key? key,
      @PathParam('areaId') required this.id,
      required this.title,
      required this.content,
      required this.onTitleSave,
      required this.onContentSave})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
