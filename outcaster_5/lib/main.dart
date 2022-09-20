import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController currentLocationController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController religionController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController biographyController = TextEditingController();
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Your Profile"),
      ),
      body: Stepper(
        currentStep: currentStep,
        steps: [
          Step(
              title: const Text("Profile Picture"),
              isActive: (currentStep >= 0) ? true : false,
              content: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey),
              )),
          Step(
              title: const Text("Name"),
              isActive: (currentStep >= 1) ? true : false,
              content: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: "Enter Your name",
                    prefixIcon: Icon(Icons.person_add_alt)),
              )),
          Step(
              title: const Text("Phone"),
              isActive: (currentStep >= 2) ? true : false,
              content: TextField(
                controller: phoneController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Enter Your Phone Number",
                    prefixIcon: Icon(Icons.phone_outlined)),
              )),
          Step(
              title: const Text("Email"),
              isActive: (currentStep >= 3) ? true : false,
              content: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                    hintText: "Enter Your Email",
                    prefixIcon: Icon(Icons.mail_outline)),
              )),
          Step(
              title: const Text("DOB"),
              isActive: (currentStep >= 4) ? true : false,
              content: TextField(
                controller: dobController,
                decoration: const InputDecoration(
                    hintText: "Enter Your DOB",
                    prefixIcon: Icon(Icons.date_range_outlined)),
              )),
          Step(
              title: const Text("Gender"),
              isActive: (currentStep >= 5) ? true : false,
              content: TextField(
                controller: genderController,
                decoration: const InputDecoration(
                    hintText: "Enter Your Gender",
                    prefixIcon: Icon(Icons.graphic_eq_outlined)),
              )),
          Step(
              title: const Text("Current Location"),
              isActive: (currentStep >= 6) ? true : false,
              content: TextField(
                controller: currentLocationController,
                decoration: InputDecoration(
                    hintText: "Enter Your Current Location",
                    prefixIcon: Icon(Icons.pin_drop_outlined)),
              )),
          Step(
              title: const Text("Nationality"),
              isActive: (currentStep >= 7) ? true : false,
              content: TextField(
                controller: nationalityController,
                decoration: const InputDecoration(
                    hintText: "Enter Your Nationality",
                    prefixIcon: Icon(Icons.location_city_outlined)),
              )),
          Step(
              title: const Text("Religion"),
              isActive: (currentStep >= 8) ? true : false,
              content: TextField(
                controller: religionController,
                decoration: const InputDecoration(
                    hintText: "Enter Your Religion",
                    prefixIcon: Icon(Icons.ac_unit_outlined)),
              )),
          Step(
              title: const Text("Language"),
              isActive: (currentStep >= 9) ? true : false,
              content: TextField(
                controller: languageController,
                decoration: const InputDecoration(
                    hintText: "Enter Your Language",
                    prefixIcon: Icon(Icons.language)),
              )),
          Step(
              title: const Text("Biography"),
              isActive: (currentStep >= 10) ? true : false,
              content: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: "Enter Your Biography",
                    prefixIcon: Icon(Icons.currency_bitcoin_outlined)),
              )),
        ],
        onStepTapped: (val) {
          setState(() {
            currentStep = val;
          });
        },
        controlsBuilder: (BuildContext, _) {
          return Container();
        },
      ),
    );
  }
}
