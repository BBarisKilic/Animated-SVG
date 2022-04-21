// Copyright 2022 The AnimatedSvg Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

class AnimatedSvgController {
  late bool Function() reverse;
  late bool Function() forward;
  late bool Function() isDismissed;
  late bool Function() isAnimating;
  late bool Function() isCompleted;
}
