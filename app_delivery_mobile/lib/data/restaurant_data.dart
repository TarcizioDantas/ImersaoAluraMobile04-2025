import 'dart:convert';
import 'package:app_delivery_mobile/model/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RestaurantData extends ChangeNotifier {
  List<Restaurant> listRestaurant = [];

  Future<void> getRestaurants() async{

    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> restaurantsData = data['restaurants'];

    for (var restaurantData in restaurantsData) {
      Restaurant restaurant = Restaurant.fromMap(restaurantData);
      listRestaurant.add(restaurant);
    }
  }
}