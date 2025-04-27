import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // List of icon data
  final List<IconData> iconList = [
    Icons.home,
    Icons.search,
    Icons.notifications,
    Icons.settings,
  ];

  final List<String> iconLabels = [
    'Home',
    'Search',
    'Notifications',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation Example')),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
        ),
        itemCount: iconList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to FullScreenIcon with Hero animation
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: HeroIconScreen(
                        icon: iconList[index],
                        label: iconLabels[index],
                        animation: animation,
                      ),
                    );
                  },
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Card(
                color: Colors.blueAccent,
                child: Center(
                  child: Hero(
                    tag: 'iconHero$index', // Unique tag for each icon
                    child: Icon(
                      iconList[index],
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HeroIconScreen extends StatelessWidget {
  final IconData icon;
  final String label;
  final Animation<double> animation;

  HeroIconScreen({
    required this.icon,
    required this.label,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: Center(
        child: Hero(
          tag: 'iconHero$label', // Same tag as the thumbnail icon
          child: AnimatedBuilder(
            animation: animation,
            builder: (context, child) {
              // Scale and Rotation effect for the icon
              final scale = Tween<double>(begin: 0.8, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.elasticOut, // Adding bounce effect
                ),
              );

              final rotation = Tween<double>(begin: 0.0, end: 0.5).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              );

              final opacity = Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              );

              return FadeTransition(
                opacity: opacity,
                child: Transform(
                  transform: Matrix4.identity()
                    ..scale(scale.value)
                    ..rotateZ(rotation.value),
                  alignment: Alignment.center,
                  child: Icon(
                    icon,
                    size: 150,
                    color: Colors.blueAccent,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
