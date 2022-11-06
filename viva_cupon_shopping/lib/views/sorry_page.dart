import 'package:flutter/material.dart';
import 'package:viva_cupon_shopping/views/home_page.dart';

class SorryPage extends StatefulWidget {
  const SorryPage({Key? key}) : super(key: key);

  @override
  State<SorryPage> createState() => _SorryPageState();
}

class _SorryPageState extends State<SorryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ));
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cancel_outlined, color: Colors.red, size: 100),
              SizedBox(
                height: 30,
              ),
              Text(
                "Your Cupon is Invalid",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
