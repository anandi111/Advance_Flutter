import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  InAppWebViewController? webViewController;
  late PullToRefreshController pullToRefreshController;
  final searchController = TextEditingController();
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));
  dynamic currentUrl = "https://www.google.com/";
  List bookMark = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    pullToRefreshController = PullToRefreshController(
        onRefresh: () {
          if (Platform.isAndroid) {
            webViewController!.reload();
          } else if (Platform.isIOS) {
            webViewController!.reload();
          }
        },
        options: PullToRefreshOptions(
          color: Colors.blue,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        title: Container(
          decoration: BoxDecoration(
              color: CupertinoColors.opaqueSeparator.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10)),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      currentUrl = "https://www.google.com/";
                      webViewController!.loadUrl(
                          urlRequest: URLRequest(url: Uri.parse(currentUrl)));
                    });
                  },
                  icon: const Icon(
                    CupertinoIcons.home,
                    color: CupertinoColors.darkBackgroundGray,
                  )),
              border: InputBorder.none,
            ),
            controller: searchController,
            keyboardType: TextInputType.url,
            onSubmitted: (value) {
              var url = Uri.parse(value);
              if (url.scheme.isEmpty) {
                url = Uri.parse("https://www.google.com/search?q=" + value);
                currentUrl = url;
              }
              webViewController?.loadUrl(
                  urlRequest: URLRequest(url: currentUrl));
            },
          ),
        ),
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        indicatorColor: CupertinoColors.darkBackgroundGray,
        labelColor: Colors.blue,
        indicatorSize: TabBarIndicatorSize.label,
        onTap: (val) async {
          if (val == 0) {
            webViewController!.goBack();
          } else if (val == 1) {
            webViewController!.goForward();
          } else if (val == 2) {
            bookMark.add(currentUrl.toString());

            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
                "BookMark Sucessfully Added...",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: CupertinoColors.darkBackgroundGray,
            ));
          } else if (val == 4) {
            showModalBottomSheet(
                backgroundColor: CupertinoColors.opaqueSeparator,
                context: context,
                builder: (context) {
                  return Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    scrollable: true,
                                    title: const Text("Marked"),
                                    content: Column(
                                      children: List.generate(
                                          bookMark.length,
                                          (index) => Column(
                                                children: [
                                                  ListTile(
                                                    trailing: IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            bookMark.removeAt(
                                                                index);
                                                          });
                                                          Navigator.of(context)
                                                              .pop();
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(const SnackBar(
                                                                  duration:
                                                                      Duration(
                                                                          seconds:
                                                                              2),
                                                                  content: Text(
                                                                      "Bookmak Remove Sucessfully...")));
                                                        },
                                                        icon: const Icon(
                                                          Icons
                                                              .delete_outline_outlined,
                                                          color: Colors.red,
                                                        )),
                                                    subtitle:
                                                        Text(bookMark[index]),
                                                    onTap: () {
                                                      setState(() {
                                                        currentUrl =
                                                            bookMark[index];
                                                      });
                                                      webViewController!.loadUrl(
                                                          urlRequest: URLRequest(
                                                              url: Uri.parse(
                                                                  currentUrl)));
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  const SizedBox(
                                                    height: 5,
                                                  )
                                                ],
                                              )),
                                    ),
                                  );
                                });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: const Center(
                                    child: Text(
                                  "Show All Bookmarks",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ))),
                          )),
                    ],
                  );
                });
          }

          if (val == 3) {
            await Share.share('check out my website https://example.com',
                subject: 'Look what I made!');
          }
        },
        tabs: const [
          Tab(
            icon: Icon(
              CupertinoIcons.left_chevron,
            ),
          ),
          Tab(
            icon: Icon(
              CupertinoIcons.right_chevron,
            ),
          ),
          Tab(
            icon: Icon(
              CupertinoIcons.bookmark,
            ),
          ),
          Tab(
            icon: Icon(
              CupertinoIcons.share,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.more_horiz,
            ),
          ),
        ],
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(currentUrl)),
        initialOptions: options,
        onLoadStart: (controller, url) {
          setState(() {
            currentUrl = url.toString();
          });
        },
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        pullToRefreshController: pullToRefreshController,
        onLoadStop: (controller, url) async {
          pullToRefreshController.endRefreshing();
        },
        onLoadError: (controller, url, code, message) {
          pullToRefreshController.endRefreshing();
        },
      ),
    );
  }
}
