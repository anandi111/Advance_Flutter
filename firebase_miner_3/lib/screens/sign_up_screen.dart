import 'package:firebase_miner_3/helpers/firebase_helper.dart';
import 'package:firebase_miner_3/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String email = "";
  String password = "";
  final signUpKey = GlobalKey<FormState>();
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
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.7,
                        image: AssetImage(
                            "assets/natalia-yakovleva-Oxl_KBNqxGA-unsplash.jpg"))),
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Welcome,",
                      style: Theme.of(context).textTheme.headline1!.merge(
                          const TextStyle(color: Colors.white, fontSize: 40)),
                    ),
                    Text(
                      "SignUp for better experience..",
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
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Form(
                      key: signUpKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Name First...";
                              }
                              return null;
                            },
                            cursorColor: Colors.purpleAccent,
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purpleAccent)),
                                labelText: "First Name",
                                labelStyle: GoogleFonts.poppins(
                                    textStyle:
                                        const TextStyle(color: Colors.grey))),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Name First...";
                              }
                              return null;
                            },
                            cursorColor: Colors.purpleAccent,
                            decoration: InputDecoration(
                                focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.purpleAccent)),
                                labelText: "Last Name",
                                labelStyle: GoogleFonts.poppins(
                                    textStyle:
                                        const TextStyle(color: Colors.grey))),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "Please Enter Email First...";
                              }
                              return null;
                            },
                            onSaved: (val) {
                              email = val!;
                            },
                            controller: emailController,
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
                    height: 40,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        if (signUpKey.currentState!.validate()) {
                          signUpKey.currentState!.save();
                          await FirebaseHelper.firebaseHelper
                              .SignUp(email: email, password: password);

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                              (route) => false);

                          final prefs = await SharedPreferences.getInstance();
                          await prefs.setBool('isSigned', true);
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
                          child: Text("Sign Up",
                              style: Theme.of(context).textTheme.headline4),
                        ),
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
                                builder: (context) => SignInScreen(),
                              ),
                              (route) => false);
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Already have account?",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .merge(TextStyle(color: Colors.grey)),
                            ),
                            Text(
                              " Sign In",
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
            )
          ],
        ),
      ),
    );
  }
}
