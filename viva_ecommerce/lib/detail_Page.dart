import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Detail_page extends StatefulWidget {
  Detail_page(
      {Key? key, required this.name, required this.price, required this.image})
      : super(key: key);
  String name = "";
  String price = "";
  String image = "";

  @override
  _Detail_pageState createState() => _Detail_pageState();
}

class _Detail_pageState extends State<Detail_page> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3065ef),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
              count = 0;
            },
            child: Icon(CupertinoIcons.left_chevron)),
        title: Center(child: Text(widget.name)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 269,
              width: 400,
              child: Image.asset(widget.image),
            ),
            Container(
              height: 450,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 15,
                        blurRadius: 10)
                  ],
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),

                    ///Like Icon And Cart Icon..
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xffdcdcdc)),
                          child: Center(
                              child: Icon(
                            CupertinoIcons.bag,
                            color: Color(0xff3065ef),
                            size: 30,
                          )),
                        ),
                        Spacer(),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff3065ef)),
                          child: Center(
                              child: Icon(
                            CupertinoIcons.suit_heart_fill,
                            color: Colors.white,
                            size: 30,
                          )),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("${widget.name}",
                          style: TextStyle(
                              color: Color(0xff3065ef),
                              fontSize: 25,
                              fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              letterSpacing: 1)),
                    ),

                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Quantity",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            count--;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Colors.indigoAccent.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                CupertinoIcons.minus_circle,
                                color: Colors.indigoAccent,
                                size: 40,
                              ),
                              Text(
                                count.toString(),
                                style: TextStyle(
                                    color: Colors.indigoAccent, fontSize: 20),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    count++;
                                  });
                                },
                                child: Icon(
                                  CupertinoIcons.add_circled,
                                  color: Colors.indigoAccent,
                                  size: 40,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Text("\$${widget.price}",
                            style: TextStyle(
                                color: Color(0xff3065ef),
                                fontSize: 25,
                                fontWeight: FontWeight.w600)),
                        Spacer(),
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                              color: Color(0xff3065ef),
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                            child: Text(
                              "Add to cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
