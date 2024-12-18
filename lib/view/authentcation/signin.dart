import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/componanet/inputapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/home/home.dart';
import 'package:gazhome/view/mainAppUser.dart';
import 'package:gazhome/viewdriver/mainappdriver.dart';
import 'package:gazhome/viewdriver/reservOrder/reservOrder.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
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
                height: MediaQuery.of(context).size.height / 6,
              ),
              InputApp(
                  hint: "ادخل رقم الهاتف",
                  controler: val.api.phoneSignin,
                  icon: Icon(Icons.phone_outlined),
                  keyboard: TextInputType.phone),
              InputAppPass(
                  hint: "ادخل الرقم السري",
                  show: true,
                  controler: val.api.passSignin,
                  icon: Icon(Icons.visibility_off_outlined),
                  keyboard: TextInputType.visiblePassword),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("changepass1");
                  },
                  child: Text(
                    "هل نسيت كلمة المرور؟",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 6,
              ),
              BottonApp(
                        width: 150,
                  title: "تسجيل الدخول",
                  color: colorApp.colorbgbuttonapp,
                  func: () {
                    if (formstate.currentState!.validate()) {
                        val.LoginUser();
                        dialogApp.checkdialog(context, () {
                      print("home");
                      //user
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MainAppUser()),
                        (Route<dynamic> route) => false,
                      );
                      
                      //driver 
                      // Navigator.of(context).pushAndRemoveUntil(
                      //   MaterialPageRoute(builder: (context) => MainAppDriver()),
                      //   (Route<dynamic> route) => false,
                      // );
                    }, 'تم بنجاح', true);
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
