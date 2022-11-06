import 'package:flutter/material.dart';
import 'package:state_handler/modals/food.dart';
import 'package:state_handler/resources/color.dart';

class DetailFoodPage extends StatefulWidget {
  DetailFoodPage({Key? key, required this.food}) : super(key: key);
  Food food;

  @override
  State<DetailFoodPage> createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorGreen,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: colorGreen,
              )),
        ),
        title: const Text("Mangpura, BD",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        actions: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: colorGreen,
                image: const DecorationImage(
                    image: NetworkImage(
                        "https://economictimes.indiatimes.com/thumb/msid-94620188,width-720,height-900,resizemode-4,imgsize-29948/straight-people-just-didnt-show-up-bros-star-billy-eichner-responds-to-disappointing-box-office-opening.jpg?from=mdr"))),
          ),
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
                  fit: BoxFit.fill,
                  image: AssetImage(widget.food.photo),
                )),
              ),
            ),
            Text(
              widget.food.name,
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
              "\$" + widget.food.price,
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: colorGreen),
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
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: colorGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text("Add to Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
