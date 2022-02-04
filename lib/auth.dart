import 'package:blocclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int singIn = 0;
  static const int singUp = 1;
  int currentStateTab = singIn;
  @override
  Widget build(BuildContext context) {
    final themData = Theme.of(context);
    final tabStyle = TextStyle(
        color: themData.colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: Assets.img.icons.logo.svg(width: 120)),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: themData.colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    )),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                currentStateTab = singIn;
                              });
                            },
                            child: Text(
                              "LOGIN",
                              style: tabStyle.apply(
                                  color: currentStateTab == singIn
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.54)),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  currentStateTab = singUp;
                                });
                              },
                              child: Text(
                                "Sing up".toUpperCase(),
                                style: tabStyle.apply(
                                    color: currentStateTab == singUp
                                        ? Colors.white
                                        : Colors.white.withOpacity(0.54)),
                              ))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                              color: themData.colorScheme.background,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                              )),
                          child: currentStateTab == singUp
                              ? SingUpWidget(
                                  themData: themData,
                                )
                              : LoginWidget(themData: themData)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
    required this.themData,
  }) : super(key: key);

  final ThemeData themData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(
          32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome back",
              style: themData.textTheme.headline6,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "Sing in with you account",
              style: themData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
            ),
            const SizedBox(
              height: 16,
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text("Username"),
              ),
            ),
            const PasswordTextfield(),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 60))),
              child: const Text("LOGIN"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Forgot your password?",
                  style:
                      themData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
                ),
                const SizedBox(
                  width: 8,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Reset here",
                      style: themData.textTheme.subtitle1!.apply(
                          fontSizeFactor: 0.8,
                          color: themData.colorScheme.primary),
                    )),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Center(
                child: Text(
              "Or sign in with",
              style: TextStyle(letterSpacing: 2),
            )),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.img.icons.google.image(width: 36, height: 36),
                const SizedBox(
                  width: 24,
                ),
                Assets.img.icons.facebook.image(width: 36, height: 36),
                const SizedBox(
                  width: 24,
                ),
                Assets.img.icons.twitter.image(width: 36, height: 36),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SingUpWidget extends StatelessWidget {
  const SingUpWidget({
    Key? key,
    required this.themData,
  }) : super(key: key);

  final ThemeData themData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(
          32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Bloc Club",
              style: themData.textTheme.headline6,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "please enter your information",
              style: themData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
            ),
            const SizedBox(
              height: 16,
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text("Fullname"),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                label: Text("Username"),
              ),
            ),
            const PasswordTextfield(),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width, 60))),
              child: const Text("SING UP"),
            ),
            const SizedBox(
              height: 16,
            ),
            const Center(
                child: Text(
              "Or sign up with",
              style: TextStyle(letterSpacing: 2),
            )),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.img.icons.google.image(width: 36, height: 36),
                const SizedBox(
                  width: 24,
                ),
                Assets.img.icons.facebook.image(width: 36, height: 36),
                const SizedBox(
                  width: 24,
                ),
                Assets.img.icons.twitter.image(width: 36, height: 36),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PasswordTextfield extends StatefulWidget {
  const PasswordTextfield({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          label: const Text("Password"),
          suffix: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Text(
                obscureText ? "Show" : "Hide",
                style: TextStyle(
                    fontSize: 14, color: Theme.of(context).colorScheme.primary),
              ))),
    );
  }
}
