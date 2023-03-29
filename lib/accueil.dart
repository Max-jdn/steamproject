import 'package:flutter/material.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/detail_jeu.dart';
import 'package:steamproject/recherche.dart';
import 'package:steamproject/wishlist.dart';
import 'package:steamproject/wishlistvide.dart';
import 'package:steamproject/meslikes.dart';
import 'package:steamproject/meslikesvide.dart';
import 'package:steamproject/api.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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

Future<List<Rank>> fetchGames() async {
  try {
    final response = await http.get(
      Uri.https(
          'api.steampowered.com', '/ISteamChartsService/GetMostPlayedGames/v1'),
      headers: {
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        "Access-Control-Allow-Credentials":
            'true', // Required for cookies, authorization headers with HTTPS
        "Access-Control-Allow-Headers":
            "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "GET, OPTIONS",
      },
    );

    if (response.statusCode == 200) {
      return await _getGameDetails(
          Games.fromJson(jsonDecode(response.body)).ranks);
    } else {
      throw Exception('Failed to load games: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Failed to load games: $e');
  }
}

Future<List<Rank>> _getGameDetails(List<Rank> ranks) async {
  List<Rank> updatedRanks = [];
  for (var rank in ranks) {
    final response = await http.get(
      Uri.parse(
          'https://store.steampowered.com/api/appdetails?appids=${rank.appId}'),
    );
    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      if (jsonBody[rank.appId.toString()]['success']) {
        rank.name = jsonBody[rank.appId.toString()]['data']['name'];
      }
    }
    updatedRanks.add(rank);
  }
  return updatedRanks;
}

class Games {
  final int rollupDate;
  final List<Rank> ranks;

  Games({
    required this.rollupDate,
    required this.ranks,
  });

  factory Games.fromJson(Map<String, dynamic> json) {
    return Games(
      rollupDate: json['response']['rollup_date'],
      ranks: List<Rank>.from(
        json['response']['ranks'].map(
          (rankJson) => Rank.fromJson(rankJson),
        ),
      ),
    );
  }
}

class Rank {
  final int rank;
  final int appId;
  final int lastWeekRank;
  final int peakInGame;
  String? name;

  Rank({
    required this.rank,
    required this.appId,
    required this.lastWeekRank,
    required this.peakInGame,
    this.name,
  });

  factory Rank.fromJson(Map<String, dynamic> json) {
    return Rank(
      rank: json['rank'],
      appId: json['appid'],
      lastWeekRank: json['last_week_rank'],
      peakInGame: json['peak_in_game'],
      name: json['name'],
    );
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

class GameSection extends StatefulWidget {
  GameSection({super.key});
  @override
  State<GameSection> createState() => _GameSectionState();
}

class _GameSectionState extends State<GameSection> {
  late Future<List<Rank>> futureGames;
  @override
  void initState() {
    super.initState();
    futureGames = fetchGames();
  }

  final List gameList = [
    {
      'nameJeu': 'nom du game',
      'editor': 'Nom de l editeur',
      'picture': 'assets/images/Destiny2pochette.png',
      'price': '180',
    },
  ];

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
