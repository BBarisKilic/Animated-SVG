// Copyright 2022 The AnimatedSvg Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';

class AnimatedSvgController {
  // Creating an animation controller
  AnimationController? _controller;

  double get value => _controller != null ? _controller!.value : 0.0;

  bool get isAnimating => _controller != null
      ? _controller!.value > 0.0 && _controller!.value < 1.0
      : false;

  bool get isDismissed =>
      _controller != null ? _controller!.value == 0.0 : false;

  bool get isCompleted =>
      _controller != null ? _controller!.value == 1.0 : false;

  void init(AnimationController controller) {
    if (_controller != null) return;

    _controller = controller;
  }

  bool forward() {
    if (_controller != null) {
      _controller!.forward();
      return true;
    } else {
      return false;
    }
  }

  bool reverse() {
    if (_controller != null) {
      _controller!.reverse();
      return true;
    } else {
      return false;
    }
  }

  void addListener(VoidCallback listener) {
    if (_controller == null) return;

    _controller!.addListener(listener);
  }

  void removeListener(VoidCallback listener) {
    if (_controller == null) return;

    _controller!.removeListener(listener);
  }

  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
  }
}
