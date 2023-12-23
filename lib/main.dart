import 'package:flutter/material.dart';
import 'package:shared_pref_intro_46/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late SharedPreferences prefs;
  var nameController = TextEditingController();

  var ageController = TextEditingController();

  String? name ;

  int? age;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSharedPrefs();

  }

  void initSharedPrefs()async{
     prefs = await SharedPreferences.getInstance();
    getDataFromPrefs();

  }
  void getDataFromPrefs(){

//storing into shared prefs
    name =  prefs.getString("name");
    age = prefs.getInt("age");
    setState(() {

    });


  }

  void setDataToPrefs(){

//storing into shared prefs
    prefs.setString("name", nameController.text.toString());
    prefs.setInt("age", int.parse(ageController.text.toString()));


  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Prefs"),
      ),
      body: Column(
        children: [

          Text("Name: ${name ?? "Default"} , Age: ${age ?? 0}"),
          SizedBox(
            height: 21,
          ),
          TextFormField(
            controller: nameController,
          ),
          SizedBox(
            height: 21,
          ),
          TextFormField(
            controller: ageController,
          ),
          SizedBox(
            height: 21,
          ),
          ElevatedButton(
              onPressed: () async {
                setDataToPrefs();

              },
              child: Text("Save")),
        ],
      ),
    );
  }
}
