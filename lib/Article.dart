import 'package:blocclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatefulWidget {
  ArticleScreen({Key? key}) : super(key: key);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  @override
  Widget build(BuildContext context) {
    final themData = Theme.of(context);
    return Scaffold(
      backgroundColor: themData.colorScheme.surface,
      floatingActionButton: InkWell(
        onTap: () => showSnackBar(context, "Like Buttom is Clicked! "),
        child: Container(
          width: 111,
          height: 48,
          decoration: BoxDecoration(
              color: themData.colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: themData.colorScheme.primary.withOpacity(0.5),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.thumbs.svg(),
              const SizedBox(
                width: 8,
              ),
              Text(
                "2.1K",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: themData.colorScheme.surface),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                // floating: true,
                // pinned: true,
                titleSpacing: 32,
                title: const Text("Article"),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded)),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              SliverList(
                // crossAxisAlignment: CrossAxisAlignment.start,
                delegate: SliverChildListDelegate.fixed([
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 32, top: 16, bottom: 16, right: 32),
                    child: Text(
                      "Four Things Every Woman Needs To Know",
                      style: themData.textTheme.headline4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Assets.img.stories.story9
                              .image(width: 48, height: 48, fit: BoxFit.cover),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Richard Gervain",
                                style: themData.textTheme.bodyText1!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              //به طور پیش فرض متن ها bodyText2 میگیرن برا استایل
                              const Text("2m ago")
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () => showSnackBar(
                                context, "share Buttom is Clicked! "),
                            icon: Icon(
                              CupertinoIcons.share,
                              color: themData.colorScheme.primary,
                            )),
                        IconButton(
                            onPressed: () => showSnackBar(
                                context, "bookmark Buttom is Clicked! "),
                            icon: Icon(
                              CupertinoIcons.bookmark,
                              color: themData.colorScheme.primary,
                            )),
                      ],
                    ),
                  ),
                  ClipRRect(
                    child: Assets.img.stories.singlePost.image(),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
                    child: Text(
                      "A man’s sexuality is never your mind responsibility.",
                      style: themData.textTheme.headline5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 32),
                    child: Text(
                      "This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.This one got an incredible amount of backlash the last time I said it, so I’m going to say it again: a man’s sexuality is never, ever your responsibility, under any circumstances. Whether it’s the fifth date or your twentieth year of marriage, the correct determining factor for whether or not you have sex with your partner isn’t whether you ought to “take care of him” or “put out” because it’s been a while or he’s really horny — the correct determining factor for whether or not you have sex is whether or not you want to have sex.",
                      style: themData.textTheme.bodyText2,
                    ),
                  ),
                ]),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 116,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    themData.colorScheme.surface,
                    themData.colorScheme.surface.withOpacity(0)
                  ])),
            ),
          )
        ],
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
