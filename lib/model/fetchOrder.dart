import 'dart:convert';
import 'package:http/http.dart' as http;

//https://dabaliplato.000webhostapp.com/api/fetchOrder/849494
Future<FetchOrder> fetchOrder(int idcommande) async {
  final response = await http.get(Uri.parse(
      'https://dabaliplato.000webhostapp.com/api/fetchOrder/$idcommande'));
  print("https://dabaliplato.000webhostapp.com/api/fetchOrder/$idcommande");
  if (response.statusCode == 200) {
    return fetchOrderFromJson(response.body);
  } else {
    print("Aucune commande ne correspond à ce code");
    throw Exception('Echec de chargement des données');
  }
  // if (response.statusCode == 200) {
  //   return fetchOrderFromJson(response.body);
  // } else if (response.statusCode == 404) {
  //   print("Aucune commande ne correspond à ce code");
  // } else {
  //   throw Exception('Echec de chargement des données');
  // }
}

FetchOrder fetchOrderFromJson(String str) =>
    FetchOrder.fromJson(json.decode(str));

class FetchOrder {
  FetchOrder({
    required this.success,
    required this.data,
    required this.message,
  });

  bool success;
  List<Datum> data;
  String message;

  factory FetchOrder.fromJson(Map<String, dynamic> json) => FetchOrder(
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
    required this.deliveredBy,
    required this.updatedAt,
    required this.createdAt,
    required this.foodName,
    required this.foodRestoId,
    required this.foodPrice,
    required this.foodDescription,
    required this.userAddress,
    required this.userLastname,
    required this.userFirstname,
    required this.foodImage,
  });

  int id;
  int orderCode;
  int orderUserId;
  int orderFoodId;
  int orderQuantity;
  String orderPaymentMethod;
  String orderStatus;
  int deliveredBy;
  DateTime updatedAt;
  DateTime createdAt;
  String foodName;
  int foodRestoId;
  int foodPrice;
  String foodDescription;
  String userAddress;
  String userLastname;
  String userFirstname;
  String foodImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderCode: json["order_code"],
        orderUserId: json["order_user_id"],
        orderFoodId: json["order_food_id"],
        orderQuantity: json["order_quantity"],
        orderPaymentMethod: json["order_payment_method"],
        orderStatus: json["order_status"],
        deliveredBy: json["delivered_by"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        foodName: json["food_name"],
        foodRestoId: json["food_resto_id"],
        foodPrice: json["food_price"],
        foodDescription: json["food_description"],
        userAddress: json["user_address"],
        userLastname: json["user_lastname"],
        userFirstname: json["user_firstname"],
        foodImage: json["food_image"],
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
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "food_name": foodName,
        "food_resto_id": foodRestoId,
        "food_price": foodPrice,
        "food_description": foodDescription,
        "user_address": userAddress,
        "user_lastname": userLastname,
        "user_firstname": userFirstname,
        "food_image": foodImage,
      };
}
