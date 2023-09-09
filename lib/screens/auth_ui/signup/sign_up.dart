import 'package:apna_kiryana/constants/routes.dart';
import 'package:apna_kiryana/screens/auth_ui/login/login.dart';
import 'package:apna_kiryana/widgets/PrimaryButton/primary_button.dart';
import 'package:apna_kiryana/widgets/TopTitle/top_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
 bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //resizeToAvoidBottomInset: false,
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
                decoration: const InputDecoration(
                  hintText: "Enter Name",
                  prefixIcon: Icon(
                    Icons.person,
                  ),
                ),
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 12,
              ),
               TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Contact Number",
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 12,
              ),
               TextFormField(
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
              PrimaryButton(onPressed: () {}, title: "Signup"),
              const SizedBox(
                height: 24,
              ),
              const Center(
                child: Text("I already have an account ?"),
              ),
              const SizedBox(
                height: 12,
              ),
              Center(
                child: CupertinoButton(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      Routes.instance.push(widget: const Login(), context: context);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}