import 'package:dabali_deliver/widgets/couleur.dart';
import 'package:dabali_deliver/screens/details_livraison.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/modelCard.dart';
import '../widgets/navbar.dart';

class Dashboard extends StatefulWidget {
  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  late int code;
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
                    onSubmitted: (String value) {
                      setState(() {
                        code = int.parse(value);
                        print(code);
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailsLivraison(
                                    idCommande: code,
                                  )),
                        );
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 45,
                ),
                RecipeCard(
                    title: 'Livraisons', thumbnailUrl: "images/livraison.jpg"),
                SizedBox(
                  height: 45,
                ),
                RecipeCard(
                  title: 'Commandes',
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
