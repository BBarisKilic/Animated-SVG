# Animated SVG | Flutter Package

[Flutter](https://flutter.dev/) package for displaying and animating Scalable Vector Graphics 1.1 files. The package has been written solely in [Dart](https://dart.dev/) language.

&nbsp;

| ![animated_svg_gif_1](https://github.com/BBarisKilic/Animated-SVG/blob/master/screenshot/animated_svg_gif_1.gif?raw=true) | ![animated_svg_gif_2](https://github.com/BBarisKilic/Animated-SVG/blob/master/screenshot/animated_svg_gif_2.gif?raw=true)    
| :-: | :-: |

&nbsp;

## Features

A powerful and fully customizable widget. With this package, you can easily animate `SVGs` and make your `UI` look more lovely.

`AnimatedSvg` widget creates a smooth transition between the two SVGs you are going to assign.

&nbsp;

<p align="center"><img src="https://github.com/BBarisKilic/Animated-SVG/blob/master/screenshot/animated_svg_1.png?raw=true" width="300">&nbsp; &nbsp;<img src="https://github.com/BBarisKilic/Animated-SVG/blob/master/screenshot/animated_svg_2.png?raw=true" width="300"></p>

&nbsp;

## Getting started

Let's take a look at how to implement `AnimatedSvg` to fastly create cool transition animation between `SVGs`.

First, add the following line to `pubspec.yaml`:
```yaml
animated_svg: ^1.1.0
```

Second, import `AnimatedSvg`:
```dart
import 'package:animated_svg/animated_svg.dart';
import 'package:animated_svg/animated_svgcontroller.dart';
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

More examples can be found in `/example` folder on [GitHub](https://github.com/BBarisKilic/Animated-SVG). 

[Media Player](https://github.com/BBarisKilic/Animated-SVG/tree/master/example/media_player) - an example of basic implementation of `AnimatedSvg`. Simple project that simulates a media player. As usual, the player needs play and pause buttons. Thanks to the `AnimatedSvg` package, it is so easy to create a smooth transition between play and pause SVGs.

&nbsp;

## Additional information

This package has been written solely in Dart Language yet it has the [flutter_svg](https://github.com/dnfield/flutter_svg) as a dependency.

For more information please visit [GitHub](https://github.com/BBarisKilic/Animated-SVG).

&nbsp;

## Feature requests and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/BBarisKilic/Animated-SVG/issues).

&nbsp;

## Maintainers

- [Bulent Baris Kilic](https://github.com/BBarisKilic)