import 'package:app_delivery_mobile/model/dish.dart';
import 'package:app_delivery_mobile/model/restaurant.dart';
import 'package:app_delivery_mobile/ui/_core/bag_provider.dart';
import 'package:app_delivery_mobile/ui/_core/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantScreen({ super.key, required this.restaurant });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: getAppBar(context: context, title: restaurant.name),
           body: SingleChildScrollView(
             child: Center(
               child: Column(
                spacing: 12,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Image.asset('assets/${restaurant.imagePath}', width: 150,),
                   Text("Mais pedidos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                   Column(
                     children: List.generate(restaurant.dishes.length, (index) {
                        Dish dish = restaurant.dishes[index];
                       return ListTile(
                        onTap: () {
                          // Aqui você pode adicionar a lógica para abrir a tela de detalhes do prato
                          //Ex. Navigator.push(context, MaterialPageRoute(builder: (context) => DishDetailScreen(dish: dish)));
                        },
                          leading: Image.asset('assets/${dish.imagePath}', width: 80,
                          height: 80,
                          ),
                          title: Text(dish.name),
                          subtitle: Text('R\$ ${dish.price.toStringAsFixed(2)}'),
                          trailing: IconButton(onPressed: (){
                            context.read<BagProvider>().addAllDishes([dish]);
                          }, icon: Icon(Icons.add_circle_outline),),
                       );
                     }),
                   ),
                   
                   Padding(
                     padding: const EdgeInsets.all(20.0),
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
           ),
       );
  }
}