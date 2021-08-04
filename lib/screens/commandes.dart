import 'package:dabali_deliver/model/restoOrderList.dart';
import 'package:dabali_deliver/widgets/container_total_food.dart';
import 'package:dabali_deliver/widgets/couleur.dart';
import 'package:dabali_deliver/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../widgets/modelContainer.dart';

class Commande extends StatefulWidget {
  @override
  CommandeState createState() => CommandeState();
}

class CommandeState extends State<Commande> {
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
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(
            "Commandes",
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
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                    child: categoriesScroller),
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
                                          true,
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
