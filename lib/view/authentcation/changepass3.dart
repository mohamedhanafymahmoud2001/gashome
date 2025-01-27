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
                    height: MediaQuery.of(context).size.height / 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      textAlign: TextAlign.center,
                      "${langLocal.langLocal['reset']['${val.languagebox.get("language")}']}",
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
                    "${langLocal.langLocal['pass']['${val.languagebox.get("language")}']}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblack),
                  ),
                  InputAppPass(
                      hint: "${langLocal.langLocal['pass']['${val.languagebox.get("language")}']}",
                      show: val.passshow2,
                      controler: val.api.newpass,
                      icon: IconButton(
                          onPressed: () {
                            val.PassShow2();
                          },
                          icon: Icon(val.passshow2==true?Icons.visibility_off_outlined:Icons.visibility)),
                      keyboard: TextInputType.visiblePassword),
                  InputAppPass(
                      hint: "${langLocal.langLocal['cpass']['${val.languagebox.get("language")}']}",
                      show: val.passshow1,
                      controler: val.api.confirmnewpass,
                      icon: IconButton(
                          onPressed: () {
                            val.PassShow1();
                          },
                          icon: Icon(val.passshow1==true?Icons.visibility_off_outlined:Icons.visibility)),
                      keyboard: TextInputType.visiblePassword),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                  BottonApp(
                      width: 150,
                      title: "${langLocal.langLocal['ok']['${val.languagebox.get("language")}']}",
                      color: colorApp.colorbgbuttonapp,
                      func: () {
                        if (formstate.currentState!.validate()) {
                          val.changePass3();
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
