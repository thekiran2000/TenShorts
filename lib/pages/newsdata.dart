import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class newsdata{
  List l;

  newsdata();

  void getdata()async{
    Response response=await get("http://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=8c66ab0e880a416c999788ba917604b1");
    Map data=jsonDecode(response.body);
    l=data['articles'];
  }

}