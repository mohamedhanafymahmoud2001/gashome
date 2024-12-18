import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/view/account/prodectaccount.dart';
class Account extends StatelessWidget {   
  @override
  Widget build(BuildContext context) {
    ColorApp colorApp = new ColorApp();
    DialogApp dialogApp = new DialogApp();
    return Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: colorApp.colorborder, width: 1)),
                      child: ListTile(
                        title: Text("Mohamed"),
                        trailing: Icon(Icons.person_2_outlined),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: colorApp.colorborder, width: 1)),
                      child: ListTile(
                        title: Text("Hanafy"),
                        trailing: Icon(Icons.person_2_outlined),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: colorApp.colorborder, width: 1)),
                child: ListTile(
                  title: Text("+966553343343"),
                  trailing: Icon(Icons.phone_outlined),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "الطلبيات",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colorApp.colorFontblue),
                ),
              ),
              ProdectAccount(),
              //////////////
            ],
          ),
        ),
      );
  }
}
