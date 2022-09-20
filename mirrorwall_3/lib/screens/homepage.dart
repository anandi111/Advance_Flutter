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
                  currentUri = "https://www.netflix.com/in/";
                  webViewController!.loadUrl(
                      urlRequest: URLRequest(url: Uri.parse(currentUri)));
                } else if (val == 2) {
                  setState(() {
                    currentUri =
                        "https://www.primevideo.com/?ref_=dvm_pds_amz_in_as_s_g_146";
                    webViewController!.loadUrl(
                        urlRequest: URLRequest(url: Uri.parse(currentUri)));
                  });
                } else if (val == 3) {
                  currentUri = "https://www.hotstar.com/in";
                  webViewController!.loadUrl(
                      urlRequest: URLRequest(url: Uri.parse(currentUri)));
                } else if (val == 4) {
                  currentUri =
                      "https://www.sonyliv.com/subscription?utm_source=google&utm_medium=paid&utm_campaign=IN_MSixSonyLIV_NA_Performance_AlwaysON_Brand_Launch_Search_Subscriptions_India_Apr_2022_V0&utm_content=Brand&gclid=Cj0KCQjwxIOXBhCrARIsAL1QFCY1-gHndF453ayYPnqxIaX1_KYTILyWLsTIKjJTj689uh2VEDhGmGQaAg95EALw_wcB";
                  webViewController!.loadUrl(
                      urlRequest: URLRequest(url: Uri.parse(currentUri)));
                } else if (val == 5) {
                  currentUri = "https://www.jiocinema.com/";
                  webViewController!.loadUrl(
                      urlRequest: URLRequest(url: Uri.parse(currentUri)));
                } else if (val == 6) {
                  currentUri =
                      "https://www.zee5.com/?utm_source=GoogleSearch&utm_medium=Mark_CPA&utm_campaign=Search_SVOD_ZEE5-Brand-ZEE5-Only-Ex-Performance&utm_term=zee5&utm_content=Brand-ZEE5-Only-Ex&gclsrc=aw.ds&gclid=Cj0KCQjwxIOXBhCrARIsAL1QFCbW4Un0pMXqwSucoNxakahb0fZjlu_CA1jOwnVOnXUTl4AFGreBLG0aAivNEALw_wcB";
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
                icon: Icon(CupertinoIcons.tv),
                child: Text("Netflix"),
              ),
              Tab(
                icon: Icon(CupertinoIcons.tv),
                child: Text("Amazon Prime"),
              ),
              Tab(
                icon: Icon(CupertinoIcons.tv),
                child: Text("Disney+Hotstar"),
              ),
              Tab(
                icon: Icon(CupertinoIcons.tv),
                child: Text("Sony LIV"),
              ),
              Tab(
                icon: Icon(CupertinoIcons.tv),
                child: Text("Jio Cinema"),
              ),
              Tab(
                icon: Icon(CupertinoIcons.tv),
                child: Text("ZEE5"),
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
