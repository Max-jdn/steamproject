import 'package:flutter/material.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/wishlist.dart';

class WishlistVide extends StatelessWidget {
  const WishlistVide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const WishlistBar(),
        body: SingleChildScrollView(
            //pour éviter l'overflow
            child: Column(
          children: const [
            PageVideW(),
          ],
        )));
  }
}

class PageVideW extends StatelessWidget {
  const PageVideW({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 600,
        height: 600,
        alignment: Alignment.center,
        color: d_black,
        child: Column(
          children: [
            const SizedBox(
              height: 204,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E262C),
                ),
                child: const Icon(
                  Icons.star_sharp,
                  color: Colors.white,
                  size: 94,
                ),
              ),
            ),
            Container(
              width: 352,
              child: const Text(
                'Vous n avez pas encore liké de contenu !'
                'Cliquez sur l étoile pour en rajouter ',
                style: TextStyle(
                  fontFamily: 'GSans',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ));
  }
}
