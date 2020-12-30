import 'package:flutter/material.dart';
import 'package:policjawsylwestra/ui/main_screen/main_screen_map.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: MainScreenMap(),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.red,
              child: Center(
                  child: Text(
                'Zgłoś lokalizację policji'.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              )))
        ],
      ),
    );
  }
}
