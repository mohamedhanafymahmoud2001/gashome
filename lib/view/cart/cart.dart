import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/cart/prodectcart.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  LangLocal langLocal =new LangLocal();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return val.cartUser == null || val.address == null
          ? Center(child: CircularProgressIndicator())
          : val.cartUser['message'] != "Cart Items" ||
                  val.address['message'] != "All Addresses"
              ? Center(
                      child: Image.asset("assets/images/nodata.png"),
                    )
              : Column(
                  children: [
                    Container(
                      width: double.infinity, 
                      margin: EdgeInsets.all(5), 
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), 
                        border: Border.all(width: 0.5)
                      ),
                      child: Row(
                        children: [
                          Text(val.selectAddress =="" ?"${langLocal.langLocal['lang37']['${val.languagebox.get("language")}']}":val.selectAddress),
                          Expanded(child: SizedBox()),
                          IconButton(onPressed: (){
                            dialogApp.addAddress(context);
                          }, icon: Icon(Icons.keyboard_arrow_down))
                        ],
                      ),
                    ),
                    
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                            itemCount: val.cartUser['data'].length - 1,
                            itemBuilder: (context, i) {
                              return ProdectCart(
                                  data: val.cartUser['data'][i], i: i);
                            }),
                      ),
                    ),
                  ],
                );
    });
  }
}
