import 'package:flutter/material.dart';
import 'package:viva_cupon_shopping/views/home_page.dart';

class DonePage extends StatefulWidget {
  DonePage({Key? key, required this.totalPrice}) : super(key: key);
  int totalPrice;

  @override
  State<DonePage> createState() => _DonePageState();
}

class _DonePageState extends State<DonePage> {
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
            Icon(Icons.done_outline, color: Colors.blue, size: 100),
            SizedBox(
              height: 30,
            ),
            Text(
              "You Get it in just: " + widget.totalPrice.toString(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        )),
      ),
    );
  }
}
