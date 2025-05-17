import 'package:app_delivery_mobile/model/restaurant.dart';
import 'package:app_delivery_mobile/ui/_core/app_colors.dart';
import 'package:app_delivery_mobile/ui/restaurant/restaurant_screen.dart';
import 'package:flutter/material.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantWidget({ super.key, required this.restaurant });

   @override
   Widget build(BuildContext context) {
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
         child: InkWell(
          onTap: () {
            Navigator.push(context,
              MaterialPageRoute(
                builder: (context) => RestaurantScreen(restaurant: restaurant),
              ),
            );
          },
           child: Row(
            spacing: 16,
            children: [Image.asset('assets/${restaurant.imagePath}',
            width: 72, 
            height: 72,
            ), 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text(restaurant.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),), 
                Row(children: List.generate(restaurant.stars.toInt(), (index){
                return Image.asset('assets/others/star.png', width: 16,);
              }),
            ),
            Text('${restaurant.distance}km'),
            ],
            ),
           ],
                 ),
         ),
       );
  }
}