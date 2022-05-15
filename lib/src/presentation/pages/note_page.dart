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
    TextEditingController contentController =
        TextEditingController(text: content == "null" ? "" : content);
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: TextField(
          controller: contentController,
          expands: true,
          minLines: null,
          maxLines: null,
          decoration: InputDecoration(
            hintText: "Enter content here",
          ),
          onChanged: (text) {
            onContentSave(text);
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    TextEditingController titleController = TextEditingController(text: title ?? "");
    return AppBar(
      leading: BackButton(
        onPressed: context.router.pop,
      ),
      title: TextField(
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: "Enter title"
        ),
        controller: titleController,
        onChanged: (text) {
          onTitleSave(text);
        },
      ),
    );
  }
}
