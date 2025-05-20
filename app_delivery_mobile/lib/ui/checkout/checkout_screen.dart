import 'package:app_delivery_mobile/model/dish.dart';
import 'package:app_delivery_mobile/ui/_core/app_colors.dart';
import 'package:app_delivery_mobile/ui/_core/bag_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {

  const CheckoutScreen({ super.key });

   @override
   Widget build(BuildContext context) {
    BagProvider bagProvider = Provider.of<BagProvider>(context);
       return Scaffold(
        appBar: AppBar(
          title: Text("Sacola"), 
          actions: [
            TextButton(onPressed: (){
              bagProvider.clearBag();
              Navigator.pop(context);
            }, 
              child: Text("Limpar", style: TextStyle(color: AppColors.mainColor),),
            ),
          ],
          centerTitle: true,
        ),
           body: SingleChildScrollView(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.stretch,
               children: [
                 Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightBackgroundColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                   child: Column(
                     children: [
                       Padding(
                         padding: const EdgeInsets.all(16.0),
                         child: Text('Total do seu pedido: R\$ ${bagProvider.dishesOnBag.fold(0, (previousValue, element) => previousValue + element.price).toStringAsFixed(2)}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.mainColor),),
                       ),
                       Text("Pedidos", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                     ],
                   ),
                 ),
                 
                 //LISTA DE PEDIDOS
                 Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Column(
                     spacing: 8,
                     children: 
                     List.generate(bagProvider.getMapByAmount().keys.length, 
                     (index){
                       Dish dish = bagProvider.getMapByAmount().keys.toList()[index];
                              
                      return Container(
                         decoration: BoxDecoration(
                           color: AppColors.lightBackgroundColor,
                           borderRadius: BorderRadius.circular(10),
                           boxShadow: const [
                             BoxShadow(
                               color: Colors.black12,
                               blurRadius: 5,
                               offset: Offset(0, 2),
                             ),
                           ],
                         ),
                        child: ListTile(
                           leading: Image.asset('assets/${dish.imagePath}', width: 48,
                           height: 48,
                           ),
                           title: Text(dish.name),
                           subtitle: Text('R\$ ${dish.price.toStringAsFixed(2)}'),
                           trailing: Row(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               IconButton(onPressed: (){
                                 bagProvider.removeDish(dish);
                               }, icon: Icon(Icons.remove_circle_outline, color: AppColors.mainColor,)),
                               Text(bagProvider.getMapByAmount()[dish].toString(), style: TextStyle(fontSize: 18, color: AppColors.mainColor),),
                               IconButton(onPressed: (){
                                 bagProvider.addAllDishes([dish]);
                               }, icon: Icon(Icons.add_circle_outline, color: AppColors.mainColor,)),
                             ],
                           ),
                         ),
                      );
                              
                     },
                     ),
                   ),
                   
                 ),
                 SizedBox(height: 50,),
               ],
             ),
           ),
           bottomSheet: Container(
             height: 50,
             color: AppColors.lightBackgroundColor,
             child: Center(
               child: ElevatedButton(
                      onPressed: () {
                        // Aqui você pode adicionar a lógica para finalizar o pedido
                        // Ex. Navigator.push(context, MaterialPageRoute(builder: (context) => OrderConfirmationScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.mainColor,
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      child: Text("Finalizar Pedido"),
                    ), 
               
               ),
           ),
);
  }
}