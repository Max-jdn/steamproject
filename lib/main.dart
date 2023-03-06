import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:steamproject/connexion.dart';
import 'package:steamproject/detail_jeu.dart';
import 'package:steamproject/accueil.dart';

const d_black = Color(0xFF1A2025);
const d_purple = Color(0xFF636AF6);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projet Steam',
      home: Connexion(),
    );
  }
}
