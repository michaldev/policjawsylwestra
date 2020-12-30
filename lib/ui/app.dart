import 'package:flutter/material.dart';
import 'package:policjawsylwestra/ui/main_screen/main_screen.dart';
import 'package:policjawsylwestra/ui/permission_screen/permission_screen.dart';

class MyApp extends StatelessWidget {
  final bool permissionGranted = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Policja w Sylwestra',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: permissionGranted ? MainScreen() : PermissionScreen(),
    );
  }
}
