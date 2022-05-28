// Copyright 2022 The AnimatedSvg Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

library animated_svg;

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'animated_svg_controller.dart';
import 'constants/constants.dart';

/// [AnimatedSvg] Widget
///
/// Flutter package for displaying and animating Scalable Vector Graphics 1.1
/// files.
///
/// The package has been written solely in Dart Language.
class AnimatedSvg extends StatefulWidget {
  /// Create [AnimatedSvg] widget.
  ///
  /// A widget for displaying and animating Scalable Vector Graphics 1.1 files.
  const AnimatedSvg({
    Key? key,
    required this.controller,
    required this.children,
    this.onTap,
    this.size = 24.0,
    this.duration = const Duration(milliseconds: 500),
    this.clockwise = true,
    this.isActive = true,
  })  : assert(children.length == 2, kRequiredChildrenAssertMessage),
        super(key: key);

  /// A [controller] class that provides full control over the SVGs.
  final SvgController controller;

  /// A list of SVGs required to draw and animate.
  ///
  /// Only two [children] are required therefore more or less than number of
  /// SVGs will throw an error.
  final List<SvgPicture> children;

  /// [onTap] Function that provides you the ability to control tap action.
  ///
  /// With this function, you can easily assign tasks to the widget.
  final void Function()? onTap;

  /// A variable to determine the [size] of the AnimatedSvg.
  ///
  /// Default value is 24.0.
  final double size;

  /// A variable to determine the [duration] of the animation.
  ///
  /// Default value is Duration(milliseconds: 500).
  final Duration duration;

  /// A variable to determine the direction of the animation.
  ///
  /// Default value is true.
  final bool clockwise;

  /// A variable to set the state of the widget.
  ///
  /// Default value is true.
  final bool isActive;

  @override
  State<AnimatedSvg> createState() => _AnimatedSvgState();
}

class _AnimatedSvgState extends State<AnimatedSvg>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    // Initializing the controller and adding listener.
    widget.controller
      ..init(AnimationController(vsync: this, duration: widget.duration))
      ..addListener(listener);
  }

  void listener() {
    if (!mounted) return;

    setState(() {});
  }

  @override
  void dispose() {
    // Removing listener and dispose
    widget.controller
      ..removeListener(listener)
      ..dispose();

    super.dispose();
  }

  // Setting on tap tasks.
  void onTap() {
    if (!mounted) return;
    if (!widget.isActive) return;
    if (widget.controller.isAnimating) return;

    if (widget.onTap != null) widget.onTap!();

    if (widget.controller.isCompleted) {
      widget.controller.reverse();
    } else {
      widget.controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double controllerValueX = widget.controller.value;
    final double controllerValueY = 1.0 - widget.controller.value;
    final double angleX = math.pi / 180.0 * (180.0 * controllerValueX);
    final double angleY = math.pi / 180.0 * (180.0 * controllerValueY);

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (controllerValueX == 1.0 && controllerValueY == 0.0)
            buildSecondSvg(angle: angleY, opacity: controllerValueX)
          else
            buildFirstSvg(angle: angleX, opacity: controllerValueY),
          if (controllerValueX == 0.0 && controllerValueY == 1.0)
            buildFirstSvg(angle: angleX, opacity: controllerValueY)
          else
            buildSecondSvg(angle: angleY, opacity: controllerValueX),
        ],
      ),
    );
  }

  // Building first SVG widget.
  Widget buildFirstSvg({required double angle, required double opacity}) =>
      Transform.rotate(
        angle: widget.clockwise ? angle : -angle,
        child: Opacity(
          opacity: opacity,
          child: SizedBox(
            height: widget.size,
            width: widget.size,
            child: FittedBox(
              child: widget.children[0],
            ),
          ),
        ),
      );

  // Building second SVG widget.
  Widget buildSecondSvg({required double angle, required double opacity}) =>
      Transform.rotate(
        angle: widget.clockwise ? -angle : angle,
        child: Opacity(
          opacity: opacity,
          child: SizedBox(
            height: widget.size,
            width: widget.size,
            child: FittedBox(
              child: widget.children[1],
            ),
          ),
        ),
      );
}
