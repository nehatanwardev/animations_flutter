# Flutter Explicit Animations

This project demonstrates how to create explicit animations in Flutter. Unlike implicit animations, explicit animations give developers complete control over the animation sequence and timing.

## What are Explicit Animations?

Explicit animations in Flutter require manual control of the animation using an `AnimationController`. This gives more granular control over:

- Animation timing and duration
- Animation curves and interpolation
- Combined/sequenced animations
- Animation playback (play, pause, reverse, stop)

The key components of explicit animations include:

1. **AnimationController**: Controls the animation (requires a TickerProvider)
2. **Animation<T>**: Defines how a value changes over time
3. **Tween<T>**: Specifies the range of values to animate between
4. **CurvedAnimation**: Applies easing curves to create more natural movements
5. **AnimatedBuilder/XXXTransition**: Widgets that rebuild as animation values change

## Example: Animated Bottom Sheet

This project contains an example of a beautifully animated bottom sheet using explicit animations. The example features:

- **Scale animation**: The content scales up as it appears
- **Fade animation**: The content fades in smoothly
- **Slide animation**: The content slides up from the bottom
- **Combined animations**: All animations run simultaneously with their own timing

### Implementation Details

The implementation uses:

- `AnimationController` with a duration of 600ms
- Flutter's built-in `showModalBottomSheet` with custom rounded corners
- Multiple animation types (scale, fade, slide) combined for a polished effect
- Proper animation disposal to prevent memory leaks

### Key Code Elements

```dart
// Animation setup
_controller = AnimationController(
  vsync: this,
  duration: Duration(milliseconds: 600),
);

_scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
  CurvedAnimation(parent: _controller, curve: Curves.easeOut),
);

// Animation usage
return FadeTransition(
  opacity: _fadeAnimation,
  child: SlideTransition(
    position: _slideAnimation,
    child: ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        // Content here
      ),
    ),
  ),
);
```

## How to Run

1. Ensure you have Flutter installed
2. Clone the repository
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to launch the app

## Learn More

To learn more about explicit animations in Flutter, check out:

- [Flutter Animation Tutorial](https://flutter.dev/docs/development/ui/animations/tutorial)
- [Animation and Motion Widgets](https://flutter.dev/docs/development/ui/widgets/animation)
