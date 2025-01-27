import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/componanet/inputapp.dart';
import 'package:gazhome/provider/langlocal.dart';
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
  LangLocal langLocal=new LangLocal();
  GlobalKey<FormState> formstate = GlobalKey();
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
          child: Form( 
            key: formstate,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    alignment: Alignment.center,
                    child: Text(
                      "${langLocal.langLocal['lang31']['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          color: colorApp.colorFontblack,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("${langLocal.langLocal['lang32']['${val.languagebox.get("language")}']}",style: TextStyle(fontWeight: FontWeight.bold),),),
                  InputApp(
                      hint: "${val.placemarks[0].administrativeArea}",
                      controler: val.api.city,
                      icon: Icon(Icons.location_city),
                      keyboard: TextInputType.text),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("${langLocal.langLocal['lang33']['${val.languagebox.get("language")}']}",style: TextStyle(fontWeight: FontWeight.bold),),),
                  
                  InputApp(
                      hint: "${val.placemarks[0].subAdministrativeArea}",
                      controler: val.api.neighbor,
                      icon: Icon(Icons.area_chart),
                      keyboard: TextInputType.text),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("${langLocal.langLocal['lang34']['${val.languagebox.get("language")}']}",style: TextStyle(fontWeight: FontWeight.bold),),),
                  InputApp(
                      hint: "${langLocal.langLocal['lang34']['${val.languagebox.get("language")}']}",
                      controler: val.api.street,
                      icon: Icon(Icons.streetview),
                      keyboard: TextInputType.text),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text("${langLocal.langLocal['lang35']['${val.languagebox.get("language")}']}",style: TextStyle(fontWeight: FontWeight.bold),),),
                  InputApp(
                      hint: "${langLocal.langLocal['lang35']['${val.languagebox.get("language")}']}",
                      controler: val.api.numberBuild,
                      icon: Icon(Icons.build),
                      keyboard: TextInputType.text),
                  // Expanded(child: Container()),
                  Container(
                    alignment: Alignment.center, 
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: BottonApp(
                            width: 150,
                        title: "${langLocal.langLocal['ok']['${val.languagebox.get("language")}']}",
                        color: colorApp.colorbgbutton2,
                        func: () {
                          if (formstate.currentState!.validate()) {
                            val.addLocation();
                            
                            // // Navigator.of(context).pop();
                            // // Navigator.of(context).pop();
                            dialogApp.checkdialog(context, (){
                              Navigator.of(context).pop();
                              //Navigator.of(context).popUntil((route) => route.settings.name == 'mainappuser');
                            });
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
