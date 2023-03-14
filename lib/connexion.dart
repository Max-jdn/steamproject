import 'package:flutter/material.dart';
import 'package:steamproject/inscription.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/accueil.dart';
import 'package:steamproject/detail_jeu.dart';
import 'package:steamproject/mdpoublie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Connexion extends StatelessWidget {
  Connexion({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            //pour éviter l'overflow
            child: Column(
      children: const [
        IndiConnect(),
      ],
    )));
  }
}

class IndiConnect extends StatefulWidget {
  const IndiConnect({Key? key}) : super(key: key);

  @override
  State<IndiConnect> createState() => _IndiConnectState();
}

class _IndiConnectState extends State<IndiConnect> {
  final TextEditingController _emailControllerCon = TextEditingController();
  final TextEditingController _passwordControllerCon = TextEditingController();

  @override
  void dispose() {
    _emailControllerCon.dispose();
    _passwordControllerCon.dispose();

    super.dispose();
  }

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
              'Bienvenue !',
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
              'Veuillez vous connecter ou créer un nouveau compte',
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
            child: TextField(
              controller: _emailControllerCon,
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'GSans',
                color: Colors.white,
              ),
              decoration: const InputDecoration(
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
            height: 12,
          ),
          Container(
            height: 47,
            width: 328,
            decoration: BoxDecoration(
              color: const Color(0xFF1E262C),
              borderRadius: BorderRadius.circular(3),
            ),
            child: TextField(
              controller: _passwordControllerCon,
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'GSans',
                color: Colors.white,
              ),
              decoration: const InputDecoration(
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
                      return const Inscription();
                    },
                  ),
                );
              },
              minWidth: 328,
              height: 47,
              child: const Text(
                'Sinscrire',
                style: TextStyle(
                  fontFamily: 'GSans',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
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
              onPressed: () async {
                final result = await FirebaseFirestore.instance
                    .collection('user')
                    .where('email', isEqualTo: _emailControllerCon.text)
                    .where('password', isEqualTo: _passwordControllerCon.text)
                    .get();

                //if (_emailControllerCon.text == 'gug' &&
                // _passwordControllerCon.text == 'mdp')
                if (result.docs.isNotEmpty) {
                  await Future.delayed(Duration.zero);
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Accueil(),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(_emailControllerCon.text),
                      content:
                          const Text('Identifiants de connexion invalides'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              minWidth: 328,
              height: 47,
              child: const Text(
                'Se connecter ',
                style: TextStyle(
                  fontFamily: 'GSans',
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 162,
          ),
          Container(
            width: 328,
            height: 47,
            alignment: Alignment.bottomCenter,
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MdpOublie();
                    },
                  ),
                );
              },
              minWidth: 328,
              height: 47,
              child: const Text(
                'Mot de passe oublié',
                style: TextStyle(
                  fontFamily: 'GSans',
                  color: Color(0xFFAFB8BB),
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
