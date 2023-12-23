


import 'package:flutter/material.dart';
import 'package:shared_pref_intro_46/home_screen.dart';
import 'package:shared_pref_intro_46/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: ElevatedButton(
          onPressed: ()async{
            //if and if user is authenticated

            var prefs =await SharedPreferences.getInstance();

            prefs.setBool(LOGIN_KEY, true);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));



          },
          child: Text("Login"),
        ),
      ),

    );
  }
}
