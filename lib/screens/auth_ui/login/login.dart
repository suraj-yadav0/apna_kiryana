import 'package:apna_kiryana/constants/constants.dart';
import 'package:apna_kiryana/constants/routes.dart';
import 'package:apna_kiryana/firebase_helper/firbase_auth_helper.dart';
import 'package:apna_kiryana/screens/auth_ui/signup/sign_up.dart';
import 'package:apna_kiryana/screens/home/home.dart';
import 'package:apna_kiryana/widgets/PrimaryButton/primary_button.dart';
import 'package:apna_kiryana/widgets/TopTitle/top_title.dart';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TopTitle(title: "Login", subtitle: "Welcome To Apna Kiryana"),
              const SizedBox(
                height: 45,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Enter E-Mail",
                  prefixIcon: Icon(
                    Icons.mail_outline_outlined,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: passwordController,
                
                obscureText: isShowPassword,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  prefixIcon: const Icon(
                    Icons.password_outlined,
                  ),
                  suffixIcon: CupertinoButton(
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.visibility,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              PrimaryButton(onPressed: () async {
              bool isValidated =   loginValidation(emailController.text, passwordController.text);
              if(isValidated) {
                bool isLogined = await FirebaseAuthHelper.instance.login(emailController.text, passwordController.text, context);
       if(isLogined) {
      // ignore: use_build_context_synchronously
      Routes.instance.pushAndRemoveUntil(widget: const Home(), context: context);
              }
              }
             
              }, title: "Login"),
              const SizedBox(
                height: 24,
              ),
              const Center(
                child: Text("Don't have a account ?"),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: CupertinoButton(
                    child: Text(
                      "Create an Account",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                       Routes.instance.push(widget: const SignUp(), context: context);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
