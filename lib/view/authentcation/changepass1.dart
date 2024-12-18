import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/componanet/inputapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class ChangePass1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangePass1();
  }
}

class _ChangePass1 extends State<ChangePass1> {
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
                    "قم بإدخال رقم هاتفك",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblack),
                  ),
                  InputApp(
                      hint: "ادخل رقم الهاتف",
                      controler: val.api.phonechangepass,
                      icon: Icon(Icons.phone_outlined),
                      keyboard: TextInputType.phone),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  BottonApp(
                      width: 150,
                      title: "موافق",
                      color: colorApp.colorbgbuttonapp,
                      func: () {
                        //
                        if (formstate.currentState!.validate()) {
                          dialogApp.checkdialog(context, () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed("changepass2");
                          }, 'تم بنجاح', true);
                          print("validat");
                        } else {
                          print("not validat");
                        }
                        //
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
