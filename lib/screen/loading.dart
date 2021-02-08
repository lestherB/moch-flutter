import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: SpinKitFoldingCube(
        color: Colors.white,
        size: 30.0,
      )
    );
  }
}