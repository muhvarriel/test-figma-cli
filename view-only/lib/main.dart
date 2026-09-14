import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const AquaApp());
}

class AquaApp extends StatelessWidget {
  const AquaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AQUA Delivery',
      debugShowCheckedModeBanner: false,
      theme: buildAquaTheme(),
      home: const AquaHomeScreen(),
    );
  }
}
