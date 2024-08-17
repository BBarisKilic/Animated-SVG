// Copyright 2023 The AnimatedSvg Authors. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

import 'package:animated_svg/animated_svg.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AnimatedSvgController', () {
    test('can be instantiated', () {
      expect(
        AnimatedSvgController(),
        isNotNull,
      );
    });
  });
}
