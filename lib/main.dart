import 'package:flutter/material.dart';
import 'package:pomotimer/pomodoro_screen.dart';
import 'package:pomotimer/widgets/timerservice.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(
    ChangeNotifierProvider<TimerService>(
      create: (_)=> TimerService(),
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PomodoroScreen(),
    );
  }
}
