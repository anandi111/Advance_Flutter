import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state_handler/controllers/food_controller.dart';
import 'package:state_handler/helpers/food_like_helper.dart';
import 'package:state_handler/resources/color.dart';
import 'package:state_handler/resources/food_list.dart';
import 'package:state_handler/views/detail_food_page.dart';
import 'package:state_handler/views/food_cart_page.dart';
import 'package:state_handler/views/food_like_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FoodController foodController = Get.put(FoodController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colorGreen,
          ),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
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
          const SizedBox(
            width: 5,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            child: IconButton(
                onPressed: () {
                  Get.to(() => const LikePage());
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi Rinku",
                    style: TextStyle(
                      color: colorGreen,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                  const Text(
                    "Find your food",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            color: colorGreen,
                          ),
                          filled: true,
                          fillColor: Colors.grey.withOpacity(0.2),
                          border: InputBorder.none,
                          hintText: "Search Food",
                          suffixIcon: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: colorGreen,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.filter_alt,
                                  color: Colors.white,
                                )),
                          )),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 15,
                child: GridView.builder(
                    itemCount: foodList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (200 / 350),
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, i) {
                      return Container(
                        height: 300,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 100,
                                ),
                                IconButton(
                                  onPressed: () {
                                    FoodLikeHelper.foodLikeHelper
                                        .insertData(id: 1, food: foodList[i]);
                                  },
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(() => DetailFoodPage(food: foodList[i]));
                              },
                              child: Container(
                                height: 120,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(foodList[i].photo))),
                              ),
                            ),
                            Text(
                              foodList[i].name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 18,
                                ),
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
                            Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  foodList[i].price.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: colorGreen,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                      )),
                                  child: IconButton(
                                    onPressed: () {
                                      foodController.insertFood(
                                          id: 1, food: foodList[i]);
                                      Get.snackbar("Insert Item",
                                          "1 item added into cart.");
                                    },
                                    icon: Icon(Icons.add, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorGreen,
        onPressed: () {
          Get.to(() => CartPage());
        },
        child: const Icon(
          Icons.shopping_cart,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: colorGreen), label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.keyboard,
                color: Colors.grey,
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.grey,
              ),
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.grey,
              ),
              label: ""),
        ],
      ),
    );
  }
}
