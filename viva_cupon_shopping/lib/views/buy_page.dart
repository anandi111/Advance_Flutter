import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva_cupon_shopping/controllers/cupon_controller.dart';
import 'package:viva_cupon_shopping/modals/product.dart';
import 'package:viva_cupon_shopping/views/done_page.dart';
import 'package:viva_cupon_shopping/views/sorry_page.dart';

class BuyPage extends StatefulWidget {
  BuyPage({Key? key, required this.product}) : super(key: key);
  Product product;

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  CuponController cuponController = Get.put(CuponController());
  TextEditingController idController = TextEditingController();
  var fetchData;

  int? showResult({required List<Map<String, Object?>> data}) {
    for (int i = 0; i < data.length; i++) {
      if (idController.text == data[i]["id"].toString()) {
        var total =
            widget.product.price - int.parse(data[i]["value"].toString());

        if (int.parse(data[i]["quantity"].toString()) == 0) {
          cuponController.deletingData(id: data[i]["id"].toString());
        } else if (int.parse(data[i]["quantity"].toString()) == 1) {
          cuponController.updateData(
              quantity: int.parse(data[i]["quantity"].toString()) - 1,
              name: data[i]["name"].toString());
          cuponController.deletingData(id: data[i]["id"].toString());
        } else {
          cuponController.updateData(
              quantity: int.parse(data[i]["quantity"].toString()) - 1,
              name: data[i]["name"].toString());
        }

        return total;
      }
    }
  }

  getData() {
    fetchData = cuponController.fetchAllData();
  }

  initState() {
    super.initState();
    getData();
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
          "Buy",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_double_arrow_left,
            color: Colors.grey,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Product Detail",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 25,
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(widget.product.photo))),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.product.name,
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.8),
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "\$" + widget.product.price.toString(),
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.5),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Use Cupon Id for purchase:",
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: cuponController.fetchAllData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text(
                    "No Coupons",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  );
                } else if (snapshot.hasData) {
                  List<Map<String, Object?>> data =
                      snapshot.data as List<Map<String, Object?>>;

                  return Column(
                    children: [
                      TextField(
                        controller: idController,
                        onSubmitted: (val) async {
                          int? total = showResult(data: data);
                          print(total);
                          if (total == null) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SorryPage(),
                                ),
                                (route) => false);
                          } else {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DonePage(totalPrice: total),
                                ),
                                (route) => false);
                          }
                        },
                      ),
                    ],
                  );
                }
                return const Text(
                  "No Coupon",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
