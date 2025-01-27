import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class Prodect extends StatelessWidget {
  Prodect({
    super.key,
    required this.data,
    required this.i,
  });
  var data;
  final int i;
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  LangLocal langLocal = new LangLocal();
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
            Container(
                child: Image.network(
              '${val.api.imageDomain}${data['image']}',
              fit: BoxFit.cover,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                // في حال حدوث خطأ، يمكنك عرض صورة افتراضية
                return Image.asset(
                  "assets/images/logo.png", // المسار إلى الصورة الافتراضية
                  fit: BoxFit.cover,
                );
              },
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                // عرض مؤشر تحميل أثناء تحميل الصورة
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
            )),
            Expanded(child: SizedBox()),
            Divider(),
            Container(
              child: Text(
                textAlign: TextAlign.center,
                "${data['name']}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: colorApp.colorFontblack),
              ),
            ),
            Container(
              child: Text(
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                "${data['description']}",
                style: TextStyle(color: colorApp.colorFontblack),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    textAlign: TextAlign.center,
                    "${langLocal.langLocal['lang16']['${val.languagebox.get("language")}']}",
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
                    "${data['price']}",
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
                    child: TextButton(
                        onPressed: () {
                          val.decreazeProdect(i);
                        },
                        child: Text("-"))),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    textAlign: TextAlign.center,
                    "${data['number']}",
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
                    child: TextButton(
                        onPressed: () {
                          val.increazeProdect(i);
                        },
                        child: Text("+"))),
              ],
            ),
            BottonApp(
                width: 150,
                title:
                    "${langLocal.langLocal['lang30']['${val.languagebox.get("language")}']}",
                color: colorApp.colorbgbutton2,
                func: () {
                  val.AddToCart(i);
                  dialogApp.checkdialog(context, () {
                    Navigator.of(context).pop();
                    val.CartUser();
                    val.switchBottomNavigatorBar(2);
                  });
                })
          ],
        ),
      );
    });
  }
}
