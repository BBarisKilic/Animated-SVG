// Copyright 2023 The AnimatedSvg Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

import 'package:animated_svg/animated_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final SvgPicture svgPicture;
  late final AnimatedSvgController animatedSvgController;

  setUpAll(() {
    svgPicture = SvgPicture.string('<svg height="100" width="100"></svg>');
    animatedSvgController = AnimatedSvgController();
  });

  // ignore: unnecessary_lambdas
  tearDownAll(() {
    animatedSvgController.dispose();
  });

  group('AnimatedSvg', () {
    test('can be instantiated', () {
      expect(
        AnimatedSvg(
          controller: animatedSvgController,
          children: [
            svgPicture,
            svgPicture,
          ],
        ),
        isNotNull,
      );
    });

    testWidgets('has active two SvgBox', (tester) async {
      await tester.pumpWidget(
        AnimatedSvg(
          controller: animatedSvgController,
          children: [
            svgPicture,
            svgPicture,
          ],
        ),
      );

      final fittedBox = find.byType(SvgBox);

      expect(fittedBox, findsNWidgets(2));
    });

    testWidgets('changes state on tap', (tester) async {
      await tester.pumpWidget(
        AnimatedSvg(
          controller: animatedSvgController,
          children: [
            svgPicture,
            svgPicture,
          ],
        ),
      );

      final gestureDetector = find.byType(GestureDetector);

      await tester.tap(gestureDetector);

      await tester.pumpAndSettle();

      await tester.tap(gestureDetector);

      expect(animatedSvgController.isCompleted, true);
    });
  });
}
