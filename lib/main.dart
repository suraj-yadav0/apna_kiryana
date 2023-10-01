import 'package:apna_kiryana/constants/theme.dart';
import 'package:apna_kiryana/firebase_helper/firbase_auth_helper.dart';
import 'package:apna_kiryana/provider/app_provider.dart';
import 'package:apna_kiryana/screens/auth_ui/welcome/welcome.dart';
import 'package:apna_kiryana/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>     AppProvider(),
      child: MaterialApp(
        title: 'E-Commerce App',
        theme: themeData,
        
        home: StreamBuilder(stream: FirebaseAuthHelper.instance.getAuthChange,builder: (context,snapshot) {
          if(snapshot.hasData) {
            return const Home();
          }
          return const Welcome();
        },)
      ),
    );
  }
}

