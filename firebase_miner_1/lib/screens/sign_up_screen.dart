import 'package:firebase_miner_1/helpers/firebase_helper.dart';
import 'package:firebase_miner_1/screens/home_page.dart';
import 'package:firebase_miner_1/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 70,
              ),
              Text(
                "Welcome,",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .merge(TextStyle(color: Colors.teal)),
              ),
              Text(
                "SignUp for better experience..",
                style: Theme.of(context).textTheme.headline3,
              ),
              const SizedBox(
                height: 40,
              ),
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
                        cursorColor: Colors.tealAccent,
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.tealAccent)),
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
                        cursorColor: Colors.tealAccent,
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.tealAccent)),
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
                        cursorColor: Colors.tealAccent,
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.tealAccent)),
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
                        cursorColor: Colors.tealAccent,
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
                                    BorderSide(color: Colors.tealAccent)),
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
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal,
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
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                    ),
                  ),
                  Text(
                    "  Or Sign Up With  ",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .merge(TextStyle(color: Colors.teal)),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      await FirebaseHelper.firebaseHelper.signInWithGoogle();

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ),
                          (route) => false);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.teal, width: 1),
                          image: const DecorationImage(
                              scale: 38,
                              image: NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png"))),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.teal, width: 1),
                        image: const DecorationImage(
                            scale: 40,
                            image: NetworkImage(
                                "https://www.vhv.rs/dpng/d/404-4043080_facebook-logo-png-transparent-vector-transparent-facebook-logo.png"))),
                  )
                ],
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
        ),
      ),
    );
  }
}
