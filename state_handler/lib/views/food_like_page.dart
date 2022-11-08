import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_handler/controllers/food_controller.dart';
import 'package:state_handler/helpers/food_like_helper.dart';
import 'package:state_handler/resources/color.dart';

class LikePage extends StatelessWidget {
  const LikePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodController foodController = Get.put(FoodController());

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
      body: FutureBuilder(
        future: FoodLikeHelper.foodLikeHelper.fetchAllData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
            );
          } else if (snapshot.hasData) {
            List<Map<String, Object?>> data =
                snapshot.data as List<Map<String, Object?>>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onLongPress: () {
                      FoodLikeHelper.foodLikeHelper.deleteData(
                          photo: data[index]["photo"].toString(),
                          price: int.parse(data[index]["price"].toString()));
                    },
                    child: Card(
                      elevation: 5,
                      shadowColor: Colors.grey.withOpacity(0.3),
                      child: Container(
                        height: 190,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Container(
                              height: 120,
                              width: 150,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          data[index]["photo"].toString()))),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data[index]["name"].toString(),
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
                                Text("\$" + data[index]["price"].toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
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
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
