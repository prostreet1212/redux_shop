import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class CounterIncrementAction{}

@immutable
class AppState{
  final int value;

  AppState({ this.value = 0});

  factory AppState.initial()=>AppState();

  AppState copyWith({ int? value}){
    return AppState(
      value:value??this.value,
    );
  }

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


