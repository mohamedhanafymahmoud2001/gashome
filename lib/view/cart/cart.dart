import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/cart/prodectcart.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return  Consumer<Control>(builder: (context, val, child) {
        return ListView.builder(
            itemCount: 2,
            itemBuilder: (context, i) {
              return ProdectCart();
            });
      });
      
    
  }
}
