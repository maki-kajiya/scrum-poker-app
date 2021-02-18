import 'package:flutter/material.dart';

class SpaceBox extends SizedBox {
  SpaceBox({double width = 10, double height = 10})
      : super(width: width, height: height);

  SpaceBox.width([double value = 10]) : super(width: value);
  SpaceBox.height([double value = 10]) : super(height: value);
}
