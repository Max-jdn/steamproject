import 'package:flutter/material.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/meslikes.dart';
import 'package:steamproject/meslikesvide.dart';
import 'package:steamproject/wishlist.dart';
import 'package:steamproject/wishlistvide.dart';
import 'package:steamproject/api.dart';

class DetailJeuBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Détails du jeu',
        style: TextStyle(
          fontFamily: 'GSans',
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
            icon: Icon(
              Icons.star_border_outlined,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Api();
                  },
                ),
              );
            }),
        IconButton(
            icon: Icon(
              Icons.star_border_outlined,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const Api();
                  },
                ),
              );
            }),
      ],
      backgroundColor: d_black,
    );
  }
}

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DetailPage> {
  SelectedTab _tab = SelectedTab.description;

  @override
  Widget build(BuildContext context) {
    print(_tab);

    return Scaffold(
      backgroundColor: d_black,
      appBar: DetailJeuBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  width: 528,
                  height: 297,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/battlefield1gasMask.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFF1E262C),
                        ),
                        margin: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 35.0),
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        height: 100,
                        width: 350,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              height: 78,
                              width: 62,
                              child: Container(
                                width: 79,
                                height: 79,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/battlefield1pochette.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Text(
                                  'Nom du jeu',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Nom de l\'éditeur',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 17),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _tab = SelectedTab.description;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                          ),
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          primary: d_purple,
                        ),
                        child: const Text(
                          'DESCRIPTION',
                          style: TextStyle(
                            fontFamily: 'GSans',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ),
                  Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _tab = SelectedTab.review;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          primary: d_purple,
                        ),
                        child: const Text(
                          'AVIS',
                          style: TextStyle(
                            fontFamily: 'GSans',
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Stack(children: [
              Offstage(
                  offstage: _tab != SelectedTab.description,
                  child: const DescriptionTab()),
              Offstage(
                  offstage: _tab != SelectedTab.review,
                  child: const ReviewsTab()),
            ])
          ],
        ),
      ),
    );
  }
}

enum SelectedTab { description, review }

class DescriptionTab extends StatelessWidget {
  const DescriptionTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Description",
      style: TextStyle(
        fontFamily: 'GSans',
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Avis",
      style: TextStyle(
        fontFamily: 'GSans',
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
