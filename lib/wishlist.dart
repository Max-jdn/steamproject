import 'package:flutter/material.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/detail_jeu.dart';

class Wishlist extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: WishlistBar(),
        body: SingleChildScrollView(//pour éviter l'overflow
            child: Column(
              children: [
                GameSectionW(),
              ],
            )
        )
    );
  }
}

class WishlistBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context){
    return AppBar(
      title: Text(
        'Ma liste de souhait',
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

class GameSectionW extends StatelessWidget {
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
              return GameCardW(game);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class GameCardW extends StatelessWidget{
  final Map gameData;
  GameCardW(this.gameData);
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


