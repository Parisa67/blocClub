import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final Function(int index) onTap;
  const BottomNavigation({Key? key, required this.onTap}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  bool home = true;
  bool search = false;
  bool article = false;
  bool profile = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 65,
              decoration: const BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(blurRadius: 20, color: Color(0xff9B8487))
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomNavigationItem(
                    activeIconFileName: 'Home.png',
                    iconFileName: 'Home.png',
                    title: 'Home',
                    isActive: home,
                    ontap: () {
                      widget.onTap(0);

                      setState(() {
                        home = true;
                        search = false;
                        article = false;
                        profile = false;
                      });
                    },
                  ),
                  BottomNavigationItem(
                    activeIconFileName: 'Articles.png',
                    iconFileName: 'Articles.png',
                    title: 'Article',
                    isActive: article,
                    ontap: () {
                      widget.onTap(1);
                      setState(() {
                        home = false;
                        search = false;
                        article = true;
                        profile = false;
                      });
                    },
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  BottomNavigationItem(
                    activeIconFileName: 'Search.png',
                    iconFileName: 'Search.png',
                    title: 'Search',
                    isActive: search,
                    ontap: () {
                      widget.onTap(2);
                      setState(() {
                        home = false;
                        search = true;
                        article = false;
                        profile = false;
                      });
                    },
                  ),
                  BottomNavigationItem(
                    activeIconFileName: 'Menu.png',
                    iconFileName: 'Menu.png',
                    title: 'Menu',
                    isActive: profile,
                    ontap: () {
                      widget.onTap(3);
                      setState(() {
                        home = false;
                        search = false;
                        article = false;
                        profile = true;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Colors.white, width: 5),
                  color: const Color(0xff0047CC)),
              child: const Icon(Icons.add, size: 25, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem(
      {Key? key,
      required this.activeIconFileName,
      required this.iconFileName,
      required this.title,
      required this.ontap,
      required this.isActive})
      : super(key: key);
  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final Function() ontap;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: ontap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/icons/$iconFileName',
                color: isActive
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: isActive
                  ? Theme.of(context)
                      .textTheme
                      .caption!
                      .apply(color: Theme.of(context).colorScheme.primary)
                  : Theme.of(context).textTheme.caption,
            )
          ],
        ),
      ),
    );
  }
}
