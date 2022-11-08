import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva_cupon_shopping/controllers/cupon_controller.dart';
import 'package:viva_cupon_shopping/modals/product.dart';
import 'package:viva_cupon_shopping/views/buy_page.dart';
import 'package:viva_cupon_shopping/views/cupon_page.dart';

class DetailFoodPage extends StatefulWidget {
  DetailFoodPage({Key? key, required this.product}) : super(key: key);
  Product product;

  @override
  State<DetailFoodPage> createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  CuponController cuponController = Get.put(CuponController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Text(
          "Welcome",
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
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CuponPage(),
                  ));
            },
            icon: Icon(Icons.add_box_outlined),
            color: Colors.orange,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.product.photo),
                )),
              ),
            ),
            Text(
              widget.product.name,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Text(
                  "20min",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  "4.5",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.5),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Text(
              "\$" + widget.product.price.toString(),
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            Text(
              "About Food",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: TextStyle(
                color: Colors.grey.withOpacity(0.5),
                fontSize: 18,
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BuyPage(product: widget.product),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text("Order Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
