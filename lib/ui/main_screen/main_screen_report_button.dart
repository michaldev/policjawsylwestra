import 'package:flutter/material.dart';

class MainScreenReportButton extends StatelessWidget {
  final ValueGetter onTap;

  MainScreenReportButton({@required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.report,
                color: Colors.white,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                'Zgłoś lokalizację policji'.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
    );
  }
}
