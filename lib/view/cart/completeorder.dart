import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/prov.dart';
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
                    "نود إبلاغك بأن طلبك من غازهوم في طريقه إليك! فريقنا حريص على إيصال الطلب بأسرع وقت ممكن،ونتابع عن كثب لضمان وصوله بسلام. ستتلقى إشعارًا بمجرد أن يصل السائق إلى موقعك.إذا كانت لديك أي استفسارات، لا تتردد في التواصل معنا.شكرًا لاختيارك غازهوم، ونتمنى لك تجربة تسوق مريحة معنا.مع أطيب التحيات،",
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
                        "الإثنين الموافق 28 / 10 / 2024",
                        style: TextStyle(
                            fontSize: 15, color: colorApp.colorFontblack),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "ميعاد التسليم",
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
                    title: "الرئيسية",
                    color: colorApp.colorbgbutton2,
                    func: () {
                      Navigator.of(context).pushReplacementNamed("home");
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
