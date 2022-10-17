import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_miner_3/helpers/firebase_database.dart';
import 'package:firebase_miner_3/helpers/firebase_helper.dart';
import 'package:firebase_miner_3/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream<QuerySnapshot> collectionReference =
      FirebaseCRUDOperation.firebaseCRUDOperation.readData();

  TextEditingController authorNameController = TextEditingController();
  TextEditingController authorBookNameController = TextEditingController();
  TextEditingController authorBookContentController = TextEditingController();
  String author = "";
  String authorBookName = "";
  String authorBookContent = "";
  final addBookKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.purple,
        title: const Text("Author Book Registration"),
        actions: [
          IconButton(
              onPressed: () async {
                FirebaseHelper.firebaseHelper.SignOut();

                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isSigned', false);

                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                    (route) => false);
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.purple,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Add Book"),
                  content: Form(
                      key: addBookKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: authorNameController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Name First...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              author = val!;
                            },
                            cursorColor: Colors.purpleAccent,
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purpleAccent)),
                                labelText: "Name",
                                labelStyle: GoogleFonts.poppins(
                                    textStyle:
                                        const TextStyle(color: Colors.grey))),
                          ),
                          TextFormField(
                            controller: authorBookNameController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Book Name First...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              authorBookName = val!;
                            },
                            cursorColor: Colors.purpleAccent,
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purpleAccent)),
                                labelText: "Book Name",
                                labelStyle: GoogleFonts.poppins(
                                    textStyle:
                                        const TextStyle(color: Colors.grey))),
                          ),
                          TextFormField(
                            maxLines: 3,
                            controller: authorBookContentController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Book Content First...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              authorBookContent = val!;
                            },
                            cursorColor: Colors.purpleAccent,
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purpleAccent)),
                                labelText: "Book Content",
                                labelStyle: GoogleFonts.poppins(
                                    textStyle:
                                        const TextStyle(color: Colors.grey))),
                          ),
                        ],
                      )),
                  actions: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.purple),
                        onPressed: () async {
                          if (addBookKey.currentState!.validate()) {
                            Response res = await FirebaseCRUDOperation
                                .firebaseCRUDOperation
                                .addData(
                                    author: authorNameController.text,
                                    book: authorBookNameController.text,
                                    content: authorBookContentController.text);

                            print(res.message);

                            Navigator.pop(context);
                          }
                        },
                        child: Text("Save")),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey.withOpacity(0.3),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Back")),
                  ],
                );
              });
        },
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add),
            Text(
              " Add",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .merge(TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: StreamBuilder(
            stream: collectionReference,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return ListView(
                children: snapshot.data!.docs
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: Material(
                            color: Colors.white,
                            child: Container(
                              height: 180,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Author : ${e["author"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .merge(
                                              TextStyle(color: Colors.purple)),
                                    ),
                                    Text(
                                      "Book : ${e["book"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .merge(
                                            TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                    ),
                                    Text(
                                      "Content : ${e["content"]}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .merge(
                                            TextStyle(color: Colors.black),
                                          ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              );
            }),
      ),
    );
  }
}
