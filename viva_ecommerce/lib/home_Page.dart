import 'package:flutter/material.dart';
import 'package:viva_ecommerce/detail_Page.dart';
import 'book.dart';
import 'electronics.dart';
import 'fashion.dart';
import 'home_applienes.dart';
import 'logic.dart';
import 'package:flutter/cupertino.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3065ef),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),

            ///Title...
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "    Explore Product",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            ///Cameravali Row...
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 70,
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: Row(
                      children: const[
                         SizedBox(
                          width: 5,
                        ),
                       Icon(
                          CupertinoIcons.search,
                          size: 30,
                          color: Colors.grey,
                        ),
                         Text(
                          "  Apple Product",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 70,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: const Center(
                    child: Icon(
                      CupertinoIcons.camera,
                      size: 30,
                      color: const Color(0xff3065ef),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),

            ///Iconvali Line...
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ///1 line..
                InkWell(
                  onTap: () {
                    colorCon1 = Colors.white;
                    colorCon2 = Colors.indigoAccent;
                    colorCon3 = Colors.indigoAccent;
                    colorCon4 = Colors.indigoAccent;
                    colorCon5 = Colors.indigoAccent;
                    colorIcon1 = Colors.indigoAccent;
                    colorIcon2 = Colors.white;
                    colorIcon3 = Colors.white;
                    colorIcon4 = Colors.white;
                    colorIcon5 = Colors.white;
                    setState(() {});

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const MyApp()));
                  },
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: colorCon1,
                      ),
                      child: Icon(
                        CupertinoIcons.square_grid_2x2,
                        color: colorIcon1,
                      )),
                ),

                ///2 Line...
                InkWell(
                  onTap: () {
                    colorCon1 = Colors.indigoAccent;
                    colorCon2 = Colors.white;
                    colorCon3 = Colors.indigoAccent;
                    colorCon4 = Colors.indigoAccent;
                    colorCon5 = Colors.indigoAccent;
                    colorIcon1 = Colors.white;
                    colorIcon2 = Colors.indigoAccent;
                    colorIcon3 = Colors.white;
                    colorIcon4 = Colors.white;
                    colorIcon5 = Colors.white;
                    setState(() {});

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Electronic_Page()));
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: colorCon2,
                    ),
                    child: Icon(
                      Icons.electrical_services_sharp,
                      color: colorIcon2,
                      size: 25,
                    ),
                  ),
                ),

                ///3 Line..
                InkWell(
                  onTap: () {
                    colorCon1 = Colors.indigoAccent;
                    colorCon2 = Colors.indigoAccent;
                    colorCon3 = Colors.white;
                    colorCon4 = Colors.indigoAccent;
                    colorCon5 = Colors.indigoAccent;
                    colorIcon1 = Colors.white;
                    colorIcon2 = Colors.white;
                    colorIcon3 = Colors.indigoAccent;
                    colorIcon4 = Colors.white;
                    colorIcon5 = Colors.white;
                    setState(() {});

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Fashion_Page()));
                  },
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: colorCon3,
                      ),
                      child: Icon(
                        CupertinoIcons.circle_grid_hex,
                        color: colorIcon3,
                      )),
                ),

                ///4 Line..
                InkWell(
                  onTap: () {
                    colorCon1 = Colors.indigoAccent;
                    colorCon2 = Colors.indigoAccent;
                    colorCon3 = Colors.indigoAccent;
                    colorCon4 = Colors.white;
                    colorCon5 = Colors.indigoAccent;
                    colorIcon1 = Colors.white;
                    colorIcon2 = Colors.white;
                    colorIcon3 = Colors.white;
                    colorIcon4 = Colors.indigoAccent;
                    colorIcon5 = Colors.white;
                    setState(() {});

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Home_Applienes()));
                  },
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: colorCon4,
                      ),
                      child: Icon(
                        CupertinoIcons.headphones,
                        color: colorIcon4,
                      )),
                ),

                ///5 Line...
                InkWell(
                  onTap: () {
                    colorCon1 = Colors.indigoAccent;
                    colorCon2 = Colors.indigoAccent;
                    colorCon3 = Colors.indigoAccent;
                    colorCon4 = Colors.indigoAccent;
                    colorCon5 = Colors.white;
                    colorIcon1 = Colors.white;
                    colorIcon2 = Colors.white;
                    colorIcon3 = Colors.white;
                    colorIcon4 = Colors.white;
                    colorIcon5 = Colors.indigoAccent;
                    setState(() {});

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Book_Page()));
                  },
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: colorCon5,
                      ),
                      child: Icon(
                        CupertinoIcons.book,
                        color: colorIcon5,
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            Row(
              children: const[
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Cards",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
               SizedBox(
                  width: 20,
                ),
                Text(
                  "List",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),

            ///Main Productvali Line..
            SizedBox(
              height: 390,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 390,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  addToFavList.add()
                                },
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: const Color(0xffdcdcdc)),
                                  child: const Center(
                                      child: Icon(
                                    CupertinoIcons.suit_heart_fill,
                                    color: Color(0xff3065ef),
                                    size: 30,
                                  )),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff3065ef)),
                                child: const Center(
                                    child: Icon(
                                  CupertinoIcons.bag,
                                  color: Colors.white,
                                  size: 30,
                                )),
                              ),
                            ],
                          ),
                          Container(
                            height: 180,
                            width: 180,
                            color: Colors.white,
                            child: Image.asset(productList[0]["Product Image"]),
                          ),
                          Text(
                            "\$${productList[0]["Product Price"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              productList[0]["Product Name"],
                              style: const TextStyle(
                                color: Color(0xff3065ef),
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: const[
                               Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 20,
                              ),
                               SizedBox(
                                width: 5,
                              ),
                               Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                               SizedBox(
                                width: 5,
                              ),
                              Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                             SizedBox(
                                width: 5,
                              ),
                               Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                               Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail_page(
                                          image: productList[0]
                                              ["Product Image"],
                                          name: productList[0]["Product Name"],
                                          price: productList[0]
                                              ["Product Price"])));
                            },
                            child: const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                " see the details >",
                                style: const TextStyle(
                                  color: Color(0xff3065ef),
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 390,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffdcdcdc)),
                                child: const Center(
                                    child: Icon(
                                  CupertinoIcons.suit_heart_fill,
                                  color: Color(0xff3065ef),
                                  size: 30,
                                )),
                              ),
                              const Spacer(),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff3065ef)),
                                child: const Center(
                                    child: const Icon(
                                  CupertinoIcons.bag,
                                  color: Colors.white,
                                  size: 30,
                                )),
                              ),
                            ],
                          ),
                          Container(
                            height: 180,
                            width: 180,
                            color: Colors.white,
                            child: Image.asset(productList[1]["Product Image"]),
                          ),
                          Text(
                            "\$${productList[1]["Product Price"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              productList[1]["Product Name"],
                              style: const TextStyle(
                                color: Color(0xff3065ef),
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail_page(
                                          image: productList[1]
                                              ["Product Image"],
                                          name: productList[1]["Product Name"],
                                          price: productList[1]
                                              ["Product Price"])));
                            },
                            child: const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                " see the details >",
                                style: TextStyle(
                                  color: Color(0xff3065ef),
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 390,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffdcdcdc)),
                                child: const Center(
                                    child: const Icon(
                                  CupertinoIcons.suit_heart_fill,
                                  color: Color(0xff3065ef),
                                  size: 30,
                                )),
                              ),
                              const Spacer(),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xff3065ef)),
                                child: const Center(
                                    child: Icon(
                                  CupertinoIcons.bag,
                                  color: Colors.white,
                                  size: 30,
                                )),
                              ),
                            ],
                          ),
                          Container(
                            height: 180,
                            width: 180,
                            color: Colors.white,
                            child: Image.asset(productList[2]["Product Image"]),
                          ),
                          Text(
                            "\$${productList[2]["Product Price"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              productList[2]["Product Name"],
                              style: const TextStyle(
                                color: Color(0xff3065ef),
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail_page(
                                          image: productList[2]
                                              ["Product Image"],
                                          name: productList[2]["Product Name"],
                                          price: productList[2]
                                              ["Product Price"])));
                            },
                            child: const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                " see the details >",
                                style: TextStyle(
                                  color: Color(0xff3065ef),
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 390,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xffdcdcdc)),
                                child: const Center(
                                    child: Icon(
                                  CupertinoIcons.suit_heart_fill,
                                  color: Color(0xff3065ef),
                                  size: 30,
                                )),
                              ),
                              const Spacer(),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff3065ef)),
                                child: const Center(
                                    child: Icon(
                                  CupertinoIcons.bag,
                                  color: Colors.white,
                                  size: 30,
                                )),
                              ),
                            ],
                          ),
                          Container(
                            height: 180,
                            width: 180,
                            color: Colors.white,
                            child: Image.asset(productList[3]["Product Image"]),
                          ),
                          Text(
                            "\$${productList[3]["Product Price"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              productList[3]["Product Name"],
                              style: const TextStyle(
                                color: const Color(0xff3065ef),
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail_page(
                                          image: productList[3]
                                              ["Product Image"],
                                          name: productList[3]["Product Name"],
                                          price: productList[3]
                                              ["Product Price"])));
                            },
                            child: const Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                " see the details >",
                                style: const TextStyle(
                                  color: Color(0xff3065ef),
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 390,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xffdcdcdc)),
                                child: const Center(
                                    child: Icon(
                                  CupertinoIcons.suit_heart_fill,
                                  color: Color(0xff3065ef),
                                  size: 30,
                                )),
                              ),
                              const Spacer(),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff3065ef)),
                                child: const Center(
                                    child: const Icon(
                                  CupertinoIcons.bag,
                                  color: Colors.white,
                                  size: 30,
                                )),
                              ),
                            ],
                          ),
                          Container(
                            height: 180,
                            width: 180,
                            color: Colors.white,
                            child: Image.asset(productList[4]["Product Image"]),
                          ),
                          Text(
                            "\$${productList[4]["Product Price"]}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              productList[4]["Product Name"],
                              style: const TextStyle(
                                color: Color(0xff3065ef),
                                fontSize: 25,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 20,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Icon(
                                CupertinoIcons.star_fill,
                                color: Colors.amber,
                                size: 18,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Detail_page(
                                          image: productList[4]
                                              ["Product Image"],
                                          name: productList[4]["Product Name"],
                                          price: productList[4]
                                              ["Product Price"])));
                            },
                            child: const Align(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                " see the details >",
                                style: TextStyle(
                                  color: Color(0xff3065ef),
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            ///Three Iconvalu Container....
            Container(
              height: 80,
              width: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.indigo.withOpacity(0.8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                        child: Icon(
                      CupertinoIcons.suit_heart,
                      color: Colors.indigoAccent,
                      size: 35,
                    )),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                        child: Icon(
                      CupertinoIcons.slider_horizontal_3,
                      color: Colors.indigoAccent,
                      size: 35,
                    )),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                        child: Icon(
                      CupertinoIcons.bag,
                      color: Colors.indigoAccent,
                      size: 35,
                    )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
