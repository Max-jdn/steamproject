import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const d_black=Color(0xFF1A2025);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projet Steam',
      home: Accueil(),
    );
  }
}

class Accueil extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AccueilBar(),
        body: SingleChildScrollView(//pour éviter l'overflow
            child: Column(
              children: [
              ],
            )
        )
    );
  }
}

class AccueilBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context){
    return AppBar(
      title: Text(
        'Accueil',
            style: GoogleFonts.nunito(
          color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      ),
    actions: [
    IconButton(
    icon: Icon(
    Icons.favorite_outline_rounded,
    color: Colors.white,
    size: 20,
    ),
    onPressed: null,
    ),
    IconButton(
    icon: Icon(
    Icons.star_border_outlined,
    color: Colors.white,
    size: 20,
    ),
    onPressed: null,
    ),
    ],
    backgroundColor: d_black,
    );
  }
}


