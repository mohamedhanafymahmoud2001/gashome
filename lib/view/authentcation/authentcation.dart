import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/inputapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/authentcation/signin.dart';
import 'package:gazhome/view/authentcation/signup.dart';
import 'package:provider/provider.dart';

class Authentcation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Authentcation();
  }
}

class _Authentcation extends State<Authentcation> {
  ColorApp colorApp = new ColorApp();
  LangLocal langLocal=new LangLocal();
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Control>(context, listen: false).GetTokenDevice();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorApp.colorbody,
        title: AppBarBack(),
      ),
      backgroundColor: colorApp.colorbody,
      body: Consumer<Control>(builder: (context, val, child) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BottonAuthentcation(
                          title: "${langLocal.langLocal['Sign Up']['${val.languagebox.get("language")}']}",
                          color: val.authentication == "signup"
                              ? colorApp.colorbgbutton2
                              : colorApp.colorbgbutton1,
                          colorfont: val.authentication == "signup"
                              ? colorApp.colorFontwhite
                              : colorApp.colorFontblack,
                          func: () {
                            val.switchAuthentcation("signup");
                          }),
                      BottonAuthentcation(
                          title:  "${langLocal.langLocal['Sign In']['${val.languagebox.get("language")}']}",
                          color: val.authentication == "signin"
                              ? colorApp.colorbgbutton2
                              : colorApp.colorbgbutton1,
                          colorfont: val.authentication == "signin"
                              ? colorApp.colorFontwhite
                              : colorApp.colorFontblack,
                          func: () {
                            val.switchAuthentcation("signin");
                          }),
                    ],
                  ),
                ),
                AnimatedCrossFade(
                    firstCurve: Curves.easeIn,
                    secondCurve: Curves.easeIn,
                    firstChild: SignIn(),
                    secondChild: SignUp(),
                    crossFadeState: val.authentication == "signin"
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: Duration(seconds: 1))
                // val.authentication == "signin" ? SignIn() : SignUp(),
                //input
              ],
            ),
          ),
        );
      }),
    );
  }
}
