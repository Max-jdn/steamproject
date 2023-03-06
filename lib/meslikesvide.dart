import 'package:flutter/material.dart';
import 'package:steamproject/main.dart';
import 'package:steamproject/meslikes.dart';


class LikesVide extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: LikesBar(),
        body: SingleChildScrollView(//pour éviter l'overflow
            child: Column(
              children: [
                PageVide(),
              ],
            )
        )
    );
  }
}

class PageVide extends StatelessWidget {
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
                Icons.favorite_sharp,
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
              'Cliquez sur le coeur pour en rajouter ',
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

