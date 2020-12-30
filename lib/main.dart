import 'package:flutter/material.dart';
import 'package:policjawsylwestra/locator.dart';
import 'package:policjawsylwestra/ui/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();
  runApp(MyApp());
}
