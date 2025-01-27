import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/componanet/inputapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/onboarding/langoage.dart';
import 'package:provider/provider.dart';

class CodeAuthentication extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CodeAuthentication();
  }
}

class _CodeAuthentication extends State<CodeAuthentication> {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  GlobalKey<FormState> formstate = GlobalKey();
  LangLocal langLocal=new LangLocal();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppBarBack(),
        backgroundColor: colorApp.colorbody,
      ),
      backgroundColor: colorApp.colorbody,
      body: Consumer<Control>(builder: (context, val, child) {
        return Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              key: formstate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "${langLocal.langLocal['completeaccount']['${val.languagebox.get("language")}']}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblack),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      textAlign: TextAlign.center,
                      "${langLocal.langLocal['completeaccountenternumper']['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorApp.colorFontblue),
                    ),
                  ),
                  Container(
                    height: 70,
                    width: 220,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: InputCode(
                              hint: "..",
                              controler: val.api.code1,
                              keyboard: TextInputType.number),),
                        ),
                        Expanded(
                            child: Container(
                          child: InputCode(
                              hint: "..",
                              controler: val.api.code2,
                              keyboard: TextInputType.number),
                        )),
                        Expanded(
                            child: Container(
                          child: InputCode(
                              hint: "..",
                              controler: val.api.code3,
                              keyboard: TextInputType.number),
                        ),),
                        Expanded(
                            child: Container(
                          child: InputCode(
                              hint: "..",
                              controler: val.api.code4,
                              keyboard: TextInputType.number),
                        ) 
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  BottonApp(
                      width: 150,
                      title:"${langLocal.langLocal['ok']['${val.languagebox.get("language")}']}",
                      color: colorApp.colorbgbuttonapp,
                      func: () {
                        if (formstate.currentState!.validate()) {
                          val.switchAuthentcation("signin");
                          val.CodeEmailUser();
                          dialogApp.checkdialog(context, () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => Langoage()),
                              (Route<dynamic> route) => false,
                            );
                            Navigator.of(context).pushNamed("authentcation");
                          },);
                          print("validat");
                        } else {
                          print("not validat");
                        }
                        ///
                      })
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
