import 'package:app_delivery_mobile/data/categories_data.dart';
import 'package:app_delivery_mobile/ui/home/widgets/category_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           drawer: Drawer(),
           appBar: AppBar(
            elevation: 10,
            title: const Text('TELA INICIAL'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {
                  // Ação do botão de pesquisa
                },
              ),
            ],
            ),
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
                  SizedBox(height: 64.0),
                 ],
               ),
             ),
           ),
       );
  }
}