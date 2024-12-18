import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class Board2 extends StatelessWidget {
  ColorApp colorsApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
        return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/board2.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                textAlign: TextAlign.center,
                "لماذا تختارنا ؟!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400,color: colorsApp.colorfontboard),
              ),
            ),
            SizedBox(height: 60,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                textAlign: TextAlign.center,
                "سرعة فائقة: توصيل في وقت قياسي. أمان مضمون: منتجات عالية الجودة بأفضل المعايير. راحة تامة: دعم متواصل وخدمة مخصصة لتلبية كل طلباتك. نحن هنا لتسهيل حياتك وجعل احتياجاتك أقرب مما تتخيل!",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300,color: colorsApp.colorgreyapp),
              ),
            ),
          ],
        ),
      ),
    );
  });
  }
}
