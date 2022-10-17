import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  PageController _pageController = PageController();

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.lightBackgroundGray,
        elevation: 1,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Container(
            height: 40,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 1,
                    spreadRadius: 2,
                    offset: const Offset(1, 2))
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                Text(
                  "Search for apps & games",
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Icon(
                  Icons.mic_none_rounded,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
        bottom: TabBar(
          // indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
          onTap: (val) {
            setState(() {
              _pageController.animateToPage(val,
                  duration: const Duration(microseconds: 800),
                  curve: Curves.bounceInOut);
            });
          },
          indicatorSize: TabBarIndicatorSize.label, controller: _tabController,
          tabs: const [
            Tab(
              child: Text("For you", style: TextStyle(color: Colors.black)),
            ),
            Tab(
              child: Text("Top charts", style: TextStyle(color: Colors.black)),
            ),
            Tab(
              child: Text("Category", style: TextStyle(color: Colors.black)),
            ),
            Tab(
              child: Text("Events", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.gamepad_outlined), label: "Game"),
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Apps"),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation_outlined), label: "Movies&TV"),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: "Books"),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const ListTile(
                    title: Text("Recommended for you"),
                    trailing: Icon(Icons.chevron_right_sharp),
                  ),
                  SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: CupertinoColors.lightBackgroundGray,
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                        image: AssetImage("assets/nike.png"))),
                              ),
                            ),
                            const Text(
                              " Nike \n 4.5*",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const ListTile(
                    title: Text("New & updated app"),
                    trailing: Icon(Icons.chevron_right_sharp),
                  ),
                  SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: CupertinoColors.lightBackgroundGray,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.asset("assets/facebook.png",
                                    height: 5, width: 5),
                              ),
                            ),
                            const Text(
                              " facebook\n 4.9*",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const ListTile(
                    title: Text("Suggested for you"),
                    trailing: Icon(Icons.chevron_right_sharp),
                  ),
                  SizedBox(
                    height: 180,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: CupertinoColors.lightBackgroundGray,
                                    borderRadius: BorderRadius.circular(20),
                                    image: const DecorationImage(
                                        image:
                                            AssetImage("assets/youtube.png"))),
                              ),
                            ),
                            const Text(
                              " YouTube\n 3.5*",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Container();
              },
            ),
          )
        ],
      ),
    );
  }
}
