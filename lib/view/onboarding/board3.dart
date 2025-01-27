import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class Board3 extends StatelessWidget {
  ColorApp colorsApp = new ColorApp();
  LangLocal langLocal=new LangLocal();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/images/board3.png"),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  textAlign: TextAlign.center,
                  "${langLocal.langLocal['Redy']['${val.languagebox.get("language")}']}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400,color: colorsApp.colorfontboard),
                ),
              ),
              SizedBox(height: 60,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  textAlign: TextAlign.center,
                  
                  "${langLocal.langLocal['DBoard3']['${val.languagebox.get("language")}']}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: colorsApp.colorgreyapp),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
