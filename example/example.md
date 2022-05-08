# Example
 
[Media Player](https://github.com/BBarisKilic/Animated-SVG/tree/master/example/media_player) - an example of basic implementation of `AnimatedSvg`. Simple project that simulates a media player. As usual, the player needs play and pause buttons. Thanks to the `AnimatedSvg` package, it is so easy to create a smooth transition between play and pause SVGs.

---

`main.dart`
```dart
late final SvgController _controller;

@override
void initState() {
    _controller = AnimatedSvgController();
    super.initState();
}

@override
void dispose() {
    _controller.dispose();
    super.dispose();
}

@override
Widget build(BuildContext context) {
    return AnimatedSvg(
        controller: _controller,
        duration: const Duration(milliseconds: 600),
        onTap: () {},
        size: 80,
        clockwise: false,
        isActive: true,
        children: [
            SvgPicture.asset(
                'assets/play.svg',
                height: 40,
                width: 40,
            ),
            SvgPicture.asset(
                'assets/pause.svg',
                height: 40,
                width: 40,
            ),
        ],
    );
}
```

---