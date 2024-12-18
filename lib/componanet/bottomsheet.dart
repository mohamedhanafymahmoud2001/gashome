import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';

class BottomSheetApp {
  ColorApp colorApp = new ColorApp();
  doneOrder(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            height: 300,
            child: Column(
              children: [
                Expanded(child: Container()),
                Container(
                  child: Text(
                    "تأكيد عملية الدفع",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblue),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  child: Text(
                    "هل تم سداد المبلغ من العميل ؟!",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblack),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BottonApp(
                          title: "لم يتم الدفع بعد",
                          color: colorApp.colorbgbutton2,
                          func: () {},
                          width: 150),
                      BottonApp(
                          title: "تم السداد",
                          color: colorApp.colorbgbutton2,
                          func: () {},
                          width: 150)
                    ],
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          );
        });
  }

  deletOrder(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            height: 300,
            child: Column(
              children: [
                Expanded(child: Container()),
                Container(
                  child: Text(
                    "تأكيد عملية الحذف",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblue),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  child: Text(
                    "هل لا تريد توصيل هذه الطلبة",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblack),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BottonApp(
                          title: "رجوع",
                          color: colorApp.colorbgbutton2,
                          func: () {},
                          width: 150),
                      BottonApp(
                          title: "نعم",
                          color: colorApp.colorbgbutton2,
                          func: () {},
                          width: 150)
                    ],
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          );
        });
  }
  rejectOrder(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            width: double.infinity,
            height: 300,
            child: Column(
              children: [
                Expanded(child: Container()),
                Container(
                  child: Text(
                    "تاكيد عدم استلام العميل الطلبية",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblue),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  child: Text(
                    "هل رفض العميل استلام الطلبية",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblack),
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BottonApp(
                          title: "رجوع",
                          color: colorApp.colorbgbutton2,
                          func: () {},
                          width: 150),
                      BottonApp(
                          title: "نعم",
                          color: colorApp.colorbgbutton2,
                          func: () {},
                          width: 150)
                    ],
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          );
        });
  }
}
