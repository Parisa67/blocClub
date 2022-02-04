import 'package:blocclub/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:blocclub/Post.dart';

class Postlist extends StatefulWidget {
  const Postlist({Key? key}) : super(key: key);

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(right: 16, left: 32),
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Text(
        //         "Lastest News",
        //         style: Theme.of(context).textTheme.headline5,
        //       ),
        //       TextButton(
        //           onPressed: () {},
        //           child: const Text(
        //             "More",
        //             style: TextStyle(color: Color(0xff376AED)),
        //           ))
        //     ],
        //   ),
        // ),
        ListView.builder(
            itemCount: posts.length,
            //heigt item in list
            physics: const ClampingScrollPhysics(),
            itemExtent: 141,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Post(post: post);
            })
      ],
    );
  }
}
