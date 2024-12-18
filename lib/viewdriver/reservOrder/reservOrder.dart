import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/viewdriver/reservOrder/bodyReservOrder.dart';
import 'package:provider/provider.dart';

class ReservOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ReservOrder();
  }
}

class _ReservOrder extends State {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  List area=["جدة","الرياض","مكة"];
  @override
  Widget build(BuildContext context) {
    return  Consumer<Control>(builder: (context, val, child) {
        return Column(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: area.length,
                  itemBuilder: (context, i) {
                    return BottonRservOrder(
                      title: "${area[i]}",
                      color: i == val.area
                          ? colorApp.colorbgbuttonapp
                          : colorApp.colorbgbutton1,
                      colorfont: i == val.area
                          ? colorApp.colorFontwhite
                          : colorApp.colorFontblack,
                      func: () {
                        val.changeAreaDriver(i);
                      },
                      active: i == val.area ? false : true,
                    );
                  }),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, i) {
                      return BodyReservOrder();
                    })),
          ],
        );});}
}
