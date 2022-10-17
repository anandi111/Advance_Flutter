import 'package:firebase_miner_1/helpers/firebase_helper.dart';
import 'package:firebase_miner_1/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.tealAccent, Colors.white],
                begin: Alignment.topLeft)),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Welcome to Home!!",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .merge(TextStyle(color: Colors.teal))),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                FirebaseHelper.firebaseHelper.SignOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInScreen(),
                    ),
                    (route) => false);
              },
              child: Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey, width: 1),
                ),
                child: Center(
                    child: Text(
                  "Logout",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .merge(TextStyle(color: Colors.teal)),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
