import 'package:flutter/material.dart';

import 'constants.dart';
import 'navbar.dart';

class VerifierLivraison extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  VerifierLivraison({this.assetPath, this.cookieprice, this.cookiename});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          "Détail Livraison",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFD32F2F),
      ),
      body: ListView(children: [
        SizedBox(height: 50.0),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('Frittes poulet',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: kTextColor)),
        ),
        SizedBox(height: 50.0),
        Hero(
            tag: "poulet",
            child: Image.asset("images/fritte_poulet.jpg",
                height: 150.0, width: 100.0, fit: BoxFit.contain)),
        SizedBox(
          height: 50.0,
        ),
        Center(
          child: Text("2500 Fcfa",
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink)),
        ),
        SizedBox(
          height: 20.0,
        ),
        Center(
          child: Text(
            "Détails",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text('Lieu: Riviéra Bonoumin',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                )),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text('Nom client: Traoré aminata',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19.0,
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                )),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Livraison Effectuer");
        },
        backgroundColor: mainColor,
        child: Icon(Icons.fastfood),
      ),
    );
  }
}
