import 'package:flutter/material.dart';
import 'package:dabali_deliver/model/fetchOrder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../widgets/couleur.dart';
import '../widgets/navbar.dart';

// ignore: must_be_immutable
class DetailsLivraison extends StatefulWidget {
  int idCommande;
  DetailsLivraison({required this.idCommande});
  @override
  DetailsLivraisonState createState() =>
      DetailsLivraisonState(id: this.idCommande);
}

class DetailsLivraisonState extends State<DetailsLivraison> {
  int id;
  late Future<FetchOrder> futurfetchorder;
  DetailsLivraisonState({required this.id});
  @override
  void initState() {
    super.initState();
    futurfetchorder = fetchOrder(id);
  }

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
      body: FutureBuilder<FetchOrder>(
        future: futurfetchorder,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.data.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 50.0),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(snapshot.data!.data[index].foodName,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                                color: mainColor)),
                      ),
                      SizedBox(height: 30.0),
                      Hero(
                          tag: "poulet",
                          child: Image.asset("images/fritte_poulet.jpg",
                              height: 200.0,
                              width: 200.0,
                              fit: BoxFit.contain)),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                                "Prix: ${snapshot.data!.data[index].foodPrice} Fcfa ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          Center(
                            child: Text(
                                " Quantité: ${snapshot.data!.data[index].orderQuantity} ",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Text(
                            "Net à payer: ${(snapshot.data!.data[index].orderQuantity * snapshot.data!.data[index].foodPrice).toString()} Frcfa",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Text(
                          "Infos client",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 50.0,
                          child: Text(
                              "Nom: ${snapshot.data!.data[index].userFirstname} ${snapshot.data!.data[index].userLastname}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 50.0,
                          child: Text(
                              'Adresse: ${snapshot.data!.data[index].userAddress}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ],
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return SpinKitRing(
            color: mainColor,
            duration: Duration(seconds: 1),
          );
        },
      ),
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
