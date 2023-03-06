import 'package:flutter/material.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/wishlist.dart';


class WishlistVide extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: WishlistBar(),
        body: SingleChildScrollView(//pour éviter l'overflow
            child: Column(
              children: [
                PageVideW(),
              ],
            )
        )
    );
  }
}

class PageVideW extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
        height: 600,
        alignment: Alignment.center,
        color: d_black,
        child : Column(
          children: [
            SizedBox(
              height: 204,
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){},
                child: Icon(
                  Icons.star_sharp,
                  color: Colors.white,
                  size : 94,
                ),
                style : ElevatedButton.styleFrom(
                  primary: Color(0xFF1E262C),
                ),
              ),
            ),
            Container(
              width : 352,
              child: Text(
                'Vous n avez pas encore liké de contenu !'+
                    'Cliquez sur l étoile pour en rajouter ',
                style: TextStyle(
                  fontFamily: 'GSans',
                  color:Colors.white,
                  fontSize:15,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],

        )

    );
  }
}

