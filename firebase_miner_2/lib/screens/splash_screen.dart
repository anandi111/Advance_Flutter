import 'package:firebase_miner_2/helpers/cloud_firebase_helper.dart';
import 'package:firebase_miner_2/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController nameController = TextEditingController();
  final nameFormKey = GlobalKey<FormState>();
  String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.amberAccent, Colors.white],
            begin: Alignment.topLeft,
          )),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Welcome!!",
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.amber,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: nameFormKey,
                  child: TextFormField(
                    controller: nameController,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter name first...";
                      }
                      return null;
                    },
                    cursorColor: Colors.amber,
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                        hintText: "Enter Your Name"),
                    onSaved: (val) {
                      setState(() {
                        name = val;
                      });
                    },
                    onFieldSubmitted: (val) async {
                      if (nameFormKey.currentState!.validate()) {
                        nameFormKey.currentState!.save();
                        // Obtain shared preferences.
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('name', '$name');
                        await prefs.setInt('counter', 1);

                        /* CloudFirebaseStorage.cloudFirebaseStorage
                            .insertParent(name: name!);*/

                        // ignore: use_build_context_synchronously
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NoteHomePage(name: name!),
                            ),
                            (route) => false);
                      }
                    },
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
