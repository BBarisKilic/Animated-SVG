# Animated SVG | Flutter Package

[Flutter][flutter_dev_link] package for displaying and animating Scalable Vector Graphics 1.1 files. The package has been written solely in [Dart][dart_dev_link] language.

&nbsp;

<div align="center">

[![animated_svg][build_status_badge]][workflow_link]
![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

</div>

&nbsp;

| ![animated_svg_first_gif][animated_svg_first_gif] | ![animated_svg_second_gif][animated_svg_second_gif]   
| :-: | :-: |

&nbsp;

## Features

A powerful and fully customizable widget. With this package, you can animate `SVGs` without effort and make your `UI` look more lovely.

The `AnimatedSvg` widget creates a smooth transition between the two SVGs you assign.

&nbsp;

<p align="center">
    <img src="https://github.com/BBarisKilic/Animated-SVG/blob/master/art/animated_svg_1.png?raw=true" width="300">
    &nbsp; 
    &nbsp;
    <img src="https://github.com/BBarisKilic/Animated-SVG/blob/master/art/animated_svg_2.png?raw=true" width="300">
</p>

&nbsp;

## Getting started

Let's take a look at how to implement `AnimatedSvg` to quickly create cool transition animation between `SVGs`.

First, add the following line to `pubspec.yaml`:
```yaml
animated_svg: ^2.0.0
```

Second, import `AnimatedSvg`:
```dart
import 'package:animated_svg/animated_svg.dart';
```

## Usage

Basic usage example: 

`main.dart`
```dart
// Define an SvgController
late final SvgController controller;

@override
void initState() {
    // Initialize SvgController
    controller = AnimatedSvgController();
    super.initState();
}

@override
void dispose() {
    // Dispose SvgController
    controller.dispose();
    super.dispose();
}

@override
Widget build(BuildContext context) {
    // Call the AnimatedSvg widget anywhere in your widget tree.
    return AnimatedSvg(
        controller: controller,
        duration: const Duration(milliseconds: 600),
        onTap: () {},
        size: 80,
        clockwise: false,
        isActive: true,
        children: [
            SvgPicture.asset(
                'assets/play.svg',
            ),
            SvgPicture.asset(
                'assets/pause.svg',
            ),
        ],
    );
}
```

&nbsp;

## Example

More examples can be found in `/example` folder on [GitHub][animated_svg_github_link]. 

[Media Player][example_media_player_link] - an example of basic implementation of `AnimatedSvg`. Simple project that simulates a media player. As usual, the player needs play and pause buttons. Thanks to the `AnimatedSvg` package, it is so easy to create a smooth transition between play and pause SVGs.

&nbsp;

## Additional information

This package has been written solely in Dart Language yet it has the [flutter_svg][flutter_svg_link] as a dependency.

For more information please visit [GitHub][animated_svg_github_link].

&nbsp;

## Feature requests and bugs

Please file feature requests and bugs at the [issue tracker][animated_svg_issue_link].

&nbsp;

## Maintainers

- [Bulent Baris Kilic][maintainer_one_link]

[flutter_dev_link]: https://flutter.dev/
[dart_dev_link]: https://dart.dev/
[build_status_badge]: https://github.com/BBarisKilic/Animated-SVG/actions/workflows/main.yaml/badge.svg
[workflow_link]: https://github.com/BBarisKilic/Animated-SVG/actions/workflows/main.yaml
[coverage_badge]: coverage_badge.svg
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[animated_svg_first_gif]: https://github.com/BBarisKilic/Animated-SVG/blob/master/art/animated_svg_gif_1.gif?raw=true
[animated_svg_second_gif]: https://github.com/BBarisKilic/Animated-SVG/blob/master/art/animated_svg_gif_2.gif?raw=true
[animated_svg_github_link]: https://github.com/BBarisKilic/Animated-SVG
[example_media_player_link]: https://github.com/BBarisKilic/Animated-SVG/tree/master/example/media_player
[flutter_svg_link]: https://github.com/dnfield/flutter_svg
[animated_svg_issue_link]: https://github.com/BBarisKilic/Animated-SVG/issues
[maintainer_one_link]: https://github.com/BBarisKilic