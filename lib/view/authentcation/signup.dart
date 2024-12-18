import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/componanet/inputapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  GlobalKey<FormState> formstate = GlobalKey();
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
                          hint: "الاسم الاول",
                          controler: val.api.firstNameSignUp,
                          icon: Icon(Icons.person_2_outlined),
                          keyboard: TextInputType.text)),
                  Expanded(
                      child: InputApp(
                          hint: "الاسم الثاني",
                          controler: val.api.lastNameSignUp,
                          icon: Icon(Icons.person_2_outlined),
                          keyboard: TextInputType.text)),
                ],
              ),
              InputApp(
                  hint: "ادخل رقم الهاتف",
                  controler: val.api.phoneSignUp,
                  icon: Icon(Icons.phone_outlined),
                  keyboard: TextInputType.phone),
              InputAppPass(
                  hint: "ادخل كلمة السري",
                  show: true,
                  controler: val.api.passSignUp,
                  icon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility_off_outlined)),
                  keyboard: TextInputType.visiblePassword),
              InputAppPass(
                  hint: "ناكيد كلمة المرور",
                  show: true,
                  controler: val.api.confirmPassSignUp,
                  icon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility_off_outlined)),
                  keyboard: TextInputType.visiblePassword),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              BottonApp(
                  width: 150,
                  title: "تسجيل الحساب",
                  color: colorApp.colorbgbuttonapp,
                  func: () {
                    if (formstate.currentState!.validate()) {
                      val.RegisterUser();
                      dialogApp.checkdialog(context, () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed("codeauthentcation");
                      }, "تم تسجيل الحساب بنجاح", true);
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
