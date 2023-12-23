


import 'package:flutter/material.dart';
import 'package:shared_pref_intro_46/login_screen.dart';
import 'package:shared_pref_intro_46/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,

      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            //if and if user is authenticated

            var prefs =await SharedPreferences.getInstance();

            prefs.setBool(LOGIN_KEY, false);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen(),));



          },
          child: Text("Log out"),
        ),
      ),

    );
  }
}
