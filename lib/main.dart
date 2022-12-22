import 'package:fl2_qwerty_messenger/Page/register.dart';
import 'package:fl2_qwerty_messenger/themes.dart';
import 'package:fl2_qwerty_messenger/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider<API>(
      create: (_) => API(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: const Register(),
    );
  }
}
