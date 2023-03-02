import 'package:flutter/material.dart';
import 'package:pomotimer/widgets/progresswidget.dart';
import 'package:pomotimer/widgets/timecontroller.dart';
import 'package:pomotimer/widgets/timeoptions.dart';
import 'package:pomotimer/widgets/timercard.dart';
import 'package:provider/provider.dart';
import 'package:pomotimer/widgets/timerservice.dart';
import 'utils.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    return Scaffold(
      backgroundColor:renderColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderColor(provider.currentState),
        title: Text(
            "POMOTIMER",
          style: textStyle(20, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: ()=> {Provider.of<TimerService>(context, listen: false).reset()},
            icon: const Icon(Icons.refresh, color: Colors.white,),
            iconSize: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: const [
              SizedBox(height: 10),
              TimerCard(),
              SizedBox(height: 40,),
              TimeOptions(),
              SizedBox(height: 40,),
              TimeController(),
              SizedBox(height: 40,),
              ProgressWidget()
            ],
          ),
        ),
      ),
    );
  }
}

