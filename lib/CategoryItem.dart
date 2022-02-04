import 'package:blocclub/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final double left;
  final double right;
  const CategoryItem(
      {Key? key,
      required this.category,
      required this.left,
      required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
              top: 100,
              left: 65,
              right: 65,
              bottom: 24,
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 20, color: Color(0xaa0D253C)),
                ]),
              )),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                // gradient: const LinearGradient(begin: Alignment.topLeft, colors: [
                //   Color(0xff376AED),
                //   Color(0xff49B0E2),
                //   Color(0xff9CECFB),
                // ])
              ),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                      end: Alignment.center,
                      begin: Alignment.bottomCenter,
                      colors: [Color(0xff0D253C), Colors.transparent])),
              margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  "assets/img/posts/large/${category.imageFileName}",
                  fit: (BoxFit.cover),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 48,
              left: 32,
              child: Text(category.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .apply(color: Colors.white)))
        ],
      ),
    );
  }
}
