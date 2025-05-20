import 'package:app_delivery_mobile/data/categories_data.dart';
import 'package:app_delivery_mobile/data/restaurant_data.dart';
import 'package:app_delivery_mobile/model/restaurant.dart';
import 'package:app_delivery_mobile/ui/_core/widgets/appbar.dart';
import 'package:app_delivery_mobile/ui/home/widgets/category_widget.dart';
import 'package:app_delivery_mobile/ui/home/widgets/restaurant_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({ super.key });

   @override
   Widget build(BuildContext context) {
    RestaurantData restaurantData = Provider.of<RestaurantData>(context);
    //restaurantData.getRestaurants();
       return Scaffold(
           drawer: Drawer(),
           appBar: getAppBar(context: context),
           body: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 24.0),
             child: SingleChildScrollView(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 32,
                 children: [
                  Center(
                    child: Image.asset('assets/logo.png', width: 200),
                  ),
                  Text("Boas-vindas!"),
                  TextFormField(),
                  Text("Escolha por categoria"),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8,
                      children: List.generate(CategoriesData.listCategories.length, (index ,){
                      return CategoryWidget(category: CategoriesData.listCategories[index],);
                    }),),
                  ),
                  Image.asset('assets/banners/banner_promo.png'),
                  Text("Bem avaliados"),
                  Column(
                    spacing: 12,
                    children: List.generate(restaurantData.listRestaurant.length, (index){
                      Restaurant restaurant = restaurantData.listRestaurant[index];
                      return RestaurantWidget(restaurant: restaurant);
                    }),
                  ),
                  SizedBox(height: 1.0),
                 ],
               ),
             ),
           ),
       );
  }
}