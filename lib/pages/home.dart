import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tiktoklikescroller/tiktoklikescroller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map kk={};

  FlutterTts flutterTts = FlutterTts();

  bool stopspeech=true;





  @override
  Widget build(BuildContext context) {



    kk = ModalRoute.of(context).settings.arguments;
//    List p=kk['lii'];
    final List p = kk['lii'];

    Future _speak(String s) async{

      await flutterTts.setLanguage('en-IN');
      await flutterTts.setPitch(0.8);
      await flutterTts.setSpeechRate(1);
      await flutterTts.setVolume(0.9);
      await flutterTts.speak(s);



    }
    Future _speakstop(String s) async{

      await flutterTts.stop();

    }
    return Scaffold(
      backgroundColor: Colors.grey[600],
      body: TikTokStyleFullPageScroller(
        contentSize: p.length,
        swipeThreshold: 0.01,
        // ^ the fraction of the screen needed to scroll
        swipeVelocityThreshold: 10,
        // ^ the velocity threshold for smaller scrolls
        animationDuration: const Duration(milliseconds: 300),
        // ^ how long the animation will take
        builder: (BuildContext context, int index) {
          return SafeArea(
            child: Container(
              color: Colors.blueGrey[200],

              child: Column(

                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: InkWell(onTap:(){
                      Navigator.pushNamed(context, '/photoo',arguments: {
                        'photoo':p[index]['urlToImage'],
                      });
                    },child: Image.network('${p[index]['urlToImage']}',height: 265,width:double.infinity,fit: BoxFit.cover)),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      stopspeech ? Container(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap:(){
                              _speak('${p[index]['title']}');
                              setState(() {
                                stopspeech=false;
                              });
                            },
                            child: Icon(
                              Icons.volume_up,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),
                      ):
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap:(){
                            _speakstop('${p[index]['title']}');
                            setState(() {
                              stopspeech=true;
                            });
                          },
                          child: Icon(
                            Icons.volume_off,
                            color: Colors.grey[800],
                          ),
                        ),
                      ),



                      Container(

                        child: Card(

                          elevation: 5.0,

                          color: Colors.grey[800],
                          child: InkWell(
                            splashColor: Colors.blueAccent.withAlpha(30),

                            onTap: () {
                              launch('${p[index]['url']}');
                            },
                            child: Container(
                              width: 323,
                              height: 94,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,

                                  colors: [
                                    Colors.grey[800],
                                    Colors.blueGrey[500],

                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
                                child: Center(child: Text('${p[index]['title']}',style: GoogleFonts.robotoSlab(fontSize: 18,color: Colors.grey[200]))),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2,),
                  Container(
                    height: 323,
                    child: Card(

//                      color: Colors.red,
//                    elevation: 2.0,
//                    shadowColor: Colors.grey[700],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(5),
                              bottomLeft:Radius.circular(5) ,
                              topLeft:Radius.circular(5) ,
                              topRight: Radius.circular(5)),

                          side: BorderSide(width: 0.05, color: Colors.white70)),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,

                            colors: [
                              Colors.grey[100],
                              Colors.blueGrey[500],

                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                              '${p[index]['description']}',
                              style:GoogleFonts.robotoSlab(fontSize: 21, color: Colors.brown[900],letterSpacing: 0.1)
                          ),
                        ),
                      ),
                    ),
                  ),


                ],
              ),

            ),
            

          );
        },
      ),
    );

  }
}
