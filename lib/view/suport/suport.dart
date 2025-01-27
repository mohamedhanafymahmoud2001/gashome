import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Suport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorApp colorApp = new ColorApp();
    DialogApp dialogApp = new DialogApp();
    String phone_admin = "00966594566777";
    LangLocal langLocal = new LangLocal();
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/suport.png"),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(30),
              width: double.infinity,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorApp.colorborder, width: 1)),
              child: Text(
                textAlign: TextAlign.center,
                "${langLocal.langLocal['supportdescription']['${val.languagebox.get("language")}']}",
                style: TextStyle(fontSize: 15, color: colorApp.colorFontblack),
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.all(10),
              width: double.infinity,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorApp.colorborder, width: 1)),
              child: Row(
                children: [
                  MaterialButton(
                    padding: EdgeInsets.all(0),
                    minWidth: 25,
                    onPressed: () async {
                      final Uri url = Uri(
                          scheme: 'https', host: 'wa.me', path: phone_admin);
                      if (await canLaunchUrl(url)) {
                        launchUrl(url);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      height: 25,
                      width: 25,
                      child: Image.asset("assets/images/whatsapp.png"),
                    ),
                  ),
                  Text(
                    "+966594566777",
                    style:
                        TextStyle(fontSize: 15, color: colorApp.colorFontblack),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "${langLocal.langLocal['contact']['${val.languagebox.get("language")}']}",
                    style: TextStyle(
                        fontSize: 15,
                        color: colorApp.colorFontblue,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            BottonApp(
                width: 150,
                title: "${langLocal.langLocal['lang36']['${val.languagebox.get("language")}']}",
                color: colorApp.colorbgbutton2,
                func: () async {
                  val.call(phone_admin);
                  // final Uri url = Uri(
                  //     scheme: 'https', host: 'wa.me', path: phone_admin );
                  // if (await canLaunchUrl(url)) {
                  //   launchUrl(url);
                  // }
                })
          ],
        ),
      );
    });
  }
}
