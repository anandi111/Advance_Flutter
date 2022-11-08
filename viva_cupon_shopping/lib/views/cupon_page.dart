import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viva_cupon_shopping/controllers/cupon_controller.dart';
import 'package:viva_cupon_shopping/resources/product_list.dart';

class CuponPage extends StatefulWidget {
  const CuponPage({Key? key}) : super(key: key);

  @override
  State<CuponPage> createState() => _CuponPageState();
}

class _CuponPageState extends State<CuponPage> {
  CuponController cuponController = Get.put(CuponController());

  addData() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool('repeat');

    if (repeat == null) {
      await cuponController.insertData(
          id: "ad369", name: "Golden Cuopon", value: 50, quantity: 5);

      await prefs.setBool('repeat', true);
    }
  }

  initState() {
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Cupons",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.keyboard_double_arrow_left,
            color: Colors.grey,
          ),
        ),
      ),
      body: FutureBuilder(
        future: cuponController.fetchAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Map<String, Object?>> data =
                snapshot.data as List<Map<String, Object?>>;

            print(data);
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(bottom: 10, left: 15, right: 15),
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.grey.withOpacity(0.3),
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data[i]["name"].toString(),
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.8),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              Text(
                                "Coupon ID: " + data[i]["id"].toString(),
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Quantity: " + data[i]["quantity"].toString(),
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  "Discount Price: " +
                                      "\$" +
                                      data[i]["value"].toString(),
                                  style: const TextStyle(
                                      color: Colors.orange,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return const Text(
            "No Coupon",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          );
        },
      ),
    );
  }
}
