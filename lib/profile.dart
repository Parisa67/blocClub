import 'package:blocclub/Postlist.dart';
import 'package:blocclub/gen/assets.gen.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class profileScreen extends StatefulWidget {
  const profileScreen({Key? key}) : super(key: key);

  @override
  _profileScreenState createState() => _profileScreenState();
}

// ignore: camel_case_types
class _profileScreenState extends State<profileScreen> {
  @override
  Widget build(BuildContext context) {
    final themData = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: themData.colorScheme.background.withOpacity(0),
                elevation: 0,
                title: const Text("Profile"),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz_rounded)),
                  const SizedBox(
                    width: 16,
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsetsDirectional.fromSTEB(32, 0, 32, 64),
                    decoration: BoxDecoration(
                        color: themData.colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 20,
                              color: themData.colorScheme.onBackground
                                  .withOpacity(0.1))
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Assets.img.stories.story8.image(
                                    width: 64, height: 65, fit: BoxFit.cover),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "@joviedan",
                                      style: themData.textTheme.bodyText2,
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Jovi Daniel",
                                      style: themData.textTheme.bodyText1!
                                          .copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      "UX Designer",
                                      style:
                                          themData.textTheme.bodyText1!.apply(
                                        color: themData.colorScheme.primary,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                          child: Text("About me",
                              style: themData.textTheme.headline6!),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(32, 4, 32, 32),
                          child: Text(
                            "Madison Blackstone is a director of user experience design, with experience managing global teams.",
                            style: themData.textTheme.bodyText1!
                                .copyWith(fontWeight: FontWeight.w200),
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 32,
                      left: 96,
                      right: 96,
                      child: Container(
                        height: 32,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 30,
                              color: themData.colorScheme.onBackground
                                  .withOpacity(0.8))
                        ]),
                      )),
                  Positioned(
                    bottom: 32,
                    left: 64,
                    right: 65,
                    child: Container(
                        height: 68,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: themData.colorScheme.primary,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: const Color(0xff2151CD),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "52",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: themData.colorScheme.onPrimary,
                                          fontSize: 20),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "Post",
                                      style: themData.textTheme.bodyText1!
                                          .copyWith(
                                              fontWeight: FontWeight.w200,
                                              color: themData
                                                  .colorScheme.onPrimary),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "250",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: themData.colorScheme.onPrimary,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Fallowing",
                                    style: themData.textTheme.bodyText1!
                                        .copyWith(
                                            fontWeight: FontWeight.w200,
                                            color:
                                                themData.colorScheme.onPrimary),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "4.5K",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: themData.colorScheme.onPrimary,
                                        fontSize: 20),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    "Fallowers",
                                    style: themData.textTheme.bodyText1!
                                        .copyWith(
                                            fontWeight: FontWeight.w200,
                                            color:
                                                themData.colorScheme.onPrimary),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
              Container(
                  decoration: BoxDecoration(
                      color: themData.colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(
                            32,
                          ),
                          topRight: Radius.circular(
                            32,
                          ))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        child: Row(
                          children: [
                            Expanded(
                                child: Text("My Posts",
                                    style: themData.textTheme.headline6!)),
                            IconButton(
                                onPressed: () {},
                                icon: Assets.img.icons.grid.svg()),
                            IconButton(
                                onPressed: () {},
                                icon: Assets.img.icons.table.svg()),
                          ],
                        ),
                      ),
                      const Postlist(),
                    ],
                  )

                  //  ListView.builder(itemBuilder: (context ,index){
                  //   return
                  // }
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
