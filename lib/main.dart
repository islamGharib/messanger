import 'package:flutter/material.dart';
import 'package:messanger_app/modules/messanger_login/messanger_login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MessangerLoginScreen()
    );
  }
}
