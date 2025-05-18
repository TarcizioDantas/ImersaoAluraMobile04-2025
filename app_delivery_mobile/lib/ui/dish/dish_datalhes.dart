import 'package:app_delivery_mobile/model/dish.dart';
import 'package:app_delivery_mobile/model/restaurant.dart';
import 'package:app_delivery_mobile/ui/_core/app_colors.dart';
import 'package:app_delivery_mobile/ui/_core/bag_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DishDatalhes extends StatelessWidget {
  final Restaurant restaurant;
  final Dish dish;
  const DishDatalhes({ super.key, required this.restaurant, required this.dish });

   @override
   Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
       return Scaffold(
           appBar: AppBar(title: Text(restaurant.name),),
           body: Padding(
             padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
             child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
               children: [
                 Container(
                   width: double.infinity,
                   height: 200,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12),
                     image: DecorationImage(
                       image: AssetImage('assets/${dish.imagePath}'),
                       fit: BoxFit.fill,
                     ),
                   ),),
                  //child: Image.asset('assets/${dish.imagePath}', width: 150,)),
                 Text(dish.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                 Text('R\$ ${dish.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 20),),
                 Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Text(dish.description, style: TextStyle(fontSize: 16),),
                 ),
                 Center(
                   child: Row(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                 IconButton(onPressed: (){
                                   bagProvider.removeDish(dish);
                                 }, icon: Icon(Icons.remove_circle_outline, color: AppColors.mainColor,)),
                                 Text(
                                   bagProvider.getMapByAmount()[dish] != null ? bagProvider.getMapByAmount()[dish].toString() : "0",
                                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.mainColor),
                                 ),
                                 IconButton(onPressed: (){
                                   bagProvider.addAllDishes([dish]);
                                 }, icon: Icon(Icons.add_circle_outline, color: AppColors.mainColor,)),
                               ],
                             ),
                 ),
               ],
             ),
           ),
       );
  }
}