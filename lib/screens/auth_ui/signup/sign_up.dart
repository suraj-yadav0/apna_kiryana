import 'package:apna_kiryana/constants/constants.dart';
import 'package:apna_kiryana/constants/routes.dart';
import 'package:apna_kiryana/firebase_helper/firbase_auth_helper.dart';
import 'package:apna_kiryana/screens/auth_ui/login/login.dart';
import 'package:apna_kiryana/screens/home/home.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
                controller: nameController,
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
                controller: phoneController,
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
 bool isValidated =   signupValidation(nameController.text,emailController.text,phoneController.text,passwordController.text);
              if(isValidated) {
                bool isLogined = await FirebaseAuthHelper.instance.signup(emailController.text, passwordController.text, context);
       if(isLogined) {
      // ignore: use_build_context_synchronously
      Routes.instance.pushAndRemoveUntil(widget: const Home(), context: context);
              }
              }
              }, title: "Create Account"),
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