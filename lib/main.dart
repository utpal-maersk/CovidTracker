import 'package:flutter/material.dart';
import 'datasource.dart';
import 'homepage.dart';
import 'data_from_net/api_internet_doc.dart';

void main(){
  runApp(MaterialApp(
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
            fontFamily: 'Circular',
            primaryColor: Color(0xFF202c3b),
      )
    ,
      home: API_Internet_Doc()
      //HomePage(),
  ));
}