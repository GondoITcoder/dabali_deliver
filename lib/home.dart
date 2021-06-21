import 'package:dabali_deliver/constants.dart';
import 'package:dabali_deliver/verifierlivraison.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'categorie.dart';
import 'navbar.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text(
          "Dabali",
          style: TextStyle(color: kTextLightColor),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFD32F2F),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 50,
                  child: CupertinoSearchTextField(
                    placeholder: "Code Livraison",
                    placeholderStyle: TextStyle(color: kTextColor),
                    backgroundColor: kTextLightColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                // ignore: deprecated_member_use
                RaisedButton(
                    color: kTextColor,
                    child: Text(
                      "Valider",
                      style: TextStyle(fontSize: 18),
                    ),
                    textColor: Colors.white,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      print("Verification code");
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VerifierLivraison()),
                      );
                    }),
                SizedBox(
                  height: 45,
                ),
                RecipeCard(
                    title: 'Livraisons',
                    rating: '4.9',
                    cookTime: '30 min',
                    thumbnailUrl: "images/livraison.jpg"),
                SizedBox(
                  height: 45,
                ),
                RecipeCard(
                  title: 'Commandes',
                  rating: '4.9',
                  cookTime: '30 min',
                  thumbnailUrl: 'images/commande.jpg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
