// Copyright 2022 The AnimatedSvg Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

import 'dart:math' as math;

import 'package:animated_svg/animated_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// {@template animated_svg}
/// [AnimatedSvg] Widget
///
/// Flutter package for displaying and animating Scalable Vector Graphics 1.1
/// files.
///
/// ```dart
/// AnimatedSvg(
///   controller: AnimatedSvgController(),
///   size: 80,
///   children: [
///     SvgPicture.asset('assets/play.svg'),
///     SvgPicture.asset('assets/pause.svg'),
///   ],
/// )
/// ```
/// {@endtemplate}
class AnimatedSvg extends StatefulWidget {
  /// {@macro animated_svg}
  const AnimatedSvg({
    required this.controller,
    required this.children,
    super.key,
    this.onTap,
    this.size = 24.0,
    this.duration = const Duration(milliseconds: 500),
    this.clockwise = true,
    this.isActive = true,
  }) : assert(children.length == 2, _kRequiredChildrenAssertMessage);

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

  /// [listener] method for [SvgController]
  ///
  /// This will help to update the state.
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

  /// [onTap] Tasks
  ///
  /// [onTap] parameter of [AnimatedSvg] will also be executed,
  /// if it is not null.
  void onTap() {
    if (!widget.isActive) return;
    if (widget.controller.isAnimating) return;

    widget.onTap?.call();

    if (widget.controller.isCompleted) {
      widget.controller.reverse();
    } else {
      widget.controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: drawSvgBoxes(),
      ),
    );
  }

  /// Get values from [SvgController] and return list of [_SvgBox].
  List<Widget> drawSvgBoxes() {
    final children = <Widget>[];
    final controllerValueX = widget.controller.value;
    final controllerValueY = 1.0 - widget.controller.value;
    final angleX = math.pi / 180.0 * (180.0 * controllerValueX);
    final angleY = math.pi / 180.0 * (180.0 * controllerValueY);

    if (controllerValueX == 1.0 && controllerValueY == 0.0) {
      children.add(
        SvgBox(
          svgPicture: widget.children[1],
          angle: widget.clockwise ? -angleY : angleY,
          opacity: controllerValueX,
          size: widget.size,
        ),
      );
    } else {
      children.add(
        SvgBox(
          svgPicture: widget.children[0],
          angle: widget.clockwise ? angleX : -angleX,
          opacity: controllerValueY,
          size: widget.size,
        ),
      );
    }

    if (controllerValueX == 0.0 && controllerValueY == 1.0) {
      children.add(
        SvgBox(
          svgPicture: widget.children[0],
          angle: widget.clockwise ? angleX : -angleX,
          opacity: controllerValueY,
          size: widget.size,
        ),
      );
    } else {
      children.add(
        SvgBox(
          svgPicture: widget.children[1],
          angle: widget.clockwise ? -angleY : angleY,
          opacity: controllerValueX,
          size: widget.size,
        ),
      );
    }

    return children;
  }
}

/// {@template svg_box}
/// [SvgBox] Widget
///
/// StatelessWidget to create single SvgBox with required
/// angle, opacity and size.
/// {@endtemplate}
@visibleForTesting
class SvgBox extends StatelessWidget {
  /// {@macro svg_box}
  const SvgBox({
    required this.svgPicture,
    required this.angle,
    required this.opacity,
    required this.size,
    super.key,
  });

  /// A variable to determine the [svgPicture] of the SvgBox.
  ///
  /// This [SvgPicture] will be converted into [SvgBox] with
  /// the expected angle, opacity and size.
  final SvgPicture svgPicture;

  /// A variable to determine the [angle] of the SvgBox.
  final double angle;

  /// A variable to determine the [opacity] of the SvgBox.
  final double opacity;

  /// A variable to determine the [size] of the SvgBox.
  final double size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Opacity(
        opacity: opacity,
        child: SizedBox(
          height: size,
          width: size,
          child: FittedBox(child: svgPicture),
        ),
      ),
    );
  }
}

/// Assertion message to show required children count.
const _kRequiredChildrenAssertMessage =
    'AnimatedSvg: It is required to provide only 2 SvgPicture as children!';
