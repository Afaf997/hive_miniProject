import 'package:flutter/material.dart';

class ButtonPage extends StatelessWidget {
   const ButtonPage({super.key, required this.icon, this.onpressed, this.backgroundColor});
   final IconData icon;
   final void Function()? onpressed; 
   final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onpressed,
      child: Icon(icon),
      backgroundColor:backgroundColor ,
      
    );
  }
}