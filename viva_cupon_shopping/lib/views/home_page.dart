import 'package:flutter/material.dart';
import 'package:viva_cupon_shopping/resources/product_list.dart';
import 'package:viva_cupon_shopping/views/cupon_page.dart';
import 'package:viva_cupon_shopping/views/detail_product_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Welcome",
          style: TextStyle(color: Colors.black),
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
      body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 15, right: 15),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailFoodPage(product: productList[i]),
                      ));
                },
                child: Card(
                  elevation: 5,
                  shadowColor: Colors.grey.withOpacity(0.3),
                  child: Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          width: 150,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(productList[i].photo))),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(productList[i].name,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600)),
                            Row(
                              children: [
                                Text(
                                  "20min",
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.5),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                      color: Colors.grey.withOpacity(0.5),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Text("\$" + productList[i].price.toString(),
                                style: const TextStyle(
                                    color: Colors.orange,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold)),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
