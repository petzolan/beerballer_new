import 'package:flutter/material.dart';

class TextWithDivider extends StatelessWidget {
  final String txt;
  final double widthFactor;

  TextWithDivider(
    this.txt,
    this.widthFactor,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * widthFactor,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Divider(
              color: Colors.white,
              height: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              this.txt,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: Colors.white,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
