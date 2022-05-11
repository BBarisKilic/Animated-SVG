// Copyright 2022 The AnimatedSvg Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// [SvgController]
///
/// A controller class that provides full control over the SVGs.
abstract class SvgController {
  /// A getter that provides the current [value] of the controller.
  double get value;

  /// A getter that returns true if the animation is running.
  bool get isAnimating;

  /// A getter that returns true if the animation is dismissed.
  bool get isDismissed;

  /// A getter that returns true if the animation is completed.
  bool get isCompleted;

  /// A method to initialize SvgController.
  ///
  /// This needs to be called before everything else.
  void init(AnimationController controller);

  /// A method to run animation in the forward direction.
  bool forward();

  /// A method to run animation in the reverse direction.
  bool reverse();

  /// A method to add a [listener] to the controller.
  void addListener(void Function() listener);

  /// A method to remove a [listener] from the controller.
  void removeListener(void Function() listener);

  /// A method to [dispose] SvgController.
  ///
  /// Do not forget to call this method when youare done with this controller!
  /// A suggested place to call this method would be the "dispose" method of
  /// the StatefulWidget.
  void dispose();
}

/// [AnimatedSvgController]
///
/// A controller class that provides full control over the SVGs.
class AnimatedSvgController implements SvgController {
  // An animation controller
  AnimationController? _controller;

  /// A getter that provides the current [value] of the controller.
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

  /// A method to initialize AnimatedSvgController.
  ///
  /// This needs to be called before everything else.
  @override
  void init(AnimationController controller) {
    if (_controller != null) return;

    _controller = controller;
  }

  /// A method to run animation in the forward direction.
  @override
  bool forward() {
    if (_controller != null) {
      _controller!.forward();
      return true;
    } else {
      return false;
    }
  }

  /// A method to run animation in the reverse direction.
  @override
  bool reverse() {
    if (_controller != null) {
      _controller!.reverse();
      return true;
    } else {
      return false;
    }
  }

  /// A method to add a [listener] to the controller.
  @override
  void addListener(void Function() listener) {
    if (_controller == null) return;

    _controller!.addListener(listener);
  }

  /// A method to remove a [listener] from the controller.
  @override
  void removeListener(void Function() listener) {
    if (_controller == null) return;

    _controller!.removeListener(listener);
  }

  /// A method to [dispose] AnimatedSvgController.
  ///
  /// Do not forget to call this method when you are done with this controller!
  /// A suggested place to call this method would be the "dispose" method of
  /// the StatefulWidget.
  @override
  void dispose() {
    if (_controller != null) {
      _controller!.dispose();
      _controller = null;
    }
  }
}
