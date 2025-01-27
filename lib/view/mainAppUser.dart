import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/account/acount.dart';
import 'package:gazhome/view/cart/cart.dart';
import 'package:gazhome/view/home/home.dart';
import 'package:gazhome/view/suport/suport.dart';
import 'package:provider/provider.dart';

class MainAppUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainAppUser();
  }
}

class _MainAppUser extends State<MainAppUser> {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  LangLocal langLocal = new LangLocal();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Control>(context, listen: false).HomeCatogery();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Control>(context, listen: false).CountNoti();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: AppBarApp(),
          backgroundColor: colorApp.colorbody,
        ),
        backgroundColor: colorApp.colorbody,
        body: val.screen == 0
            ? Suport()
            : val.screen == 1
                ? Account()
                : val.screen == 2
                    ? Cart()
                    : Home(),
        bottomNavigationBar: BottomNavigationBarApp(),
        floatingActionButton: val.screen == 2 &&
                val.cartUser != null &&
                val.address != null
            ?val.cartUser['message']=="Cart Items"? MaterialButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  val.CreateOrder();
                  //
                  dialogApp.checkdialog(context, () {
                    if (val.selectAddress != "add address") {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed("detailsorder");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text("اضف عنوان"),
                          duration: const Duration(seconds: 2), // المدة الزمنية
                        ),
                      );
                    }
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    decoration: BoxDecoration(
                        color: colorApp.colorbgbuttonapp,
                        borderRadius: BorderRadius.circular(10)),
                    width: 200,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            color: colorApp.colorFontwhite,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "${langLocal.langLocal['completepay']['${val.languagebox.get("language")}']}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: colorApp.colorFontwhite),
                        ),
                      ],
                    ))):SizedBox()
            : SizedBox(),
      );
    });
  }
}
