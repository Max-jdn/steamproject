import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/accueil.dart';

class Inscription extends StatelessWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            //pour éviter l'overflow
            child: Column(
      children: const [
        IndiInscript(),
      ],
    )));
  }
}

class IndiInscript extends StatefulWidget {
  const IndiInscript({super.key});

  @override
  State<IndiInscript> createState() => _IndiInscriptState();
}

class _IndiInscriptState extends State<IndiInscript> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _verifyPasswordController =
      TextEditingController();

  get children => null;

  @override
  void dispose() {
    usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _verifyPasswordController.dispose();
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
              'Inscription ',
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
              'Veuillez saisir ces différentes informations, afin que vos listes soient sauvegardées',
              style: TextStyle(
                fontFamily: 'GSans',
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 43,
          ),
          Container(
            height: 47,
            width: 328,
            decoration: BoxDecoration(
              color: const Color(0xFF1E262C),
              borderRadius: BorderRadius.circular(3),
            ),
            child: TextField(
              controller: usernameController,
              cursorColor: Colors.white,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'GSans',
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                hintText: 'Nom d Utilisateur',
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
              controller: _emailController,
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
              controller: _passwordController,
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
            height: 12,
          ),
          Column(
            children: [
              Container(
                height: 47,
                width: 328,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E262C),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: TextField(
                  controller: _verifyPasswordController,
                  cursorColor: Colors.white,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'GSans',
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Vérification du mot de passe',
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
            ],
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
              onPressed: () async {
                if (_passwordController.text !=
                    _verifyPasswordController.text) {
                  showErrorMessage(context);
                  return;
                }

                // add a condition to check if the password is strong enough
                if (_passwordController.text.length < 6) {
                  // show a dialog to tell the user that the password is too weak
                  showAboutDialog(context: context, children: [
                    const Text('The password is too weak'),
                  ]);
                  return;
                }
                // add a condition if the email is with good format
                if (!_emailController.text.contains('@')) {
                  // show a dialog to tell the user that the email is not valid
                  showAboutDialog(context: context, children: [
                    const Text('The email is not valid'),
                  ]);
                  return;
                }

                try {
                  final credential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Accueil();
                    },
                  ),
                );

                FirebaseFirestore.instance.collection('user').add({
                  'username': '${usernameController.text} ',
                  'email': '${_emailController.text} ',
                  'password': '${_passwordController.text} ',
                });
              },
              minWidth: 328,
              height: 47,
              child: const Text(
                'S inscrire',
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

class UserInformation extends StatefulWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  State<UserInformation> createState() => _UserInformation();
}

class _UserInformation extends State<UserInformation> {
  final Stream<QuerySnapshot> _userStream =
      FirebaseFirestore.instance.collection('user').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _userStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nom d\'utilisateur : ${data['username']}'),
                Text('Adresse e-mail : ${data['email']}'),
                Text('Mot de passe : ${data['password']}'),
              ],
            );
          }).toList(),
        );
      },
    );
  }
}

void showErrorMessage(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Erreur'),
        content: const Text(
            'Les deux champs de mot de passe ne sont pas identiques.'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
  return;
}
