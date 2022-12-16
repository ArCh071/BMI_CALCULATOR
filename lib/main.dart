import 'package:flutter/material.dart';

import 'homescreen.dart';
void main() => runApp(
    MaterialApp(
      theme: ThemeData(
          primaryColor:Colors.blueGrey
      ),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    )
);