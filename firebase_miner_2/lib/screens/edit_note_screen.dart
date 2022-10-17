import 'package:firebase_miner_2/helpers/cloud_firebase_helper.dart';
import 'package:firebase_miner_2/helpers/firebase_database.dart';
import 'package:firebase_miner_2/modals/todos_modal.dart';
import 'package:flutter/material.dart';

class EditNoteScreen extends StatefulWidget {
  EditNoteScreen(
      {Key? key, required this.title, required this.content, required this.uid})
      : super(key: key);
  String title;
  String content;
  dynamic uid;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    contentController.text = widget.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  Response res = await FirebaseCRUDOperation
                      .firebaseCRUDOperation
                      .updateData(
                          title: titleController.text,
                          content: contentController.text,
                          docId: widget.uid);

                  print(res.message);
                }
              },
              icon: const Icon(
                Icons.done,
                color: Colors.black,
              )),
        ],
        leading: IconButton(
            onPressed: () async {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.keyboard_double_arrow_left,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter title";
                    }
                    return null;
                  },
                  cursorColor: Colors.amber,
                  controller: titleController,
                  style: const TextStyle(fontSize: 35, color: Colors.amber),
                  decoration: const InputDecoration(
                    hintText: "Title",
                    border: InputBorder.none,
                  ),
                ),
                TextField(
                  cursorColor: Colors.amber,
                  controller: contentController,
                  maxLines: 15,
                  style: TextStyle(height: 2.5),
                  decoration: const InputDecoration(
                    hintText: "Start Typing....",
                    border: InputBorder.none,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
