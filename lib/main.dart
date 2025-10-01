import 'package:flutter/material.dart';
import 'page_content.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const AnimatedApp());
  }
}

class AnimatedApp extends StatefulWidget {
  const AnimatedApp({super.key});

  @override
  AnimatedAppState createState() => AnimatedAppState();
}

class AnimatedAppState extends State<AnimatedApp> {
  final PageController _pageViewController = PageController(initialPage: 1);
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDarkMode ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Fading Text Animation'),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
              onPressed: _toggleTheme,
            ),
          ],
        ),
        body: PageView(
          controller: _pageViewController,
          children: [
            Center(child: PageContent(index: 1)),
            Center(child: PageContent(index: 2)),
          ],
        ),
      ),
    );
  }
}
