import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_miner_2/helpers/cloud_firebase_helper.dart';
import 'package:firebase_miner_2/helpers/firebase_database.dart';
import 'package:firebase_miner_2/screens/add_note_screen.dart';
import 'package:firebase_miner_2/screens/edit_note_screen.dart';
import 'package:flutter/material.dart';

class NoteHomePage extends StatefulWidget {
  NoteHomePage({Key? key, required this.name}) : super(key: key);
  String name;

  @override
  State<NoteHomePage> createState() => _NoteHomePageState();
}

class _NoteHomePageState extends State<NoteHomePage> {
  Stream<QuerySnapshot> collectionReference =
      FirebaseCRUDOperation.firebaseCRUDOperation.readData();

  void initState() {
    super.initState();
    print(widget.name);
    CloudFirebaseStorage.cloudFirebaseStorage
        .selectData(nameParent: widget.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(-20),
            bottomRight: Radius.circular(-20),
          )),
          toolbarHeight: 95,
          title: TextField(
            onChanged: (val) {
              setState(() {
                collectionReference = FirebaseCRUDOperation
                    .firebaseCRUDOperation
                    .searchData(searchKey: val);
              });
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.transparent)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.transparent)),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.white,
                hintText: "Search notes",
                prefixIcon: Icon(Icons.search)),
          ),
          elevation: 0,
          backgroundColor: Colors.amber,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNoteScreen(),
                ));
          },
          child: Icon(Icons.add),
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
                            child: ListTile(
                              onLongPress: () {},
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditNoteScreen(
                                          title: e["title"],
                                          content: e["content"],
                                          uid: e.id),
                                    ));
                              },
                              shape: BeveledRectangleBorder(
                                //<-- SEE HERE
                                side: const BorderSide(
                                    width: 0.5, color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              tileColor: Colors.transparent,
                              trailing: IconButton(
                                onPressed: () async {
                                  showModalBottomSheet(
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) {
                                        return Container(
                                          height: 220,
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              const Text(
                                                "Delete note",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black),
                                              ),
                                              const Text(
                                                "Delete 1 item?",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        width: 150,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.grey
                                                              .withOpacity(0.2),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Material(
                                                    color: Colors.transparent,
                                                    child: InkWell(
                                                      onTap: () async {
                                                        FirebaseCRUDOperation
                                                            .firebaseCRUDOperation
                                                            .deleteData(
                                                                docId: e.id);

                                                        Navigator.pop(context);
                                                      },
                                                      child: Container(
                                                        height: 50,
                                                        width: 150,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.amber,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                        ),
                                                        child: const Center(
                                                          child: Text(
                                                            "Delete",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                                icon: const Icon(Icons.delete_outline_outlined,
                                    color: Colors.redAccent),
                              ),
                              title: Text(e["title"]),
                              subtitle: Text(e["content"]),
                            ),
                          ))
                      .toList(),
                );
              }),
        ));
  }
}
