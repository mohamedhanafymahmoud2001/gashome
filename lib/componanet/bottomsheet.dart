import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class BottomSheetApp {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  LangLocal langLocal = new LangLocal();
  doneOrder(BuildContext context, int id) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Consumer<Control>(builder: (context, val, child) {
            return Container(
              width: double.infinity,
              height: 300,
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                    child: Text(
                      "${langLocal.langLocal['lang5']['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colorApp.colorFontblue),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    child: Text(
                      "${langLocal.langLocal['lang6']['${val.languagebox.get("language")}']}",
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
                            title:
                                "${langLocal.langLocal['lang7']['${val.languagebox.get("language")}']}",
                            color: colorApp.colorbgbutton2,
                            func: () {
                              Navigator.of(context).pop();
                            },
                            width: 150),
                        BottonApp(
                            title:
                                "${langLocal.langLocal['lang8']['${val.languagebox.get("language")}']}",
                            color: colorApp.colorbgbutton2,
                            func: () {
                              val.EndOrder(id);
                              dialogApp.checkdialog(context, () {
                                // if (Navigator.canPop(context)) {
                                  Navigator.of(context).pop();
                                // }
                              });
                            },
                            width: 150)
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            );
          });
        });
  }

  deletOrder(BuildContext context, int id) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Consumer<Control>(builder: (context, val, child) {
            return Container(
              width: double.infinity,
              height: 300,
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                    child: Text(
                      "${langLocal.langLocal['lang9']['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colorApp.colorFontblue),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    child: Text(
                      //السائق يريد عدم توصل الطبية

                      "${langLocal.langLocal['lang10']['${val.languagebox.get("language")}']}",
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
                            title:
                                "${langLocal.langLocal['lang11']['${val.languagebox.get("language")}']}",
                            color: colorApp.colorbgbutton2,
                            func: () {
                              Navigator.of(context).pop();
                            },
                            width: 150),
                        BottonApp(
                            title:
                                "${langLocal.langLocal['lang12']['${val.languagebox.get("language")}']}",
                            color: colorApp.colorbgbutton2,
                            func: () {
                              //السائق يريد عدم توصل الطبية
                              val.DeleteOrder(id);
                              dialogApp.checkdialog(context, () {
                                Navigator.of(context).pop();
                              });
                            },
                            width: 150)
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            );
          });
        });
  }

  rejectOrder(BuildContext context, int id) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Consumer<Control>(builder: (context, val, child) {
            return Container(
              width: double.infinity,
              height: 300,
              child: Column(
                children: [
                  Expanded(child: Container()),
                  Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      "${langLocal.langLocal['lang13']['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: colorApp.colorFontblue),
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    child: Text(
                      "${langLocal.langLocal['lang14']['${val.languagebox.get("language")}']}",
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
                            title:
                                "${langLocal.langLocal['lang11']['${val.languagebox.get("language")}']}",
                            color: colorApp.colorbgbutton2,
                            func: () {
                              Navigator.of(context).pop();
                            },
                            width: 150),
                        BottonApp(
                            title:
                                "${langLocal.langLocal['lang12']['${val.languagebox.get("language")}']}",
                            color: colorApp.colorbgbutton2,
                            func: () {
                              //
                              //"هل رفض العميل استلام الطلبية"
                              val.CancelOrder(id);
                              dialogApp.checkdialog(context, () {
                                // if (Navigator.canPop(context)) {
                                Navigator.of(context).pop();
                                // }
                              });
                            },
                            width: 150)
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            );
          });
        });
  }
}
