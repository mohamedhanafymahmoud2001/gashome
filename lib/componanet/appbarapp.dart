import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/onboarding/langoage.dart';
import 'package:provider/provider.dart';

class AppBarBack extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Row(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorApp.colorborder, width: 1)),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.keyboard_arrow_left)),
          ),
          Expanded(child: SizedBox()),
          Container(
              height: 25,
              width: 120,
              // margin: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(val.languagebox.get("language") == "ar"
                  ? "assets/images/gazar.png"
                  : "assets/images/gazen.png"))
        ],
      );
    });
  }
}

class AppBarApp extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp=new DialogApp(); 
  LangLocal langLocal =new LangLocal();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Row(
        children: [
          Container(
              height: 25,
              width: 120,
              child: Image.asset(val.languagebox.get("language") == "ar"
                  ? "assets/images/gazar.png"
                  : "assets/images/gazen.png")),
          Expanded(child: SizedBox()),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorApp.colorborder, width: 1)),
            child: Stack(
              children: [
                val.countnoti == null
                    ? SizedBox()
                    : val.countnoti['message'] ==
                            "Successfully retrieved unread notifications count."
                        ? Container(
                          margin: EdgeInsets.all(3),
                          child: Text("${val.countnoti['unread_count']}",style:TextStyle(fontSize: 14,color: colorApp.colorbgbutton2)))
                        : SizedBox(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("notification");
                    },
                    icon: Icon(Icons.notifications_outlined)),
              ],
            ),
          ),
          val.screen == 1
              ? Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: colorApp.colorborder, width: 1)),
                  child: TextButton(
                    onPressed: () {
                      dialogApp.Logout(context);
                      
                    },
                    child: Text(
                      "${langLocal.langLocal['lang52']['${val.languagebox.get("language")}']}",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              : SizedBox(),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorApp.colorborder, width: 1)),
            child: TextButton(
              onPressed: () {
                val.switchBottomNavigatorBar(1);
              },
              child: Text("${val.first_name_user.get("first_name_user")[0]}"),
            ),
          ),
        ],
      );
    });
  }
}

class AppBarAppDriver extends StatelessWidget {
  LangLocal langLocal =new LangLocal();
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp= new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Row(
        children: [
          Container(
              height: 25,
              width: 120,
              child: Image.asset(val.languagebox.get("language") == "ar"
                  ? "assets/images/gazar.png"
                  : "assets/images/gazen.png")),
          Expanded(child: SizedBox()),
          val.ScreenDriver == 1
              ? Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: colorApp.colorborder, width: 1)),
                  child: TextButton(
                    onPressed: () {
                      dialogApp.Logout(context);
                    },
                    child: Text(
                      "${langLocal.langLocal['lang52']['${val.languagebox.get("language")}']}",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                )
              : SizedBox(),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorApp.colorborder, width: 1)),
            child: TextButton(
              onPressed: () {
                val.changenavbardriver(1);
              },
              child: Text("${val.name_driver.get("name_driver")[0]}"),
            ),
          ),
        ],
      );
    });
  }
}
