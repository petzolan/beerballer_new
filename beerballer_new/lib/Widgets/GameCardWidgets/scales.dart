import 'package:beerballer_new/Models/firestoreModels/game.dart';
import 'package:beerballer_new/utils/appVariables.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Scales extends StatelessWidget {
  final Game gameObj;

  Scales(
    this.gameObj,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Action",
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).textScaleFactor * 10,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            new CircularPercentIndicator(
              radius: MediaQuery.of(context).size.width * 0.07,
              animation: false,
              animationDuration: 1200,
              lineWidth: 3.0,
              percent: double.parse(
                gameObj.funFactor,
              ),
              center: new Text(
                (double.parse(gameObj.funFactor) * 100)
                        .toString()
                        .split(".")[0] +
                    "%",
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 8.0,
                ),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.grey.shade300,
              progressColor: AppVariables.darkAccent,
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Betrinkskala",
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).textScaleFactor * 10,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            new CircularPercentIndicator(
              radius: MediaQuery.of(context).size.width * 0.07,
              animation: false,
              animationDuration: 1200,
              lineWidth: 3.0,
              percent: double.parse(gameObj.drunknessFac),
              center: new Text(
                (double.parse(gameObj.drunknessFac) * 100)
                        .toString()
                        .split(".")[0] +
                    "%",
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 8.0,
                ),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.grey.shade300,
              progressColor: AppVariables.darkAccent,
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flirtfaktor",
              style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).textScaleFactor * 10,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            new CircularPercentIndicator(
              radius: MediaQuery.of(context).size.width * 0.07,
              animation: false,
              animationDuration: 1200,
              lineWidth: 3.0,
              percent: double.parse(gameObj.dirtyFactor),
              center: new Text(
                (double.parse(gameObj.dirtyFactor) * 100)
                        .toString()
                        .split(".")[0] +
                    "%",
                style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 8.0,
                ),
              ),
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Colors.grey.shade300,
              progressColor: AppVariables.darkAccent,
            ),
          ],
        )
      ],
    );
  }
}
