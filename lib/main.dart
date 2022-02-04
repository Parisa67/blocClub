import 'package:blocclub/Article.dart';
import 'package:blocclub/Home.dart';
import 'package:blocclub/profile.dart';
import 'package:blocclub/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'BottomNavigation .dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      // systemNavigationBarIconBrightness: Brightness.dark,
      // systemNavigationBarColor: Colors.red,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // static const defaultFontFamily = 'Avenir';
  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            snackBarTheme: const SnackBarThemeData(
              backgroundColor: primaryColor,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: primaryTextColor,
            ),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(const TextStyle(
                        fontFamily: FontFamily.avenir,
                        fontWeight: FontWeight.w400,
                        fontSize: 14)))),
            colorScheme: const ColorScheme.light(
                //رنگ اصلی
                primary: primaryColor,
                //روی پرایمری هر چی بود رنگش این بشه
                onPrimary: Colors.white,
                onSurface: primaryTextColor,
                onBackground: primaryTextColor,
                background: Color(0xffFBFCFF),
                surface: Colors.white),
            textTheme: const TextTheme(
              subtitle1: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w200,
                  color: secondaryTextColor,
                  fontSize: 18),
              subtitle2: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w400,
                  color: primaryTextColor,
                  fontSize: 14),
              headline6: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: primaryTextColor),
              headline4: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: primaryTextColor),
              headline5: TextStyle(
                  fontFamily: FontFamily.avenir,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: primaryTextColor),
              bodyText2: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamily.avenir,
                  color: secondaryTextColor),
              bodyText1: TextStyle(
                fontSize: 14,
                fontFamily: FontFamily.avenir,
                color: secondaryTextColor,
              ),
              caption: TextStyle(
                  fontSize: 10,
                  fontFamily: FontFamily.avenir,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff7B8BB2)),
            )),
        home: MainScreen()
        //   Stack(
        // children: const [
        //   Positioned.fill(child: HomeScreen()),
        //   Positioned(bottom: 0, right: 0, left: 0, child: BottomNavigation())
        // ],
        // )
        );
  }
}

const int homeIndex = 0;
const int atticleIndex = 1;
const int searchIndex = 2;
const int profileIndex = 3;

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  GlobalKey<NavigatorState> homeKey = GlobalKey();
  GlobalKey<NavigatorState> articleKey = GlobalKey();
  GlobalKey<NavigatorState> searchKey = GlobalKey();
  GlobalKey<NavigatorState> menuKey = GlobalKey();
  List<int> history = [];
  late final map = {
    homeIndex: homeKey,
    atticleIndex: articleKey,
    searchIndex: searchKey,
    profileIndex: menuKey,
  };
  Future<bool> onwillPop() async {
    final NavigatorState currentSelectTabNavigatorSatet =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectTabNavigatorSatet.canPop()) {
      currentSelectTabNavigatorSatet.pop();
      return false;
    } else if (history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = history.last;
        history.removeLast();
      });

      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onwillPop,
      child: Scaffold(
          body: Stack(
        children: [
          Positioned.fill(
            bottom: 65,
            child: IndexedStack(
              index: selectedScreenIndex,
              children: [
                // //index0
                // const HomeScreen(),
                // //index1
                // ArticleScreen(),
                // //index2
                // const SearchScreen(),
                // //index3
                // const profileScreen()

                //create stack  for every child in IndexedStack

                navigator(
                    key: homeKey, index: homeIndex, page: const HomeScreen()),

                navigator(
                    key: articleKey,
                    index: atticleIndex,
                    page: ArticleScreen()),

                navigator(
                    key: searchKey,
                    index: searchIndex,
                    page: const SearchScreen()),
                navigator(
                    key: menuKey,
                    index: profileIndex,
                    page: const profileScreen()),
                // Navigator(
                //   key: menuKey,
                //   onGenerateRoute: (settings) => MaterialPageRoute(
                //     builder: (context) => Offstage(
                //         offstage: selectedScreenIndex != profileIndex,
                //         child: const profileScreen()),
                //   ),
                // )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNavigation(
              onTap: (int index) {
                setState(() {
                  history.remove(selectedScreenIndex);
                  //save last index
                  history.add(selectedScreenIndex);
                  //set new index
                  selectedScreenIndex = index;
                });
              },
            ),
          ),
        ],
      )),
    );
  }

  Widget navigator({GlobalKey? key, int? index, Widget? page}) {
    return key!.currentState == null && selectedScreenIndex != index
        ? const SizedBox()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) =>
                  //Offstage=>dont drow widget on screen when until yet dont click on page
                  Offstage(offstage: selectedScreenIndex != index, child: page),
            ),
          );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Serach", style: Theme.of(context).textTheme.headline4),
    );
  }
}
