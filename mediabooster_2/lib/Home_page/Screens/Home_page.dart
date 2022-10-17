import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mediabooster_2/Home_page/Widget/logic.dart';
import 'package:mediabooster_2/full_view_page.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  PageController _pageController = PageController();
  String Resource = "assest/bare-necessities-song-scene-the-jungle-book-2.mp4";
  List<VideoPlayerController> controllers = [];
  List<ChewieController> chewieControllers = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this);
    List.generate(
        6,
        (index) => controllers
            .add(VideoPlayerController.asset(videoList[index].Resource)));
    List.generate(
        6,
        (index) =>
            controllers[index].initialize().then((value) => setState(() {})));
    List.generate(
        6,
        (index) => chewieControllers
            .add(ChewieController(videoPlayerController: controllers[index])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Video Player",
          style: TextStyle(color: Colors.orange),
        ),
        backgroundColor: CupertinoColors.white,
        elevation: 2,
      ),
      backgroundColor: CupertinoColors.white,
      body: ListView.builder(
          itemCount: videoList.length,
          itemBuilder: (context, index) {
            /* controllers
                  .add(VideoPlayerController.asset(videoList[index].Resource));
              controllers[index].initialize().then((value) => setState(() {}));
              chewieControllers.add(
                  ChewieController(videoPlayerController: controllers[index]));*/
            return Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                AspectRatio(
                  aspectRatio: controllers[index].value.aspectRatio,
                  child: Chewie(
                    controller: chewieControllers[index],
                  ),
                ),
                InkWell(
                  child: ListTile(
                    onTap: () async {
                      print(index);
                      /*    print(
                            "${controllers[index]} ${controllers.length},heloo output comes to you");*/
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FullScreen(
                                chewieController: chewieControllers[index],
                                Resource: videoList[index].Resource),
                          ));
                    },
                    title: Text(videoList[index].name),
                    subtitle: Text(videoList[index].content),
                    /*leading: AspectRatio(
                        aspectRatio: controllers[index].value.aspectRatio,
                        child: VideoPlayer(controllers[index]),
                      ),*/
                    trailing: InkWell(
                        onTap: () {
                          controllers[index].play();
                        },
                        child: const Icon(
                          Icons.play_arrow_outlined,
                          color: Colors.orange,
                        )),
                  ),
                )
              ],
            );
          }),
      bottomNavigationBar: TabBar(
        unselectedLabelColor: Colors.grey,
        labelColor: Colors.orange,
        controller: _tabController,
        indicatorColor: Colors.orange,
        isScrollable: true,
        onTap: (val) {
          _pageController.animateToPage(val,
              duration: const Duration(microseconds: 800), curve: Curves.linear);
        },
        tabs: const [
          Tab(
            icon: Icon(
              CupertinoIcons.smiley,
            ),
            child: Text("Funny"),
          ),
          Tab(
            icon: Icon(CupertinoIcons.square_stack_3d_up),
            child: Text("Education"),
          ),
          Tab(
            icon: Icon(CupertinoIcons.music_albums),
            child: Text("Music"),
          ),
          Tab(
            icon: Icon(CupertinoIcons.checkmark_alt),
            child: Text("Spiritual"),
          ),
          Tab(
            icon: Icon(CupertinoIcons.news),
            child: Text("News"),
          ),
          Tab(
            icon: Icon(CupertinoIcons.circle_grid_hex),
            child: Text("Challenges"),
          ),
          Tab(
            icon: Icon(CupertinoIcons.underline),
            child: Text("Unboxing"),
          ),
        ],
      ),
    );
  }
}
