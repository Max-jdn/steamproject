import 'package:flutter/material.dart';
import 'package:steamproject/inscription.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/accueil.dart';
import 'package:steamproject/detail_jeu.dart';
import 'package:steamproject/mdpoublie.dart';

class Connexion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: SingleChildScrollView(//pour éviter l'overflow
            child: Column(
              children: [
                IndiConnect(),
              ],
            )
        )
    );
  }
}

class IndiConnect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: d_black,
      height: 1000,
      width: 1000,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 51,
          ),
          Container(
            child: Text(
              'Bienvenue !',
              style: TextStyle(
                fontFamily: 'GSans',
                color:Colors.white,
                fontSize:30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Container(
            child: Text(
              'Veuillez vous connecter ou créer un nouveau compte',
              style: TextStyle(
                fontFamily: 'GSans',
                color:Colors.white,
                fontSize:15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 47,
            width: 328,
            decoration: BoxDecoration(
              color: Color(0xFF1E262C),
              borderRadius: BorderRadius.circular(3),
            ),
            child: TextField(
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'GSans',
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: 'E-mail',
                hintStyle: TextStyle(
                  fontFamily: 'GSans',
                  fontSize: 14,
                  color: Color(0xFFEDF0F3),
                ),
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            height: 47,
            width: 328,
            decoration: BoxDecoration(
              color: Color(0xFF1E262C),
              borderRadius: BorderRadius.circular(3),
            ),
            child: TextField(
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'GSans',
                color: Colors.white,
              ),
              decoration: InputDecoration(
                hintText: 'Mot de Passe',
                hintStyle: TextStyle(
                  fontFamily: 'GSans',
                  fontSize: 14,
                  color: Color(0xFFEDF0F3),
                ),
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(height: 73,),
          Container(
            width: 328,
            height: 47,
            decoration: BoxDecoration(
              color: d_purple,
              borderRadius: BorderRadius.circular(3),

            ),
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context){
                  return Accueil();
                },
                ),
                );
              },
              minWidth: 328,
              height: 47,

              child: Text(
                'Se connecter',
                style: TextStyle(
                  fontFamily: 'GSans',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 15,),
          Container(
            width: 328,
            height: 47,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: d_purple,
                width: 1.20,
              ),
            ),
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context){
                  return Inscription();
                },
                ),
                );
              },
              minWidth: 328,
              height: 47,

              child: Text(
                'Créer un nouveau compte',
                style: TextStyle(
                  fontFamily: 'GSans',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 162,),
          Container(
            width: 328,
            height: 47,
            alignment: Alignment.bottomCenter,

            child: MaterialButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context){
                  return MdpOublie();
                },
                ),
                );
              },
              minWidth: 328,
              height: 47,

              child: Text(
                'Mot de passe oublié',
                style: TextStyle(
                  fontFamily: 'GSans',
                  color: Color(0xFFAFB8BB),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  decoration:TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}