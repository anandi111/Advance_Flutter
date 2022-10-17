import 'package:firebase_miner_3/screens/home_page.dart';
import 'package:firebase_miner_3/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/firebase_helper.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String email = "";
  String password = "";
  final signInKey = GlobalKey<FormState>();
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.purpleAccent,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.7,
                        image: AssetImage(
                            "assets/andrew-seaman--m88z7ily-w-unsplash.jpg"))),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Welcome Back!",
                      style: Theme.of(context).textTheme.headline1!.merge(
                          const TextStyle(color: Colors.white, fontSize: 40)),
                    ),
                    Text(
                      "SignIn for continue..",
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .merge(TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Form(
                      key: signInKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: emailController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Email First...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              email = val!;
                            },
                            cursorColor: Colors.purpleAccent,
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purpleAccent)),
                                labelText: "Email",
                                labelStyle: GoogleFonts.poppins(
                                    textStyle:
                                        const TextStyle(color: Colors.grey))),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: passController,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Password First...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              password = val!;
                            },
                            cursorColor: Colors.purpleAccent,
                            obscureText: isSecure,
                            decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSecure = !isSecure;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.remove_red_eye_rounded,
                                      color: Colors.grey,
                                    )),
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purpleAccent)),
                                labelText: "Password",
                                labelStyle: GoogleFonts.poppins(
                                    textStyle:
                                        const TextStyle(color: Colors.grey))),
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 70,
                  ),
                  InkWell(
                    onTap: () async {
                      if (signInKey.currentState!.validate()) {
                        signInKey.currentState!.save();
                        await FirebaseHelper.firebaseHelper
                            .SignIn(email: email, password: password);

                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool('isSigned', true);

                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                            (route) => false);
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text("Sign In",
                            style: Theme.of(context).textTheme.headline4),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
                              ),
                              (route) => false);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Don't have account?",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .merge(TextStyle(color: Colors.grey)),
                            ),
                            Text(
                              " Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .merge(TextStyle(color: Colors.red)),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
