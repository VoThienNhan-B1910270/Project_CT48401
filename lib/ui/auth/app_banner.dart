import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.symmetric(
        vertical: 1.0,
        horizontal: 10.0,
      ),
      child:  Stack(
        children: const <Widget>[
          Positioned(
            left: 10,
            top: 0,
            child: Text(
              'Shop Hoa',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Anton',
                fontWeight: FontWeight.normal,
                ),
              ),
            ),
          Positioned(
            left: 10,
            top: 31,
            child: Text(
              'Thùy Dương Flower',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Anton',
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    );
  }
}
