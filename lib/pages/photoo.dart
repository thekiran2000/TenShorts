import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Photoo extends StatefulWidget {
  @override
  _PhotooState createState() => _PhotooState();
}

class _PhotooState extends State<Photoo> {
  Map kk={};
  @override
  Widget build(BuildContext context) {
    kk = ModalRoute.of(context).settings.arguments;


    return Container(
      color: Colors.green,
      child: PhotoView(imageProvider: NetworkImage('${kk['photoo']}',)
          ,minScale:0.35,backgroundDecoration: BoxDecoration(

        color: Colors.grey[900],


      )),
    );
  }
}
