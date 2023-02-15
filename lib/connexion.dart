
/*class Connexion extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: myAppBar(),
      body: SingleChildScrollView(//pour éviter l'overflow
        child: Column(
          children: [
            IndiConnect(),
          ],
        ),
      ),
    );
  }
}

class myAppBar extends StatelessWidget implements PreferredSizeWidget{
  Size get preferredSize => new Size.fromHeight(50);
  @override
  Widget build(BuildContext context){
    return AppBar(
      backgroundColor: d_black,
    );

  }
}

class IndiConnect extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2000,
      width: 2000,
      color: d_black,
      child: Container(
          height: 200,
          width: 200,
          color: d_black,
          children: [
            Text(
              'Bienvenue !',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),

            Text(
              'Veuillez vous connecter ou créer un compte pour utiliser l application',
              style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ]
      ),
    );
  }
}*/