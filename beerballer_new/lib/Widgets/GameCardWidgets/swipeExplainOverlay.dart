import 'package:flutter/material.dart';

// This class is the overlay for the in app games (explanations)
class SwipeExplainOverlay extends StatelessWidget {
  String upperText;
  String bottomText;

  SwipeExplainOverlay(this.upperText, this.bottomText);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {Navigator.of(context).pop()},
      child: AlertDialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        content: new Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              this.upperText != ""
                  ? Flexible(
                      child: FractionallySizedBox(
                      heightFactor: 0.4,
                      widthFactor: 1,
                      child: Image.asset(
                        "lib/assets/images/IconsInGame/tap.png",
                      ),
                    ))
                  : SizedBox(),
              this.upperText != ""
                  ? Flexible(
                      child: FractionallySizedBox(
                        heightFactor: 0.5,
                        widthFactor: 1,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            this.upperText,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 100,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: 0.4,
                  widthFactor: 1,
                  child: Image.asset(
                    "lib/assets/images/IconsInGame/swipe.png",
                  ),
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: 0.4,
                  widthFactor: 1,
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      this.bottomText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
