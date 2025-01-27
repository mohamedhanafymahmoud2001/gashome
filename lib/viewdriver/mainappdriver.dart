import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/account/acount.dart';
import 'package:gazhome/view/suport/suport.dart';
import 'package:gazhome/viewdriver/account/account.dart';
import 'package:gazhome/viewdriver/myorder/myorder.dart';
import 'package:gazhome/viewdriver/reservOrder/bodyReservOrder.dart';
import 'package:gazhome/viewdriver/reservOrder/reservOrder.dart';
import 'package:gazhome/viewdriver/supportdriver/supportdriver.dart';
import 'package:provider/provider.dart';

class MainAppDriver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainAppDriver();
  }
}

class _MainAppDriver extends State<MainAppDriver> {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Control>(context, listen: false).AllRegions();
    });
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Scaffold(
        appBar: AppBar(
          title: AppBarAppDriver(),
          backgroundColor: colorApp.colorbody,
        ),
        backgroundColor: colorApp.colorbody,
        body: val.ScreenDriver == 3
            ? ReservOrder()
            : val.ScreenDriver == 2
                ? MyOrders()
                : val.ScreenDriver == 1
                    ? AccountDriver()
                    : SupportDriver(),
        bottomNavigationBar: BottomNavigationBarAppDriver(),
      );
    });
  }
}
