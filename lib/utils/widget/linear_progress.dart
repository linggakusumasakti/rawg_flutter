import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LinearProgress extends StatelessWidget {
  final double percent;

  const LinearProgress({Key key, this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: LinearProgressIndicator(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(
            Colors.red
        ),
        value: percent / 100,
      ),
    );
  }
}