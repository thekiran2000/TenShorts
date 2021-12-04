import 'package:flutter/material.dart';
import 'newsdata.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupp()async
  {
    newsdata inst=newsdata();
    await inst.getdata();
    Navigator.pushReplacementNamed(context,'/home',arguments:{
      "lii":inst.l,
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupp();


  }



  @override
  Widget build(BuildContext context) {




    return Scaffold(
      backgroundColor: Colors.white,
        body:

            Center(child: Image.asset('assets/logo.jpg')),




    );
  }
}
