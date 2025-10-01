import 'package:flutter/material.dart';

class PageContent extends StatefulWidget {
  const PageContent({super.key, required this.index});

  final int index;

  @override
  State<PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  bool _isVisible = true;

  void toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleVisibility,
      child: AnimatedOpacity(
        curve: Curves.easeInOut,
        opacity: _isVisible ? 1.0 : 0.0,
        duration: Duration(milliseconds: 400 * widget.index),
        child: const Text('Hello, Flutter!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
