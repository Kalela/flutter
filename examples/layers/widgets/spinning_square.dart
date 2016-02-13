// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/widgets.dart';

class SpinningSquare extends StatefulComponent {
  _SpinningSquareState createState() => new _SpinningSquareState();
}

class _SpinningSquareState extends State<SpinningSquare> {
  AnimationController _animation;

  void initState() {
    super.initState();
    // We use 3600 milliseconds instead of 1800 milliseconds because 0.0 -> 1.0
    // represents an entire turn of the square whereas in the other examples
    // we used 0.0 -> math.PI, which is only half a turn.
    _animation = new AnimationController(
      duration: const Duration(milliseconds: 3600)
    )..repeat();
  }

  Widget build(BuildContext context) {
    return new RotationTransition(
      turns: _animation,
      child: new Container(
        width: 200.0,
        height: 200.0,
        decoration: const BoxDecoration(
          backgroundColor: const Color(0xFF00FF00)
        )
      )
    );
  }
}

void main() {
  runApp(new Center(child: new SpinningSquare()));
}
