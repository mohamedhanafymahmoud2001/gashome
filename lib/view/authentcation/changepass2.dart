import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/componanet/inputapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class ChangePass2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangePass2();
  }
}

class _ChangePass2 extends State<ChangePass2> {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  GlobalKey<FormState> formstate = GlobalKey();
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
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      textAlign: TextAlign.center,
                      "إعادة تعيين كلمة المرور",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorApp.colorFontblue),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "تم إرسال رقم تأكيد للحساب علي \n ${val.api.phonechangepass.text}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblack),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 70,
                    width: 220,
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          child: InputCode(
                              hint: "..",
                              controler: val.api.code1,
                              keyboard: TextInputType.number),
                        )),
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
                        )),
                        Expanded(
                            child: Container(
                          child: InputCode(
                              hint: "..",
                              controler: val.api.code4,
                              keyboard: TextInputType.number),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  BottonApp(
                      width: 150,
                      title: "موافق",
                      color: colorApp.colorbgbuttonapp,
                      func: () {
                        if (formstate.currentState!.validate()) {
                          dialogApp.checkdialog(context, () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed("changepass3");
                          }, 'تم بنجاح', true);
                          print("validat");
                        } else {
                          print("not validat");
                        }
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
