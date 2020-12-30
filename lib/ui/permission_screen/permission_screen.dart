import 'package:flutter/material.dart';

class PermissionScreen extends StatelessWidget {
  static const description =
      'Lokalizacja wykorzystana zostanie w dwóch przypadkach. Podczas określania Twojej bieżącej lokalizacji w podglądzie na mapie oraz przy zgłaszaniu patrolu.';

  static const title = 'Pozwól na użycie lokalizacji';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 23),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
                width: 280,
                child: Text(
                  description,
                  style: TextStyle(
                      fontSize: 16, color: Colors.white.withOpacity(0.8)),
                )),
          ),
          SizedBox(
            height: 20,
          ),
          OutlineButton(
            onPressed: () {},
            child: Text(
              'Zezwól',
            ),
          )
        ],
      ),
    );
  }
}
