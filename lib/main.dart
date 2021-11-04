import 'package:dogswelove/constants.dart';
import 'package:dogswelove/views/dogslistpage.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: episodef8Color,
    // fontFamily: "Roboto",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: episode666Color,
    accentColor: episode333Color,
    // errorColor: episode666Color,
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dogs We Love',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: const DogsListPage(),
    );
  }
}
