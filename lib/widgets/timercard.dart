import 'package:flutter/material.dart';
import 'package:pomotimer/utils.dart';
import 'package:pomotimer/widgets/timerservice.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);
    final seconds = provider.currentDuration % 60;
    return Column(
      children: [
        Text(
          //"FOCUS",
          provider.currentState,
          style: textStyle(25, Colors.white, FontWeight.w700),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 2)
                  )]
              ),
              child: Center(
                child: Text(
                    //"00",
                    (provider.currentDuration ~/ 60).toString(),
                    style: textStyle(70, renderColor(provider.currentState), FontWeight.bold)
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(":", style: textStyle(50, Colors.red[200], FontWeight.bold)),
            const SizedBox(width: 10),
            Container(
              width: MediaQuery.of(context).size.width / 3.2,
              height: 160,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 4,
                        offset: const Offset(0, 2)
                    )]
              ),
              child: Center(
                child: Text(
                    seconds<10
                    ? "0${seconds.round()}"
                    : seconds.round().toString(),
                    style: textStyle(70, renderColor(provider.currentState), FontWeight.bold)
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
