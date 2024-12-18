import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class Prodect extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: colorApp.colorborder, width: 1)),
        child: Column(
          children: [
            Container(child: Image.asset("assets/images/prodect1.png")),
            Divider(),
            Container(
              child: Text(
                textAlign: TextAlign.center,
                "أنابيب بي-آل-بي",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorApp.colorFontblack),
              ),
            ),
            Container(
              child: Text(
                textAlign: TextAlign.center,
                "مناسب للنقل ، يمكن تعبئته في لفة",
                style: TextStyle(color: colorApp.colorFontblack),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    textAlign: TextAlign.center,
                    "ريال سعودي",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorbgbutton2),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  child: Text(
                    textAlign: TextAlign.center,
                    "23",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblack),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: colorApp.colorborder, width: 1)),
                    child: TextButton(onPressed: () {}, child: Text("-"))),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    textAlign: TextAlign.center,
                    "23",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblack),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    width: 35,
                    height: 35,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: colorApp.colorborder, width: 1)),
                    child: TextButton(onPressed: () {}, child: Text("+"))),
              ],
            ),
            BottonApp(
                      width: 150,
                title: "أضف إلي السلة",
                color: colorApp.colorbgbutton2,
                func: () {
                  dialogApp.checkdialog(context, () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushReplacementNamed("cart");
                    val.switchBottomNavigatorBar(2);
                  }, "تم الاضافة", true);
                })
          ],
        ),
      );
    });
  }
}
