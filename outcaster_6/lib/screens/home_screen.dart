import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController signUpUserNameController = TextEditingController();
  TextEditingController signUpMailIdController = TextEditingController();
  TextEditingController signUpPasswordController = TextEditingController();
  TextEditingController signUpConPasswordController = TextEditingController();
  TextEditingController loginUserNameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper App"),
        backgroundColor: Colors.red,
      ),
      body: Theme(
        data: ThemeData(
          colorScheme: const ColorScheme.light(primary: Colors.red),
        ),
        child: Stepper(
          steps: [
            Step(
              isActive: true,
              title: const Text("SignUp"),
              content: Form(
                key: signUpKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: signUpUserNameController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Username First...";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "Full Name",
                          prefixIcon: Icon(Icons.person_add_alt)),
                    ),
                    TextFormField(
                      controller: signUpMailIdController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Email First...";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: "Email id",
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    TextFormField(
                      controller: signUpPasswordController,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Password First...";
                        }
                        return null;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock_open)),
                    ),
                    TextFormField(
                      controller: signUpConPasswordController,
                      validator: (val) {
                        if (val!.isEmpty ||
                            val != signUpPasswordController.text) {
                          return "Please Enter Correct Password...";
                        }
                        return null;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          hintText: "Confirm Password",
                          prefixIcon: Icon(Icons.lock_open)),
                    )
                  ],
                ),
              ),
            ),
            Step(
              isActive: true,
              title: const Text("Login"),
              content: Form(
                key: loginKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: loginUserNameController,
                      validator: (val) {
                        if (val!.isEmpty ||
                            val != signUpUserNameController.text) {
                          return "Please Enter Corect Username...";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: "User Name",
                          prefixIcon: Icon(Icons.person_add_alt)),
                    ),
                    TextFormField(
                      controller: loginPasswordController,
                      validator: (val) {
                        if (val!.isEmpty ||
                            val != signUpPasswordController.text) {
                          return "Please Enter Correct Password...";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Password",
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                  ],
                ),
              ),
            ),
            const Step(
              title: Text("Home"),
              content: Text("Welcome to Home!!"),
            )
          ],
          onStepContinue: () {
            setState(() {
              // ignore: unrelated_type_equality_checks
              if (currentStep == 0) {
                if (signUpKey.currentState!.validate()) {
                  setState(() {
                    currentStep++;
                  });
                }
              }
              // ignore: unrelated_type_equality_checks
              else if (currentStep == 1) {
                if (loginKey.currentState!.validate()) {
                  setState(() {
                    currentStep++;
                  });
                }
              }
            });
          },
          onStepCancel: () {},
          currentStep: currentStep,
        ),
      ),
    );
  }
}
