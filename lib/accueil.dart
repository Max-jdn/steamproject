import 'package:flutter/material.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/detail_jeu.dart';
import 'package:steamproject/recherche.dart';
import 'package:steamproject/wishlist.dart';
import 'package:steamproject/wishlistvide.dart';
import 'package:steamproject/meslikes.dart';
import 'package:steamproject/meslikesvide.dart';

class Accueil extends StatelessWidget {
  const Accueil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AccueilBar(),
        body: SingleChildScrollView(
            //pour éviter l'overflow
            child: Column(
          children: [
            const SearchSection(),
            const Presentation(),
            GameSection(),
          ],
        )));
  }
}

class AccueilBar extends StatelessWidget implements PreferredSizeWidget {
  const AccueilBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Accueil',
        style: TextStyle(
          fontFamily: 'GSans',
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        IconButton(
            icon: const Icon(
              Icons.favorite_outline_rounded,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LikesVide();
                  },
                ),
              );
            }),
        IconButton(
            icon: const Icon(
              Icons.star_border_outlined,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const WishlistVide();
                  },
                ),
              );
            }),
      ],
      backgroundColor: d_black,
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: d_black,
      padding: const EdgeInsets.fromLTRB(10, 25, 10, 10),
      child: Column(children: [
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E262C),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const TextField(
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Recherche();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E262C),
                ),
                child: const Icon(
                  Icons.search,
                  color: d_purple,
                  size: 26,
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class Presentation extends StatelessWidget {
  const Presentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 422,
      height: 237,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/titanfall2.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 170,
              margin: const EdgeInsets.only(left: 11, top: 50),
              child: const Text(
                'TitanFall 2      Ultimate Edition',
                style: TextStyle(
                  fontFamily: 'GSans',
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 170,
              margin: const EdgeInsets.only(left: 11, top: 100),
              child: const Text(
                'Description de jeu',
                style: TextStyle(
                  fontFamily: 'GSans',
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 162,
          height: 35,
          margin:
              const EdgeInsets.only(left: 10, top: 180, right: 0, bottom: 20),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            color: d_purple,
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 10, top: 5, right: 0, bottom: 0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DetailPage();
                          },
                        ),
                      );
                    },
                    minWidth: 162,
                    height: 35,
                    child: const Text(
                      'En savoir plus ',
                      style: TextStyle(
                        fontFamily: 'GSans',
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 125,
              height: 125,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/titanfall2pochette.png',
                  ),
                  //fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class GameSection extends StatelessWidget {
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

  GameSection({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: d_black,
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Les meilleures ventes',
                  style: TextStyle(
                    fontFamily: 'GSans',
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: gameList.map((game) {
              return GameCard(game);
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  final Map gameData;
  const GameCard(this.gameData, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(9),
      height: 105,
      decoration: const BoxDecoration(
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
                  margin: const EdgeInsets.only(
                      left: 0.0, top: 10.0, bottom: 0.0, right: 0.0),
                  child: Text(
                    gameData['nameJeu'],
                    style: const TextStyle(
                      fontFamily: 'GSans',
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 0.0, top: 15.0, bottom: 0.0, right: 0.0),
                  child: Text(
                    gameData['editor'],
                    style: const TextStyle(
                      fontFamily: 'GSans',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 0.0, top: 20.0, bottom: 0.0, right: 0.0),
                  child: Text(
                    'Prix : ' + gameData['price'] + ' €',
                    style: const TextStyle(
                      fontFamily: 'GSans',
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100,
            decoration: const BoxDecoration(
              color: d_purple,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(3),
                bottomRight: Radius.circular(3),
              ),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const DetailPage();
                    },
                  ),
                );
              },
              minWidth: 100,
              height: 105,
              child: const Text(
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
