# Flutter Hero Animation with Advanced Transition Effects

This Flutter application demonstrates a **Hero Animation** with advanced visual effects such as scaling, rotation, and bounce animations. The app features a grid of icons that transition smoothly to a **full-screen icon** with a beautiful and unique animation when tapped.

## Features

- **Hero Animation**: Uses Flutter's `Hero` widget to create a seamless transition between a thumbnail icon and the full-screen icon.
- **Advanced Animations**:
  - **Scale**: The icon scales up smoothly during the transition.
  - **Rotation**: The icon rotates slightly to add a dynamic effect.
  - **Bounce**: The icon uses the `elasticOut` curve to create a playful bounce effect.
- **Opacity Transition**: The opacity of the icon fades in for a smoother visual experience.

## Screenshots
![transition](https://github.com/user-attachments/assets/d5b832b9-95ab-40c9-b631-d92b91645aec)


## How It Works

### 1. **Home Screen**:
The home screen displays a grid of icons. When any icon is tapped, the `Hero` widget triggers the animation, navigating to a full-screen view with the corresponding icon.

### 2. **Full-Screen Icon**:
The full-screen icon is displayed with enhanced animations such as scaling, rotating, and fading in. The animation is powered by Flutter’s `AnimatedBuilder` and `Tween` classes, which allow fine control over animation properties.

### 3. **Advanced Animations**:
- **Scaling**: The icon smoothly scales from a smaller size on the home screen to a larger size on the destination screen.
- **Rotation**: The icon rotates during the transition for added dynamism.
- **Bounce Effect**: The icon performs a bounce effect using the `Curves.elasticOut` curve.
- **Opacity**: The opacity of the icon fades in smoothly, enhancing the visual flow of the transition.

### 4. **Hero Widget**:
The `Hero` widget links the icon on the home screen to the full-screen view. The `tag` property ensures that both screens are synchronized during the animation.

https://docs.flutter.dev/ui/animations/hero-animations
