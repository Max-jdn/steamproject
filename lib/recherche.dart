import 'package:flutter/material.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/detail_jeu.dart';

class Recherche extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: RechercheBar(),
        body: SingleChildScrollView(//pour éviter l'overflow
            child: Column(
              children: [
                SearchSectionR(),
                GameSectionR(),
              ],
            )
        )
    );
  }
}

class RechercheBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context){
    return AppBar(
      title: Text(
        'Recherche',
        style: TextStyle(
          fontFamily: 'GSans',
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: d_black,
    );
  }
}

class SearchSectionR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: d_black,
      padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(
          children:[
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left:5),
                    decoration: BoxDecoration(
                      color:Color(0xFF1E262C),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(
                        fontFamily: 'GSans',
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Rechercher un jeu...',
                        hintStyle: TextStyle(
                          fontFamily: 'GSans',
                          fontSize: 13,
                          color: Color(0xFFEDF0F3),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                //SizedBox(width: 10),
                Container(
                  height: 50,
                  width: 50,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Icon(
                      Icons.search,
                      color: d_purple,
                      size : 26,
                    ),
                    style : ElevatedButton.styleFrom(
                      primary: Color(0xFF1E262C),
                    ),
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}

class GameSectionR extends StatelessWidget {
  final List gameList = [
    {
      'nameJeu': 'Nom du Jeu',
      'editor': 'Nom de l editeur',
      'picture': 'assets/images/Destiny2pochette.png',
      'price': '180',
    },
    {
      'nameJeu': 'Nom du Jeu',
      'editor': 'Nom de l editeur',
      'picture': 'assets/images/Destiny2pochette.png',
      'price': '180',
    },
    {
      'nameJeu': 'Nom du Jeu',
      'editor': 'Nom de l editeur',
      'picture': 'assets/images/Destiny2pochette.png',
      'price': '180',
    },
    {
      'nameJeu': 'Nom du Jeu',
      'editor': 'Nom de l editeur',
      'picture': 'assets/images/Destiny2pochette.png',
      'price': '180',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: d_black,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nombre de résultats : 4',
                  style: TextStyle(
                    fontFamily: 'GSans',
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    decoration:TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),

          Column(
            children: gameList.map((game){
              return GameCardR(game);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class GameCardR extends StatelessWidget{
  final Map gameData;
  GameCardR(this.gameData);
  @override
  Widget build(BuildContext context){
    return Container(
      margin: EdgeInsets.all(9),
      height: 105,
      decoration: BoxDecoration(
        color: Color(0xFF1E262CE6),
        borderRadius: BorderRadius.all(
          Radius.circular(3),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 78,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  gameData['picture'],
                ),
              ),
            ),
          ),
          Container(
            width: 164,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 0.0,top: 10.0, bottom: 0.0, right:0.0),
                  child: Text(
                    gameData['nameJeu'],
                    style: TextStyle(
                      fontFamily: 'GSans',
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0.0,top: 15.0, bottom: 0.0, right:0.0),
                  child: Text(
                    gameData['editor'],
                    style: TextStyle(
                      fontFamily: 'GSans',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 0.0,top: 20.0, bottom: 0.0, right:0.0),
                  child: Text(
                    'Prix : '+gameData['price']+' \€',
                    style: TextStyle(
                      fontFamily: 'GSans',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      decoration:TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            decoration: BoxDecoration(
              color: d_purple,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(3),
                bottomRight: Radius.circular(3),
              ),
            ),
            child: MaterialButton(
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder:(context){
                  return DetailPage();
                },
                ),
                );
              },
              minWidth: 100,
              height: 105,
              child: Text(
                'En savoir plus ',
                style: TextStyle(
                  fontFamily: 'GSans',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


