import 'package:blocclub/CategoryItem.dart';
import 'package:blocclub/Postlist.dart';
import 'package:blocclub/carousel/carousel_slider.dart';
import 'package:blocclub/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themData = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 32, top: 15.0, bottom: 0, right: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Hi, Jonathon !", style: themData.textTheme.subtitle1),
                    // Image.asset(
                    //   // 1 "assets/img/icons/notification.png",
                    //  //2  Assets.img.icons.notification.path,
                    //   width: 32,
                    //   height: 32,
                    // )
                    //3
                    Assets.img.icons.notification.image(
                      width: 32,
                      height: 32,
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 24.0, left: 32),
                  child: Text("Explore today’s",
                      style: themData.textTheme.headline4)),

              //with _ i macke private widget
              _StoryList(stories: stories, themData: themData),
              const SizedBox(
                height: 16,
              ),
              categoryList(),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 32),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Lastest News",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "More",
                          style: TextStyle(color: Color(0xff376AED)),
                        ))
                  ],
                ),
              ),
              const Postlist(),
              const SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    Key? key,
    required this.stories,
    required this.themData,
  }) : super(key: key);

  final List<StoryData> stories;
  final ThemeData themData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: stories.length,
          padding: const EdgeInsets.only(right: 32, left: 32),
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story, themData: themData);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.story,
    required this.themData,
  }) : super(key: key);

  final StoryData story;
  final ThemeData themData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed
                  ? profileImageViewed(story, context)
                  : profileImageNormal(story),
              Positioned(
                right: 0,
                bottom: 0,
                child: Image.asset(
                  "assets/img/icons/${story.iconFileName}",
                  width: 30,
                  height: 30,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(story.name, style: themData.textTheme.bodyText2),
          )
        ],
      ),
    );
  }
}

Widget profileImageNormal(StoryData story) {
  return Container(
    height: 68,
    width: 68,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
          Color(0xff376AED),
          Color(0xff49B0E2),
          Color(0xff9CECFB),
        ])),
    child: Container(
      margin: const EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: _ProfileImage(story: story),
      ),
    ),
  );
}

Widget profileImageViewed(StoryData story, BuildContext context) {
  return SizedBox(
    height: 68,
    width: 68,
    child: DottedBorder(
      dashPattern: const [5, 3],
      strokeWidth: 2,
      borderType: BorderType.RRect,
      padding: const EdgeInsets.all(2),
      radius: const Radius.circular(24),
      color: const Color(0xff7B8BB2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: _ProfileImage(story: story),
        ),
      ),
    ),
  );
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        "assets/img/stories/${story.imageFileName}",
      ),
    );
  }
}

Widget categoryList() {
  final categores = AppDatabase.categories;
  return CarouselSlider.builder(
      itemCount: categores.length,
      itemBuilder: (context, index, realindex) {
        return CategoryItem(
            left: realindex == 0 ? 25 : 8,
            right: realindex == categores.length - 1 ? 25 : 8,
            category: categores[realindex]);
      },
      options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          //img in page is 80%
          viewportFraction: 0.8,
// every img what is nesbat
          aspectRatio: 1.2,
//start  index
          initialPage: 0,
          disableCenter: true,
//show auto  play slide =>autoPlay: ,
//slide in loop
          enableInfiniteScroll: false,
          //item that in center page will be large
          enlargeCenterPage: true,
          scrollPhysics: const BouncingScrollPhysics(),
          enlargeStrategy: CenterPageEnlargeStrategy.height));
}
