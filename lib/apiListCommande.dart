import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// To parse this JSON data, do
//
//     final resto = restoFromJson(jsonString);
Future<Resto> fetchResto() async {
  final response = await http.get(
      Uri.parse('https://dabaliplato.000webhostapp.com/api/restoOrderList/9'));
  if (response.statusCode == 200) {
    return restoFromJson(response.body);
  } else {
    throw Exception('Failed to load album');
  }
}

Resto restoFromJson(String str) => Resto.fromJson(json.decode(str));
String restoToJson(Resto data) => json.encode(data.toJson());

class Resto {
  Resto({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory Resto.fromJson(Map<String, dynamic> json) => Resto(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
      };
}

class Datum {
  Datum({
    required this.id,
    required this.orderCode,
    required this.orderUserId,
    required this.orderFoodId,
    required this.orderQuantity,
    required this.orderPaymentMethod,
    required this.orderStatus,
    this.deliveredBy,
    // required this.updatedAt,
    // required this.createdAt,
  });

  int id;
  int orderCode;
  int orderUserId;
  int orderFoodId;
  int orderQuantity;
  String orderPaymentMethod;
  String orderStatus;
  dynamic deliveredBy;
  // DateTime updatedAt;
  // DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderCode: json["order_code"],
        orderUserId: json["order_user_id"],
        orderFoodId: json["order_food_id"],
        orderQuantity: json["order_quantity"],
        orderPaymentMethod: json["order_payment_method"],
        orderStatus: json["order_status"],
        deliveredBy: json["delivered_by"],
        // updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        // createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"])
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_code": orderCode,
        "order_user_id": orderUserId,
        "order_food_id": orderFoodId,
        "order_quantity": orderQuantity,
        "order_payment_method": orderPaymentMethod,
        "order_status": orderStatus,
        "delivered_by": deliveredBy,
        // "updated_at": updatedAt.toIso8601String(),
        // "created_at": createdAt.toIso8601String(),
      };
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Resto> futureResto;

  @override
  void initState() {
    super.initState();
    futureResto = fetchResto();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Commande'),
        ),
        body: Center(
          child: FutureBuilder<Resto>(
            future: futureResto,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // return Text(snapshot.data!.success.toString());
                return Center(
                  child: ListView.builder(
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(snapshot.data!.data[i].orderPaymentMethod),
                      );
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
