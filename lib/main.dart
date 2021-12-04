import 'package:flutter/material.dart';
import 'package:ten_shorts/pages/photoo.dart';
import 'pages/loading.dart';
import 'package:ten_shorts/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      "/": (context)=>Loading(),
      "/home": (context)=>Home(),
      "/photoo": (context)=>Photoo(),

    },
  ));
}

