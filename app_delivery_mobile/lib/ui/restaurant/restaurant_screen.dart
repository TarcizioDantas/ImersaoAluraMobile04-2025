import 'package:app_delivery_mobile/model/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({ super.key, required this.restaurant });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: Text(restaurant.name),),
           body: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Image.asset('assets/${restaurant.imagePath}', width: 150,),
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Text(restaurant.description),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: Text('Avaliações', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                 ),
                 // Aqui você pode adicionar uma lista de avaliações
               ],
             ),
           ),
       );
  }
}