import 'package:app_delivery_mobile/ui/_core/bag_provider.dart';
import 'package:app_delivery_mobile/ui/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

AppBar getAppBar({
  required BuildContext context, String? title,}){
    BagProvider bagProvider = Provider.of<BagProvider>(context);
    return AppBar(
      title: title != null ? Text(title) : null,
      centerTitle: true,
      actions: [
        badges.Badge(
          showBadge: bagProvider.dishesOnBag.isNotEmpty,
          position: badges.BadgePosition.topEnd(top: 0, end: 3),
          badgeContent: Text(bagProvider.dishesOnBag.length.toString(), style: TextStyle(color: Colors.white),),
          child: IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen()));
            },
          ),
        )],
    );
    //return AppBar(title: title != null ? Text(title) : null, centerTitle: true,);
}