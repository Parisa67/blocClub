import 'package:blocclub/auth.dart';
import 'package:blocclub/data.dart';
import 'package:blocclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBording extends StatefulWidget {
  const OnBording({Key? key}) : super(key: key);

  @override
  State<OnBording> createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  final PageController pageController = PageController();
  final items = AppDatabase.onBoardingItems;
  int page = 0;
  @override
  void initState() {
    pageController.addListener(() {
      if (pageController.page!.round() != page) {
        setState(() {
          page = pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 23.0, bottom: 8),
                child: Assets.img.stories.onboarding.image(),
              ),
            ),
            Container(
                height: 260,
                decoration: BoxDecoration(
                    color: themeData.colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 20, color: Colors.black.withOpacity(0.1))
                    ]),
                child: Column(
                  children: [
                    Expanded(
                        child: PageView.builder(
                            controller: pageController,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items[index].title,
                                      style: themeData.textTheme.headline4,
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      items[index].decoration,
                                      style: themeData.textTheme.subtitle1!
                                          .apply(fontSizeFactor: 0.9),
                                    ),
                                  ],
                                ),
                              );
                            })),
                    Container(
                        height: 60,
                        padding: const EdgeInsets.only(
                            left: 32, right: 32, bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: pageController,
                              count: items.length,
                              effect: ExpandingDotsEffect(
                                dotHeight: 8,
                                dotWidth: 8,
                                activeDotColor: themeData.colorScheme.primary,
                                dotColor: themeData.colorScheme.primary
                                    .withOpacity(0.1),
                              ),
                            ),
                            ElevatedButton(
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all(
                                        const Size(84, 60)),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)))),
                                onPressed: () {
                                  if (page == items.length - 1) {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                AuthScreen()));
                                  } else {
                                    pageController.animateToPage(page + 1,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.decelerate);
                                  }
                                },
                                child: Icon(page == items.length - 1
                                    ? CupertinoIcons.check_mark
                                    : CupertinoIcons.arrow_right))
                          ],
                        ))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
