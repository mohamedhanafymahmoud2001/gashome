import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/componanet/inputapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  GlobalKey<FormState> formstate = GlobalKey();
  LangLocal langLocal=new LangLocal();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        // width: double.infinity,
        child: Form(
          key: formstate,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: InputApp(
                          hint: "${langLocal.langLocal['fname']['${val.languagebox.get("language")}']}",
                          controler: val.api.firstNameSignUp,
                          icon: Icon(Icons.person_2_outlined),
                          keyboard: TextInputType.text)),
                  Expanded(
                      child: InputApp(
                          hint:"${langLocal.langLocal['sname']['${val.languagebox.get("language")}']}",
                          controler: val.api.lastNameSignUp,
                          icon: Icon(Icons.person_2_outlined),
                          keyboard: TextInputType.text)),
                ],
              ),
              InputApp(
                  hint: "${langLocal.langLocal['phone']['${val.languagebox.get("language")}']}",
                  controler: val.api.phoneSignUp,
                  icon: Icon(Icons.phone_outlined),
                  keyboard: TextInputType.phone),
              InputAppPass(
                  hint: "${langLocal.langLocal['pass']['${val.languagebox.get("language")}']}",
                  show: val.passshow1,
                  controler: val.api.passSignUp,
                  icon: IconButton(
                      onPressed: () {
                        val.PassShow1();
                      },
                      icon: Icon(val.passshow1==true? Icons.visibility_off_outlined:Icons.visibility)),
                  keyboard: TextInputType.visiblePassword),
              InputAppPass(
                  hint: "${langLocal.langLocal['pass']['${val.languagebox.get("language")}']}",
                  show: val.passshow2,
                  controler: val.api.confirmPassSignUp,
                  icon: IconButton(
                      onPressed: () {
                        val.PassShow2();
                      },
                      icon: Icon(val.passshow2==true? Icons.visibility_off_outlined:Icons.visibility)),
                  keyboard: TextInputType.visiblePassword),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              BottonApp(
                  width: 150,
                  title: "${langLocal.langLocal['Sign Up']['${val.languagebox.get("language")}']}",
                  color: colorApp.colorbgbuttonapp,
                  func: () {
                    if (formstate.currentState!.validate()) {
                      val.RegisterUser();
                      dialogApp.checkdialog(context, () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed("codeauthentcation");
                      },);//
                      print("validat");
                    } else {
                      print("not validat");
                    }
                  })
            ],
          ),
        ),
      );
    });
  }
}
