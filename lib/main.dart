import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scoltender/firebase_options.dart';
import 'package:scoltender/screens/auth/signup.dart';
import 'package:scoltender/wrapper.dart';
import 'screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScolTender',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const SignupScreen(),
      initialRoute: '/', 
      routes: {
        '/':(context) =>const  Wrapper(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) =>const SignupScreen(),
      },
    );
  }
}
