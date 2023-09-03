import 'package:flutter/material.dart';
import 'package:hcmumass/widget/home_screen.dart';
import 'package:hcmumass/widget/login_screen.dart';

void main() {
  runApp(const Hcmumass(),);
}

class Hcmumass extends StatelessWidget {
  const Hcmumass({super.key});

  @override
  Widget build(context){
      return MaterialApp(
      title: 'FlutterChat',
      //theme: ThemeData(useMaterial3: true),
/*       theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 255, 255, 255)),
      ), */
      home: /* StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }

            if (snapshot.hasData) {
              return const ChatScreen();
            }

            return const AuthScreen();
          }), */
          LoginScreen(),
          //HomeScreen(),
    );
  }

}