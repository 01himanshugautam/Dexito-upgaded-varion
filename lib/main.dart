import 'package:dexito/ui/screens/on_boarding_screen.dart';
import 'package:dexito/ui/utilities/size_configration.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'App',
              home: OnboardingScreen(),
            );
          },
        );
      },
    );
  }
}
