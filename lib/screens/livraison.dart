// import 'package:dabali_deliver/widgets/couleur.dart';
// import 'package:dabali_deliver/widgets/navbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// import '../widgets/constantCommandes.dart';

// class Livraison extends StatefulWidget {
//   @override
//   LivraisonState createState() => LivraisonState();
// }

// class LivraisonState extends State<Livraison> {
//   final CategoriesScroller categoriesScroller = CategoriesScroller();
//   ScrollController controller = ScrollController();
//   bool closeTopContainer = false;
//   double topContainer = 0;

//   List<Widget> itemsData = [];

//   void getPostsData() {
//     List<dynamic> responseList = FOOD_DATA;
//     List<Widget> listItems = [];
//     responseList.forEach((post) {
//       listItems.add(Container(
//           height: 150,
//           margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20.0)),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
//               ]),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       post["name"],
//                       style: const TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       post["brand"],
//                       style: const TextStyle(fontSize: 17, color: Colors.grey),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       "${post["price"]}",
//                       style: const TextStyle(
//                           fontSize: 17,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     )
//                   ],
//                 ),
//                 Image.asset(
//                   (post["name"][0] == "T")
//                       ? "images/img_livraison_effectuer.jpg"
//                       : "images/img_livraison_annuler.jpeg",
//                   height: 35,
//                 )
//               ],
//             ),
//           )));
//     });
//     setState(() {
//       itemsData = listItems;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     getPostsData();
//     controller.addListener(() {
//       double value = controller.offset / 119;

//       setState(() {
//         topContainer = value;
//         closeTopContainer = controller.offset > 50;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     // final double categoryHeight = size.height * 0.30;
//     return SafeArea(
//       child: Scaffold(
//         drawer: NavBar(),
//         appBar: AppBar(
//           title: Text(
//             "Livraisons",
//             style: TextStyle(color: Colors.white),
//           ),
//           centerTitle: true,
//           backgroundColor: Color(0xFFD32F2F),
//         ),
//         body: Container(
//           height: size.height,
//           child: Column(
//             children: <Widget>[
//               const SizedBox(
//                 height: 10,
//               ),
//               Expanded(
//                   child: ListView.builder(
//                       controller: controller,
//                       itemCount: itemsData.length,
//                       physics: BouncingScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         double scale = 1.0;
//                         if (topContainer > 0.5) {
//                           scale = index + 0.5 - topContainer;
//                           if (scale < 0) {
//                             scale = 0;
//                           } else if (scale > 1) {
//                             scale = 1;
//                           }
//                         }
//                         return Opacity(
//                           opacity: scale,
//                           child: Transform(
//                             transform: Matrix4.identity()..scale(scale, scale),
//                             alignment: Alignment.bottomCenter,
//                             child: Align(
//                               heightFactor: 0.7,
//                               alignment: Alignment.topCenter,
//                               child: itemsData[index],
//                             ),
//                           ),
//                         );
//                       })),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CategoriesScroller extends StatelessWidget {
//   const CategoriesScroller();

//   @override
//   Widget build(BuildContext context) {
//     final double categoryHeight =
//         MediaQuery.of(context).size.height * 0.30 - 50;
//     return SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         child: FittedBox(
//           fit: BoxFit.fill,
//           alignment: Alignment.topCenter,
//           child: Row(
//             children: <Widget>[
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: categoryHeight,
//                 decoration: BoxDecoration(
//                     color: kTextColor,
//                     borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Tchêp poulet 10\nTchêp poisson 5\nFrittes poulet 2",
//                         style: TextStyle(
//                             fontSize: 17,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "17 Plats",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: categoryHeight,
//                 decoration: BoxDecoration(
//                     color: mainColor,
//                     borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                 child: Container(
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           "Porc Attiéké 2\nGarba Choco 6\nRiz Soupe 3",
//                           style: TextStyle(
//                               fontSize: 17,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Text(
//                           "11 Plats",
//                           style: TextStyle(fontSize: 16, color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: 150,
//                 margin: EdgeInsets.only(right: 20),
//                 height: categoryHeight,
//                 decoration: BoxDecoration(
//                     color: Colors.lightBlueAccent.shade400,
//                     borderRadius: BorderRadius.all(Radius.circular(20.0))),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         "Foutou Graine 3\nFoutou Arrachide 0",
//                         style: TextStyle(
//                             fontSize: 17,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         "3 Plats",
//                         style: TextStyle(fontSize: 16, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:dabali_deliver/model/restoOrderList.dart';
import 'package:dabali_deliver/widgets/container_total_food.dart';
import 'package:dabali_deliver/widgets/couleur.dart';
import 'package:dabali_deliver/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../widgets/modelContainer.dart';

class Livraison extends StatefulWidget {
  @override
  LivraisonState createState() => LivraisonState();
}

class LivraisonState extends State<Livraison> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  late Future<RestoOrderList> futureResto;

  @override
  void initState() {
    super.initState();
    futureResto = restoOrder();
    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            "Livraison",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFFD32F2F),
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder<RestoOrderList>(
                  future: futureResto,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Center(
                        child: ListView.builder(
                            controller: controller,
                            itemCount: snapshot.data!.data.length,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              double scale = 1.0;
                              if (topContainer > 0.5) {
                                scale = index + 0.5 - topContainer;
                                if (scale < 0) {
                                  scale = 0;
                                } else if (scale > 1) {
                                  scale = 1;
                                }
                              }
                              return Column(
                                children: [
                                  Opacity(
                                    opacity: scale,
                                    child: Transform(
                                      transform: Matrix4.identity()
                                        ..scale(scale, scale),
                                      alignment: Alignment.bottomCenter,
                                      child: Align(
                                        heightFactor: 0.7,
                                        alignment: Alignment.topCenter,
                                        // child: itemsData[index],
                                        child: modelContainer(
                                          snapshot.data!.data[index].foodName,
                                          snapshot
                                              .data!.data[index].userAddress,
                                          snapshot
                                              .data!.data[index].orderQuantity
                                              .toString(),
                                          false,
                                          "",
                                          snapshot
                                              .data!.data[index].orderStatus,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return SpinKitRing(
                      color: mainColor,
                      duration: Duration(seconds: 1),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
