import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class Board1 extends StatelessWidget {
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
              child: Image.asset("assets/images/board1.png"),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                textAlign: TextAlign.center,
                "مرحبا بك في GasHome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400,color: colorsApp.colorfontboard),
              ),
            ),
            SizedBox(height: 60,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                textAlign: TextAlign.center,
                "وجهتك المثالية للحصول على أسطوانات الغاز بسهولة وأمان. معنا، ودّع عناء البحث، واستمتع بتجربة طلب سريعة ومريحة تلبي احتياجاتك اليومية.",
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
