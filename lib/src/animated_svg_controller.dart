// Copyright 2023 The AnimatedSvg Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// [SvgController]
///
/// A controller class that provides full control over the SVGs.
abstract interface class SvgController {
  /// A getter that provides the current [value] of the controller.
  double get value;

  /// A getter that returns true if the animation is running.
  bool get isAnimating;

  /// A getter that returns true if the animation is completed.
  bool get isCompleted;

  /// A method to initialize SvgController.
  ///
  /// This needs to be called before everything else.
  void init(AnimationController controller);

  /// A method to run animation in the [forward] direction.
  bool forward();

  /// A method to run animation in the [reverse] direction.
  bool reverse();

  /// A method to add a [listener] to the controller.
  void addListener(void Function() listener);

  /// A method to remove a [listener] from the controller.
  void removeListener(void Function() listener);

  /// A method to [dispose] SvgController.
  ///
  /// Do not forget to call this method when you are done with this controller!
  /// A suggested place to call this method would be the "dispose" method of
  /// the StatefulWidget.
  void dispose();
}

/// {@template animated_svg_controller}
/// [AnimatedSvgController]
///
/// A controller class that provides full control over the SVGs.
/// {@endtemplate}
final class AnimatedSvgController implements SvgController {
  /// {@macro animated_svg_controller}
  AnimatedSvgController();

  /// An animation controller
  AnimationController? _controller;

  @override
  double get value => _controller != null ? _controller!.value : 0.0;

  @override
  bool get isAnimating {
    if (_controller == null) return false;

    return _controller!.value > 0.0 && _controller!.value < 1.0;
  }

  @override
  bool get isCompleted => _controller?.value == 1.0;

  @override
  void init(AnimationController controller) {
    if (_controller != null) return;

    _controller = controller;
  }

  @override
  bool forward() {
    if (_controller == null) return false;

    _controller!.forward();
    return true;
  }

  @override
  bool reverse() {
    if (_controller == null) return false;

    _controller!.reverse();
    return true;
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
    if (_controller == null) return;

    _controller!.dispose();
    _controller = null;
  }
}
