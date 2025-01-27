import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/viewdriver/myorder/bodymyorders.dart';
import 'package:provider/provider.dart';

class MyOrders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyOrders();
  }
}

class _MyOrders extends State {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return  Consumer<Control>(builder: (context, val, child) {
        return Column(
          children: [
            
            Expanded(
                child:val.myOrders==null?Center(child: CircularProgressIndicator()): ListView.builder(
                    itemCount: val.myOrders['data'].length,
                    itemBuilder: (context, i) {
                      return BodyMyOrders(data: val.myOrders['data'][i],);
                    })),
          ],
        );
      });
  }
}
