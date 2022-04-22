// Copyright 2022 The AnimatedSvg Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

library animated_svg;

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'animated_svg_controller.dart';
import 'constants/constants.dart';

class AnimatedSvg extends StatefulWidget {
  /// Constructor
  const AnimatedSvg({
    Key? key,
    required this.controller,
    required this.onTap,
    required this.children,
    this.size = 24.0,
    this.duration = const Duration(milliseconds: 500),
    this.clockwise = true,
    this.isActive = true,
  })  : assert(children.length == 2, kRequiredChildrenAssertMessage),
        super(key: key);

  final AnimatedSvgController controller;
  final VoidCallback onTap;
  final List<SvgPicture> children;
  final double size;
  final Duration duration;
  final bool clockwise;
  final bool isActive;

  @override
  State<AnimatedSvg> createState() => _AnimatedSvgState();
}

class _AnimatedSvgState extends State<AnimatedSvg>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // Initializing the controller
    widget.controller.init(
      AnimationController(
        vsync: this,
        duration: widget.duration,
      ),
    );

    // Adding listener
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // Removing listener
    widget.controller.removeListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    widget.controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (widget.isActive && mounted) {
      // If animation is still running, return!
      if (widget.controller.isAnimating) return;

      widget.onTap();

      if (widget.controller.isCompleted) {
        widget.controller.reverse();
      } else {
        widget.controller.forward();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double controllerValueX = widget.controller.value;
    final double controllerValueY = 1.0 - widget.controller.value;
    final double angleX = math.pi / 180.0 * (180.0 * controllerValueX);
    final double angleY = math.pi / 180.0 * (180.0 * controllerValueY);

    return GestureDetector(
      onTap: _onTap,
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: FittedBox(
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (controllerValueX == 1.0 && controllerValueY == 0.0)
                _buildSecondSvg(angle: angleY, opacity: controllerValueX)
              else
                _buildFirstSvg(angle: angleX, opacity: controllerValueY),
              if (controllerValueX == 0.0 && controllerValueY == 1.0)
                _buildFirstSvg(angle: angleX, opacity: controllerValueY)
              else
                _buildSecondSvg(angle: angleY, opacity: controllerValueX),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstSvg({required double angle, required double opacity}) {
    return Transform.rotate(
      angle: widget.clockwise ? angle : -angle,
      child: Opacity(
        opacity: opacity,
        child: widget.children[0],
      ),
    );
  }

  Widget _buildSecondSvg({required double angle, required double opacity}) {
    return Transform.rotate(
      angle: widget.clockwise ? -angle : angle,
      child: Opacity(
        opacity: opacity,
        child: widget.children[1],
      ),
    );
  }
}
