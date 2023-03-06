import 'package:flutter/material.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/accueil.dart';

class MdpOublie extends StatelessWidget {
  const MdpOublie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            //pour éviter l'overflow
            child: Column(
      children: [
        IndiMdp(),
      ],
    )));
  }
}

class IndiMdp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: d_black,
      height: 1000,
      width: 1000,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 51,
          ),
          Container(
            child: const Text(
              'Mot de passe oublié',
              style: TextStyle(
                fontFamily: 'GSans',
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            child: const Text(
              'Veuillez saisir votre e-mail afin de réinitialiser votre mot de passe',
              style: TextStyle(
                fontFamily: 'GSans',
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            height: 47,
            width: 328,
            decoration: BoxDecoration(
              color: const Color(0xFF1E262C),
              borderRadius: BorderRadius.circular(3),
            ),
            child: const TextField(
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
          const SizedBox(
            height: 73,
          ),
          Container(
            width: 328,
            height: 47,
            decoration: BoxDecoration(
              color: d_purple,
              borderRadius: BorderRadius.circular(3),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Accueil();
                    },
                  ),
                );
              },
              minWidth: 328,
              height: 47,
              child: const Text(
                'Renvoyer mon mot de passe ',
                style: TextStyle(
                  fontFamily: 'GSans',
                  color: Colors.white,
                  fontSize: 15,
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
