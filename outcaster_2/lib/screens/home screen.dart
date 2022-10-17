import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_2/screens/globals.dart';
import 'package:outcaster_2/screens/ios%20list%20tile.dart';

class CupertinoStoreHome extends StatefulWidget {
  const CupertinoStoreHome({Key? key}) : super(key: key);

  @override
  State<CupertinoStoreHome> createState() => _CupertinoStoreHomeState();
}

class _CupertinoStoreHomeState extends State<CupertinoStoreHome> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        resizeToAvoidBottomInset: false,
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home), label: "Products"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.cart), label: "Cart"),
          ],
        ),
        tabBuilder: (BuildContext context, i) {
          if (i == 0) {
            return CupertinoPageScaffold(
              navigationBar: const CupertinoNavigationBar(
                middle: Text("Cupertino Store"),
                backgroundColor: CupertinoColors.extraLightBackgroundGray,
              ),
              resizeToAvoidBottomInset: false,
              child: Column(
                children: [
                  SizedBox(
                    height: 750,
                    child: ListView.builder(
                      itemCount: productList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            CupertinoListTile(
                                title: Text(productList[index].name),
                                leading: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: CupertinoColors.opaqueSeparator,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: AssetImage(
                                              productList[index].image)),
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                trailing: Material(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        cartList.add(ProductDetails(
                                            name: productList[index].name,
                                            price: productList[index].price,
                                            image: productList[index].image));
                                      });

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text("Added into cart...")));
                                    },
                                    child: const Icon(
                                      CupertinoIcons.add_circled,
                                      color: CupertinoColors.systemBlue,
                                    ),
                                  ),
                                ),
                                subtitle:
                                    Text("\$ ${productList[index].price}")),
                            Row(
                              children: [
                                const SizedBox(
                                  width: 80,
                                ),
                                Container(
                                  height: 1,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      color: CupertinoColors.opaqueSeparator,
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          } else if (i == 1) {
            return CupertinoPageScaffold(
                navigationBar: const CupertinoNavigationBar(
                  middle: Padding(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: CupertinoSearchTextField(),
                  ),
                ),
                child: SizedBox(
                  height: 725,
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CupertinoListTile(
                              title: Text(productList[index].name),
                              leading: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: CupertinoColors.opaqueSeparator,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                            productList[index].image)),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  setState(() {
                                    cartList.add(ProductDetails(
                                        name: productList[index].name,
                                        price: productList[index].price,
                                        image: productList[index].image));
                                  });
                                },
                                child: const Icon(
                                  CupertinoIcons.add_circled,
                                  color: CupertinoColors.systemBlue,
                                ),
                              ),
                              subtitle: Text("\$ ${productList[index].price}")),
                          Row(
                            children: [
                              const SizedBox(
                                width: 80,
                              ),
                              Container(
                                height: 1,
                                width: 300,
                                decoration: BoxDecoration(
                                    color: CupertinoColors.opaqueSeparator,
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ));
          }
          return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text("Cart"),
              backgroundColor: CupertinoColors.extraLightBackgroundGray,
            ),
            resizeToAvoidBottomInset: false,
            child: Column(
              children: [
                SizedBox(
                  height: 725,
                  child: ListView.builder(
                    itemCount: cartList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          CupertinoListTile(
                              title: Text(cartList[index].name),
                              leading: Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: CupertinoColors.opaqueSeparator,
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image:
                                            AssetImage(cartList[index].image)),
                                    borderRadius: BorderRadius.circular(5)),
                              ),
                              trailing: const Icon(
                                Icons.done_all,
                                color: Colors.green,
                              ),
                              subtitle: Text("\$ ${cartList[index].price}")),
                          Row(
                            children: [
                              const SizedBox(
                                width: 80,
                              ),
                              Container(
                                height: 1,
                                width: 300,
                                decoration: BoxDecoration(
                                    color: CupertinoColors.opaqueSeparator,
                                    borderRadius: BorderRadius.circular(2)),
                              ),
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        });
  }
}
