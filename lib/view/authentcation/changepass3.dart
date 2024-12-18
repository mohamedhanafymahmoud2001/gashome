import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/componanet/inputapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/onboarding/langoage.dart';
import 'package:provider/provider.dart';

class ChangePass3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ChangePass3();
  }
}

class _ChangePass3 extends State<ChangePass3> {
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
                    height: MediaQuery.of(context).size.height / 8,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "قم بإدخال كلمة المرور الجديدة",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblack),
                  ),
                  InputAppPass(
                      hint: "أدخل كلمة المرور",
                      show: true,
                      controler: val.api.newpass,
                      icon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility_off_outlined)),
                      keyboard: TextInputType.visiblePassword),
                  InputAppPass(
                      hint: "تأكيد كلمة المرور",
                      show: true,
                      controler: val.api.confirmnewpass,
                      icon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.visibility_off_outlined)),
                      keyboard: TextInputType.visiblePassword),
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
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => Langoage()),
                              (Route<dynamic> route) => false,
                            );
                            Navigator.of(context).pushNamed("authentcation");
                          }, 'تم بنجاح', true);
                          print("validat");
                        } else {
                          print("not validat");
                        }
                      }),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
