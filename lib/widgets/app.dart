import 'package:flutter/material.dart';


AppBar appBarMode({required String title, Color? backgroundColor, required bool centerTitle,  List<IconButton>? actions,}){
  return AppBar(
    title: Text(
     title
    ),
      backgroundColor:backgroundColor,
      centerTitle: true,
       actions: actions,
  );
}