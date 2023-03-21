import 'package:flutter/material.dart';
import 'package:steamproject/inscription.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/accueil.dart';
import 'package:steamproject/detail_jeu.dart';
import 'package:steamproject/mdpoublie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

Future<bool> signIn(String email, String password) async {
  try {
    // Vérifier si les champs email et mot de passe sont vides ou non valides
    if (email.isEmpty || password.isEmpty) {
      print('Veuillez saisir un email et un mot de passe valides.');
      return false;
    }

    // Authentifier l'utilisateur avec Firebase
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return FirebaseAuth.instance.currentUser != null;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('Utilisateur non trouvé pour l\'email donné.');
    } else if (e.code == 'wrong-password') {
      print('Mot de passe incorrect.');
    } else {
      print('Erreur d\'authentification : $e');
    }
    return false;
  }
}

class _IndiConnectState extends State<IndiConnect> {
  final TextEditingController _emailControllerCon = TextEditingController();
  final TextEditingController _passwordControllerCon = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    _emailControllerCon.dispose();
    _passwordControllerCon.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1000,
      width: 1000,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/background.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
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
                bool signInSuccess = false;
                while (!signInSuccess) {
                  if (!(await signIn(
                      _emailControllerCon.text, _passwordControllerCon.text))) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Erreur de connexion'),
                        content: const Text(
                            'Veuillez saisir un email et un mot de passe valides.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                    return;
                  }

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Accueil(),
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
