import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kiki/firebase_options.dart';
import 'package:kiki/screens/categories.dart';
import 'package:kiki/screens/kiki_home.dart';
import 'package:kiki/screens/splash_screen.dart';
import 'package:kiki/screens/welcome_screen.dart';

void main() async {
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
    return GetMaterialApp(
      title: 'Kiki',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: "Montserrat",
      ),
      routes: {
        "welcome" :(context) => const WelcomeScreen(),
        "splash" :(context) => const SplashScreen(),
        "Kiki home" : (context) => const KikiHome(),
        "categories" :(context) => const KikiCategories(),
      },
      home: const SplashScreen(),
    );
  }
}
