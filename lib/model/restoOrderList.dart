import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<RestoOrderList> restoOrder() async {
  final response = await http.get(
      Uri.parse('https://dabaliplato.000webhostapp.com/api/restoOrderList/9'));
  if (response.statusCode == 200) {
    return restoFromJson(response.body);
  } else {
    throw Exception('Echec de chargement des données');
  }
}

RestoOrderList restoFromJson(String str) =>
    RestoOrderList.fromJson(json.decode(str));

String restoToJson(RestoOrderList data) => json.encode(data.toJson());

class RestoOrderList {
  RestoOrderList({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory RestoOrderList.fromJson(Map<String, dynamic> json) => RestoOrderList(
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
    required this.orderQuantity,
    required this.orderPaymentMethod,
    required this.orderStatus,
    this.deliveredBy,
    required this.id,
    required this.foodName,
    required this.foodRestoId,
    required this.foodPrice,
    required this.foodDescription,
    required this.updatedAt,
    required this.createdAt,
    required this.userAddress,
    required this.userLastname,
    required this.userFirstname,
    required this.userContact,
    required this.foodImage,
  });

  int orderQuantity;
  String orderPaymentMethod;
  String orderStatus;
  dynamic deliveredBy;
  int id;
  String foodName;
  int foodRestoId;
  int foodPrice;
  String foodDescription;
  DateTime updatedAt;
  DateTime createdAt;
  String userAddress;
  String userLastname;
  String userFirstname;
  String userContact;
  String foodImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderQuantity: json["order_quantity"],
        orderPaymentMethod: json["order_payment_method"],
        orderStatus: json["order_status"],
        deliveredBy: json["delivered_by"],
        id: json["id"],
        foodName: json["food_name"],
        foodRestoId: json["food_resto_id"],
        foodPrice: json["food_price"],
        foodDescription: json["food_description"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        userAddress: json["user_address"],
        userLastname: json["user_lastname"],
        userFirstname: json["user_firstname"],
        userContact: json["user_contact"],
        foodImage: json["food_image"],
      );

  Map<String, dynamic> toJson() => {
        "order_quantity": orderQuantity,
        "order_payment_method": orderPaymentMethod,
        "order_status": orderStatus,
        "delivered_by": deliveredBy,
        "id": id,
        "food_name": foodName,
        "food_resto_id": foodRestoId,
        "food_price": foodPrice,
        "food_description": foodDescription,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "user_address": userAddress,
        "user_lastname": userLastname,
        "user_firstname": userFirstname,
        "user_contact": userContact,
        "food_image": foodImage,
      };
}
