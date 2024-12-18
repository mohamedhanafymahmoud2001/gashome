import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';

class SupportDriver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SupportDriver();
  }
}

class _SupportDriver extends State<SupportDriver> {
  @override
  Widget build(BuildContext context) {
    ColorApp colorApp = new ColorApp();
    DialogApp dialogApp = new DialogApp();
    return  Container(
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
                "مرحبًا بكم في خدمة عملاء تطبيق غازهوم نحن هنا لخدمتكم وللإجابة على أي استفسارات أو مساعدتكم في حل أي مشكلة تواجهونها أثناء استخدام التطبيق.فريقنا جاهز لدعمكم على مدار الساعة لضمان تجربة تسوّق سلسة ومريحة.",
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 3),
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/images/whatsapp.png"),
                  ),
                  Text(
                    "0123456213443",
                    style:
                        TextStyle(fontSize: 15, color: colorApp.colorFontblack),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "يرجي التواصل معنا عبر",
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
                title: "اتصال", color: colorApp.colorbgbutton2, func: () {})
          ],
        ),
      );
  }
}
