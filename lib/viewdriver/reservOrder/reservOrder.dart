import 'package:flutter/material.dart';
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
  List area = ["جدة", "الرياض", "مكة"];
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return val.allRegions == null || val.regionsOrders == null
          ? Center(child: CircularProgressIndicator())
          : val.allRegions['message'] != "Regions fetched successfully"
              ? Center(
                      child: Image.asset("assets/images/nodata.png"),
                    )
              : Column(
                  children: [
                    Container(
                      height: 70,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: val.allRegions['data'].length,
                          itemBuilder: (context, i) {
                            return BottonRservOrder(
                              title: "${val.allRegions['data'][i]['name']}",
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
                            itemCount: val.regionsOrders['data'].length,
                            itemBuilder: (context, i) {
                              return BodyReservOrder(data:val.regionsOrders['data'][i]);
                            })),
                  ],
                );
    });
  }
}
