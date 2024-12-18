import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarApp extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return BottomNavigationBar(
          onTap: (valu) {
            print(valu);
            val.switchBottomNavigatorBar(valu);
            
            // Navigator.of(context).pushReplacementNamed(valu == 0
            //     ? "suport"
            //     : valu == 1
            //         ? "account"
            //         : valu == 2
            //             ? "cart"
            //             : "home");
            
          },
          currentIndex: val.screen,
          backgroundColor: colorApp.colorbody,
          selectedItemColor: colorApp.colorbgbutton2,
          useLegacyColorScheme: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.support_agent), label: 'خدمة العملاء'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'الحساب'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout), label: 'عربة التسوق'),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'الصفحة الرئيسية'),
          ]);
    });
  }
}

class BottomNavigationBarAppDriver extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
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
                icon: Icon(Icons.support), label: 'الشكاوي'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                ),
                label: 'الحساب'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_shipping_outlined,
                ),
                label: 'طلباتي'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.inventory_2_outlined,
                ),
                label: 'حجز طلبية'),
          ]);
    });
  }
}
