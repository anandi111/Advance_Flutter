import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient:
                      LinearGradient(colors: [Colors.indigo, Colors.blue]),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Center(
                    child: Icon(
                      CupertinoIcons.color_filter,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.end,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  const SizedBox(
                    height: 280,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Colors.indigo, Colors.blue]),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Center(
                        child: Text(
                      "Login as Maria",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  InkWell(
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.remove('isLogged');
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Logout Sucessfully...")));
                      },
                      child: const Text("Logout"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
