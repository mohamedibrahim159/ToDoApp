import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Home_screen.dart';
import 'Splash_screen.dart';
import 'ThemeData/ThemeData.dart';
import 'firebase_options.dart';

void main()async {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeScreen(),
      initialRoute: "category",
      routes: {
        "home":(context)=>homeScreen(),
        // "splash":(context)=>splashScreen(),
        // "category":(context)=>categoryDetails(),




      },
      theme: my_theme.lightTheme,
    );
  }
}
