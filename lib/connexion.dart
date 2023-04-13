import 'package:flutter/material.dart';
import 'package:steamproject/api.dart';
import 'package:steamproject/inscription.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/accueil.dart';
import 'package:steamproject/mdpoublie.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() {
    return _ConnexionState();
  }
}

class _ConnexionState extends State<Connexion> {
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
      height: 1000,
      width: 1000,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background.png',
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
          const Text(
            'Bienvenue !',
            style: TextStyle(
              fontFamily: 'GSans',
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          const Text(
            'Veuillez vous connecter ou créer un nouveau compte',
            style: TextStyle(
              fontFamily: 'GSans',
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w400,
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
                try {
                  final credential = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                      email: _emailControllerCon.text,
                      password: _passwordControllerCon.text);

                  if (credential.user != null) {
                    // Navigate to the home page if authentication was successful
                    // ignore: use_build_context_synchronously
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Accueil()),
                    );
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found' ||
                      e.code == 'wrong-password') {
                    // Display an error message if authentication failed
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Erreur de connexion'),
                        content:
                        const Text('Identifiants invalides. Veuillez réessayer.'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
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
                      return const MdpOublie();
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
