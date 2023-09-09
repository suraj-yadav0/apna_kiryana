import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}

showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Builder(
      builder: (context) {
        return SizedBox(
          width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: Color(0xffe16555),
              ),
              const SizedBox(
                height: 18.0,
              ),
              Container(
                margin: const EdgeInsets.only(left: 7),
                child: const Text("Loading..."),
              )
            ],
          ),
        );
      },
    ),
  );

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) { 
    case "ERROR_EMAIL_ALREADY_IN_USE":
      return "Email is already used. Go to LogIn page.";
    case "account-exists-with-different-credential":
      return "Email is already used. Go to LogIn page.";
    case "email-already-in-use":
      return "Email is already used. Go to LogIn page.";

    case "ERROR_WRONG_PASSWORD":
      return "Wrong Password";

    case "wrong-password":
      return "Wrong Password";

    case "ERROR_USER_NOT_FOUND":
      return "No user with this email";

    case "user-not-found":
      return "No user with this email";

    case "ERROR_USER_DISABLED":
      return "user disabled.";

    case "user-disabled":
      return "user disabled.";

    default:
    return "Login failed due to Unknown Error";
  }
}


bool loginValidation(String email, String password) {

   if(password.isEmpty && email.isEmpty){
    showMessage("Both fields are Empty");
    return false;
  }
  if(email.isEmpty){
    showMessage("Email is Empty");
    return false;
  }
  if(password.isEmpty){
    showMessage("Password is Empty");
    return false;
  }

  return true;
}