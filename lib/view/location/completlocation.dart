import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/componanet/inputapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class CompletLocation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CompletLocation();
  }
}

class _CompletLocation extends State<CompletLocation> {
  @override
  Widget build(BuildContext context) {
    ColorApp colorApp = new ColorApp();
    DialogApp dialogApp = new DialogApp();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppBarBack(),
        backgroundColor: colorApp.colorbody,
      ),
      backgroundColor: colorApp.colorbody,
      body: Consumer<Control>(builder: (context, val, child) {
        return Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "إكمال بيانات موقعك",
                  style: TextStyle(
                      color: colorApp.colorFontblack,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              InputApp(
                  hint: "المدينة",
                  controler: val.api.city,
                  icon: Icon(Icons.location_city),
                  keyboard: TextInputType.text),
              InputApp(
                  hint: "الحي / المنطقة",
                  controler: val.api.neighbor,
                  icon: Icon(Icons.area_chart),
                  keyboard: TextInputType.text),
              InputApp(
                  hint: "الشارع",
                  controler: val.api.street,
                  icon: Icon(Icons.streetview),
                  keyboard: TextInputType.text),
              InputApp(
                  hint: "رقم المبني",
                  controler: val.api.numberBuild,
                  icon: Icon(Icons.build),
                  keyboard: TextInputType.text),
              Expanded(child: Container()),
              BottonApp(
                      width: 150,
                  title: "موافق",
                  color: colorApp.colorbgbutton2,
                  func: () {
                    Navigator.of(context).pushNamed("detailsorder");
                  })
            ],
          ),
        );
      }),
    );
  }
}
