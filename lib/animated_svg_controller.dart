// Copyright 2022 The AnimatedSvg Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';

abstract class SvgController {
  double get value;
  bool get isAnimating;
  bool get isDismissed;
  bool get isCompleted;
  void init(AnimationController controller);
  bool forward();
  bool reverse();
  void addListener(void Function() listener);
  void removeListener(void Function() listener);
  void dispose();
}

/// A controller class that provides full control over the SVGs.
class AnimatedSvgController implements SvgController {
  // An animation controller
  AnimationController? _controller;

  /// A getter that provides the current value of the controller.
  @override
  double get value => _controller != null ? _controller!.value : 0.0;

  /// A getter that returns true if the animation is running.
  @override
  bool get isAnimating => _controller != null
      ? _controller!.value > 0.0 && _controller!.value < 1.0
      : false;

  /// A getter that returns true if the animation is dismissed.
  @override
  bool get isDismissed =>
      _controller != null ? _controller!.value == 0.0 : false;

  /// A getter that returns true if the animation is completed.
  @override
  bool get isCompleted =>
      _controller != null ? _controller!.value == 1.0 : false;

  @override
  void init(AnimationController controller) {
    if (_controller != null) return;

    _controller = controller;
  }

  @override
  bool forward() {
    if (_controller != null) {
      _controller!.forward();
      return true;
    } else {
      return false;
    }
  }

  @override
  bool reverse() {
    if (_controller != null) {
      _controller!.reverse();
      return true;
    } else {
      return false;
    }
  }

  @override
  void addListener(void Function() listener) {
    if (_controller == null) return;

    _controller!.addListener(listener);
  }

  @override
  void removeListener(void Function() listener) {
    if (_controller == null) return;

    _controller!.removeListener(listener);
  }

  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
  }
}
