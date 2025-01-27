import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarApp extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  LangLocal langLocal = new LangLocal();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return BottomNavigationBar(
          onTap: (valu) {
            print(valu);
            val.switchBottomNavigatorBar(valu);
          },
          currentIndex: val.screen,
          backgroundColor: colorApp.colorbody,
          selectedItemColor: colorApp.colorbgbutton2,
          useLegacyColorScheme: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.support_agent),
                label:
                    "${langLocal.langLocal['support']['${val.languagebox.get("language")}']}"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label:
                    "${langLocal.langLocal['account']['${val.languagebox.get("language")}']}"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout),
                label:
                    "${langLocal.langLocal['cart']['${val.languagebox.get("language")}']}"),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label:
                    "${langLocal.langLocal['home']['${val.languagebox.get("language")}']}"),
          ]);
    });
  }
}

class BottomNavigationBarAppDriver extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  LangLocal langLocal=new LangLocal();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return BottomNavigationBar(
          onTap: (value) {
            val.changenavbardriver(value);
          },
          currentIndex: val.ScreenDriver,
          backgroundColor: colorApp.colorbody,
          selectedItemColor: colorApp.colorbgbutton2,
          useLegacyColorScheme: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.support), label: "${langLocal.langLocal['lang1']['${val.languagebox.get("language")}']}"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label:"${langLocal.langLocal['lang2']['${val.languagebox.get("language")}']}"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_shipping_outlined,
                ),
                label: "${langLocal.langLocal['lang3']['${val.languagebox.get("language")}']}"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.inventory_2_outlined,
                ),
                label: "${langLocal.langLocal['lang4']['${val.languagebox.get("language")}']}"),
          ]);
    });
  }
}
