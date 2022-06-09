import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imhere/src/pages/login/login_page.dart';
import 'package:imhere/src/pages/register/register_page.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
        title: 'Im Here',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: ()=> LoginPage()),
          GetPage(name: '/register', page: ()=> RegisterPage()),
        ],
        theme: ThemeData(
          primaryColor: Colors.amber,
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            onBackground: Colors.grey,
            onSecondary: Colors.grey,
            onError: Colors.grey,
            error: Colors.grey,
            secondary: Colors.amberAccent,
            onPrimary: Colors.grey,
            surface: Colors.grey,
            primary: Colors.amber,
            onSurface: Colors.grey,
            background: Colors.grey,
          )
        ),
        navigatorKey: Get.key,
      );
  }
}
