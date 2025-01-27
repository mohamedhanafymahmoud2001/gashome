import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/mainAppUser.dart';
import 'package:provider/provider.dart';

class CompleteOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CompleteOrder();
  }
}

class _CompleteOrder extends State<CompleteOrder> {
  @override
  Widget build(BuildContext context) {
    ColorApp colorApp = new ColorApp();
    DialogApp dialogApp = new DialogApp();
    LangLocal langLocal = new LangLocal();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: AppBarBack(),
        backgroundColor: colorApp.colorbody,
      ),
      backgroundColor: colorApp.colorbody,
      body: Consumer<Control>(builder: (context, val, child) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/images/completorder.png"),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(30),
                  width: double.infinity,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: colorApp.colorborder, width: 1)),
                  child: Text(
                    textAlign: TextAlign.center,
                    "${langLocal.langLocal['lang17']['${val.languagebox.get("language")}']}",
                    style:
                        TextStyle(fontSize: 15, color: colorApp.colorFontblack),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: colorApp.colorborder, width: 1)),
                  child: Row(
                    children: [
                      Text(
                        "${langLocal.langLocal['lang18']['${val.languagebox.get("language")}']} ${val.selectedDate}",
                        style: TextStyle(
                            fontSize: 15, color: colorApp.colorFontblack),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "${langLocal.langLocal['lang19']['${val.languagebox.get("language")}']}",
                        style: TextStyle(
                            fontSize: 15,
                            color: colorApp.colorFontblue,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                BottonApp(
                      width: 150,
                    title:"${langLocal.langLocal['lang20']['${val.languagebox.get("language")}']}",
                    color: colorApp.colorbgbutton2,
                    func: () {
                      Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => MainAppUser()),
                                          (Route<dynamic> route) => false,
                                        );
                      val.switchBottomNavigatorBar(3);
                    })
              ],
            ),
          ),
        );
      }),
    );
  }
}
