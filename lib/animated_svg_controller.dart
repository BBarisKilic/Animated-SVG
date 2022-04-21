// Copyright 2022 The AnimatedSvg Author. All rights reserved.
// Use of this source code is governed by a MIT-style license that
// can be found in the LICENSE file.

class AnimatedSvgController {
  late final bool Function() reverse;
  late final bool Function() forward;
  late final bool Function() isDismissed;
  late final bool Function() isAnimating;
  late final bool Function() isCompleted;
}
