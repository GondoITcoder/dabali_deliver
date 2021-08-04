import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget modelContainer(String nomPlat, String adresseUser, String quantite,
    bool isCommande, String imageName, String status) {
  return Container(
    height: 150,
    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
        ]),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "$nomPlat",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
                Text(
                  "$adresseUser",
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "$quantite",
                  style: const TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  // image: ExactAssetImage("images/tchep_poisson.jpg"),
                  image: (!isCommande)
                      ? (status == "Delivered")
                          ? ExactAssetImage(
                              "images/img_livraison_effectuer.jpg")
                          : ExactAssetImage("images/img_livraison_annuler.jpeg")
                      : ExactAssetImage("images/tchep_poisson.jpg"),
                  fit: BoxFit.cover,
                ),
              ))
        ],
      ),
    ),
  );
}
