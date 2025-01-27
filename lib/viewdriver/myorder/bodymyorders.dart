import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottomsheet.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class BodyMyOrders extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  LangLocal langLocal = new  LangLocal();
  BodyMyOrders ({
    super.key,
    required this.data,
  });
  var data;
  BottomSheetApp bottomSheetApp = new BottomSheetApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
        return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 0.5, color: colorApp.colorFontblack),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Image.network(
                      "${val.api.imagedomain2}${data['product_image']}",
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
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
                    ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Text(
                          "${data['user_first_name']} ${data['user_last_name']}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Text(
                                "${data['user_phone_number']}",
                                style: TextStyle(),
                              ),
                            ),
                            Container(
                              height: 33,
                              width: 33,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.5, color: colorApp.colorFontblack),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                      val.call(data['user_phone_number']);},
                                  icon: Icon(
                                    Icons.phone_outlined,
                                    size: 15,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Text(
                                  textAlign: TextAlign.end,
                                  '${data['address_city']} , ${data['address_state']} , ${data['address_street_name']} , ${data['address_building_number']}',
                                  style: TextStyle(),
                                ),
                              ),
                            ),
                            Container(
                              height: 33,
                              width: 33,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.5, color: colorApp.colorFontblack),
                              ),
                              child: IconButton(
                                  onPressed: () {
                                    val.setdata(double.parse(data['address_latitude']), double.parse(data['address_longitude']), "${data['user_first_name']} ${data['user_last_name']}");
                                      Navigator.of(context).pushNamed("mapdriver");
                                  },
                                  icon: Icon(
                                    Icons.pin_drop,
                                    size: 15,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 0.5, color: colorApp.colorFontblack),
                        ),
                        child: data['order_payment_status']=="paid"?  Text("${langLocal.langLocal['lang42']['${val.languagebox.get("language")}']}"):Text("${langLocal.langLocal['lang43']['${val.languagebox.get("language")}']}"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          //////
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(width: 0.5, color: colorApp.colorFontblack),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       "${langLocal.langLocal['lang16']['${val.languagebox.get("language")}']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: colorApp.colorFontblack),
                      ),
                      Text(
                        " ${data['order_total_price_after_tax']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: colorApp.colorbgbutton2),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(width: 0.5, color: colorApp.colorFontblack),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        " ${data['product_quantity_in_order']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: colorApp.colorFontblack),
                      ),
                      Text(
                        "${langLocal.langLocal['lang44']['${val.languagebox.get("language")}']}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: colorApp.colorbgbutton2),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(width: 0.5, color: colorApp.colorFontblack),
                  ),
                  child: Text(
                    "${data['product_name']}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                )),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: BottonApp(
                      width: double.infinity,
                      title: "${langLocal.langLocal['lang45']['${val.languagebox.get("language")}']}",
                      color: colorApp.colorbgbutton2,
                      func: () {
                        bottomSheetApp.doneOrder(context,data['order_id']);
                      }),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: BottonApp(
                      width: double.infinity,
                      title: "${langLocal.langLocal['lang46']['${val.languagebox.get("language")}']}",
                      color: colorApp.colorbgbutton2,
                      func: () {
                        bottomSheetApp.rejectOrder(context,data['order_id']);
                      }),
                ),SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: BottonApp(
                      width: double.infinity,
                      title: "${langLocal.langLocal['lang47']['${val.languagebox.get("language")}']}",
                      color: colorApp.colorbgbutton2,
                      func: () {
                        bottomSheetApp.deletOrder(context,data['order_id']);
                      
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );});
  }
}
