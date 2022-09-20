import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var currentUri = "https://www.google.com/";
  InAppWebViewController? webViewController;
  int bottomNavBarIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TabBar(
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.orange,
            controller: _tabController,
            indicatorColor: Colors.orange,
            isScrollable: true,
            onTap: (val) {
              setState(() {
                if (val == 0) {
                  currentUri = "https://www.google.com/";
                  webViewController!.loadUrl(
                      urlRequest: URLRequest(url: Uri.parse(currentUri)));
                } else if (val == 1) {
                  currentUri =
                      "https://www.vedantu.com/course/ai-live-sf?utm_source=google&utm_medium=cpc&utm_campaign=Search_AILive_Brand_Generic&utm_term=vedantu&utm_content=Brand_Exact&gclid=Cj0KCQjw2_OWBhDqARIsAAUNTTFXRvlBTx2sg7G5K1nOdxErUo2DIB0_-2jR6K3Qj0xN77lToygS8nwaAgQlEALw_wcB";
                  webViewController!.loadUrl(
                      urlRequest: URLRequest(url: Uri.parse(currentUri)));
                } else if (val == 2) {
                  setState(() {
                    currentUri = "https://www.w3schools.com/";
                    webViewController!.loadUrl(
                        urlRequest: URLRequest(url: Uri.parse(currentUri)));
                  });
                } else if (val == 3) {
                  currentUri = "https://www.toppr.com/";
                  webViewController!.loadUrl(
                      urlRequest: URLRequest(url: Uri.parse(currentUri)));
                } else if (val == 4) {
                  currentUri =
                      "https://byjus.com/byjus-classes-book-free-60-mins-class/?utm_source=google&utm_mode=CPA&utm_campaign=K10-IN-Brand-BYJU%27S-USD-Exact&utm_term=byju%27s&gclid=Cj0KCQjw2_OWBhDqARIsAAUNTTGiBj9mjPFrGoiS5zFmluMaQFzwqR58qSVosGMLtVUpm3xLU2EDmBoaAoqvEALw_wcB";
                  webViewController!.loadUrl(
                      urlRequest: URLRequest(url: Uri.parse(currentUri)));
                } else if (val == 5) {
                  currentUri = "https://www.khanacademy.org/";
                  webViewController!.loadUrl(
                      urlRequest: URLRequest(url: Uri.parse(currentUri)));
                } else if (val == 6) {
                  currentUri = "https://logrocket.com/";
                  webViewController!.loadUrl(
                      urlRequest: URLRequest(url: Uri.parse(currentUri)));
                }
              });
            },
            tabs: const [
              Tab(
                icon: Icon(
                  CupertinoIcons.search,
                ),
                child: Text("Google"),
              ),
              Tab(
                icon: Icon(CupertinoIcons.book),
                child: Text("Vedantu"),
              ),
              Tab(
                icon: Icon(CupertinoIcons.book),
                child: Text("W3School"),
              ),
              Tab(
                icon: Icon(CupertinoIcons.book),
                child: Text("Toppr"),
              ),
              Tab(
                icon: Icon(CupertinoIcons.book),
                child: Text("BYJU'S"),
              ),
              Tab(
                icon: Icon(CupertinoIcons.book),
                child: Text("Khan Acedemy"),
              ),
              Tab(
                icon: Icon(CupertinoIcons.book),
                child: Text("LogRocket"),
              ),
            ],
          ),
          BottomNavigationBar(
              currentIndex: bottomNavBarIndex,
              onTap: (val) {
                setState(() {
                  bottomNavBarIndex = val;
                  if (val == 0) {
                    webViewController!.goBack();
                  } else if (val == 1) {
                    webViewController!.reload();
                  } else if (val == 2) {
                    webViewController!.goForward();
                  }
                });
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.chevron_left_2), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.refresh), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.chevron_right_2), label: ""),
              ])
        ],
      ),
      body: SafeArea(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(currentUri)),
          initialOptions: options,
          onLoadStart: (controller, url) {
            setState(() {
              currentUri = url.toString();
            });
          },
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
        ),
      ),
    );
  }
}
