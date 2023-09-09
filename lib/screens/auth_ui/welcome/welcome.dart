import 'package:apna_kiryana/constants/asset_image.dart';
import 'package:apna_kiryana/constants/routes.dart';
import 'package:apna_kiryana/screens/auth_ui/login/login.dart';
import 'package:apna_kiryana/screens/auth_ui/signup/sign_up.dart';
import 'package:apna_kiryana/widgets/PrimaryButton/primary_button.dart';
import 'package:apna_kiryana/widgets/TopTitle/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const TopTitle(
                title: "Welcome To", subtitle: "The Ecommerce app that cares"),
            Center(
              child: Image.asset(AssetImages.instance.welcomeImage),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.facebook,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                CupertinoButton(
                  onPressed: () {
               
                  },
                  child: Image.asset(
                    AssetImages.instance.googleIconImage,
                    scale: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            PrimaryButton(onPressed: () {
                   Routes.instance.push(widget: const Login(), context: context);
            }, title: "Login"),
            const SizedBox(
              height: 18,
            ),
            PrimaryButton(onPressed: () {
              Routes.instance.push(widget: const SignUp(), context: context);
            }, title: "Signup"),
          ]),
        ),
      ),
    );
  }
}
