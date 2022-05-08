// Copyright 2022 The AnimatedSvg Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';

abstract class SvgController {
  /// A getter that provides the current value of the controller.
  double get value;

  /// A getter that returns true if the animation is running.
  bool get isAnimating;

  /// A getter that returns true if the animation is dismissed.
  bool get isDismissed;

  /// A getter that returns true if the animation is completed.
  bool get isCompleted;

  /// A function to initialize SvgController.
  ///
  /// This needs to be called before everything else.
  void init(AnimationController controller);

  /// A function to run animation in the forward direction.
  bool forward();

  /// A function to run animation in the reverse direction.
  bool reverse();

  /// A function to add a listener to the controller.
  void addListener(void Function() listener);

  /// A function to remove a listener from the controller.
  void removeListener(void Function() listener);

  /// A function to dispose SvgController.
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

  /// A function to initialize AnimatedSvgController.
  ///
  /// This needs to be called before everything else.
  @override
  void init(AnimationController controller) {
    if (_controller != null) return;

    _controller = controller;
  }

  /// A function to run animation in the forward direction.
  @override
  bool forward() {
    if (_controller != null) {
      _controller!.forward();
      return true;
    } else {
      return false;
    }
  }

  /// A function to run animation in the reverse direction.
  @override
  bool reverse() {
    if (_controller != null) {
      _controller!.reverse();
      return true;
    } else {
      return false;
    }
  }

  /// A function to add a listener to the controller.
  @override
  void addListener(void Function() listener) {
    if (_controller == null) return;

    _controller!.addListener(listener);
  }

  /// A function to remove a listener from the controller.
  @override
  void removeListener(void Function() listener) {
    if (_controller == null) return;

    _controller!.removeListener(listener);
  }

  /// A function to dispose AnimatedSvgController.
  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
  }
}
