import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tadoo_app/layout/home_screen.dart';
import 'package:tadoo_app/shared/bloc_observe.dart';

void main() {
  Bloc.observer=MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoHomeScreen(),
    );
  }
}
