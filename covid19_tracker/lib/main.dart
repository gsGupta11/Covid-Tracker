
import 'package:flutter/material.dart';
import './Pages/home.dart';
import './Pages/india.dart';
import 'Pages/district.dart';
import 'Pages/form.dart';


void main(){
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      routes: {
        "/":(context)=>Home(),
        "/india":(context)=>India(),
        "/form":(context)=>Suggest(),
        "/dis":(context)=>District(),
      },
    )
  );
}