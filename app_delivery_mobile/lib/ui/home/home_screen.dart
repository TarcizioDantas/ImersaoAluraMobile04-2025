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
             child: Column(
               children: [
                Center(
                  child: Image.asset('assets/logo.png', width: 147),
                ),
                Text("Boas-vindas!"),
                TextFormField(),
                Text("Escolha por categoria"),
                Image.asset('assets/banners/banner_promo.png'),
               ],
             ),
           ),
       );
  }
}