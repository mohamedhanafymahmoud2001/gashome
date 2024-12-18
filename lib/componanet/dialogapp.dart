import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class DialogApp {
  ColorApp colorApp = new ColorApp();
  Future<void> checkdialog(BuildContext context, VoidCallback func,String title,bool type) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,

            scrollable: true,
            // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            // title: Text('Verify'),
            elevation: 10,
            content: Container(
                padding: EdgeInsets.only(top: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: Image.asset(type==true? "assets/images/seccess.png":"assets/images/error.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      child: Text(
                        val.languagebox.get("language") == "en"
                            ? "Confirm"
                            : "$title",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        height: 1,
                        color: Colors.grey.shade300,
                        thickness: 2,
                        endIndent: 70,
                        indent: 70,
                      ),
                    ),
                  ],
                )),
            actions: <Widget>[
              Center(
                  child: BottonApp(
                      width: 150,
                      title: "موافق",
                      color: colorApp.colorbgbuttonapp,
                      func: 
                        func
                      )),
            ],
          );
        });
      },
    );
  }
}
