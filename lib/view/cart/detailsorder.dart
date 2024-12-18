import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/inputapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/home/home.dart';
import 'package:provider/provider.dart';

class DetailsOrder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DetailsOrder();
  }
}

class _DetailsOrder extends State<DetailsOrder> {
  @override
  Widget build(BuildContext context) {
    ColorApp colorApp = new ColorApp();
    return Scaffold(
        appBar: AppBar(
          leading: Container(
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
          title: Container(
            width: double.infinity,
            margin: EdgeInsets.all(5),
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorApp.colorborder, width: 1)),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.keyboard_arrow_down)),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "السعودية - الرياض مركز ........",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                Icon(Icons.pin_drop)
              ],
            ),
          ),
          backgroundColor: colorApp.colorbody,
        ),
        backgroundColor: colorApp.colorbody,
        body: Consumer<Control>(builder: (context, val, child) {
          return Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    "حدد عملية الدفع",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontblue),
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: colorApp.colorborder, width: 1)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "تفاصيل الطلبية",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: colorApp.colorFontblack),
                      ),
                      Row(
                        children: [
                          Text(
                            "35.00 ريال",
                            style: TextStyle(
                                fontSize: 15, color: colorApp.colorbgbuttonapp),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "المجموع الكلي",
                            style: TextStyle(
                                fontSize: 15, color: colorApp.colorFontblack),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            " ريال 6.00",
                            style: TextStyle(
                                fontSize: 15, color: colorApp.colorbgbuttonapp),
                          ),
                          Expanded(child: Container()),
                          Text(
                            "رسوم الضرائب ",
                            style: TextStyle(
                                fontSize: 15, color: colorApp.colorFontblack),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: colorApp.colorborder, width: 1)),
                  child: Row(
                    children: [
                      Text(
                        "41.00 ريال",
                        style: TextStyle(
                            fontSize: 15, color: colorApp.colorbgbuttonapp),
                      ),
                      Expanded(child: Container()),
                      Text(
                        "المجموع الكلي شامل الضريبة",
                        style: TextStyle(
                            fontSize: 15, color: colorApp.colorFontblack),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: colorApp.colorborder, width: 1)),
                  child: ListTile(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              color: colorApp.colorbody,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(vertical: 30),
                                    child: Text(
                                      "إضافة بطاقة جديدة",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: colorApp.colorFontblue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  ListTile(
                                    leading:
                                        Image.asset("assets/images/visa.png"),
                                    trailing: Text(
                                      "نقبل",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: colorApp.colorFontblack),
                                    ),
                                  ),
                                  InputApp(
                                      hint: "أدخل رقم الكارت",
                                      controler: val.api.numbervisa,
                                      icon: Icon(Icons.payment),
                                      keyboard: TextInputType.number),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: InputApp(
                                              hint: "أدخل رمز الأمان CCV",
                                              controler: val.api.codevisa,
                                              icon: Icon(Icons.code),
                                              keyboard: TextInputType.number)),
                                      Expanded(
                                          child: InputApp(
                                              hint: "تاريخ إنتهاء الصلاحية",
                                              controler: val.api.datevisa,
                                              icon: Icon(Icons.payment),
                                              keyboard: TextInputType.number)),
                                    ],
                                  ),
                                  BottonApp(
                      width: 150,
                                      title: "موافق",
                                      color: colorApp.colorbgbutton2,
                                      func: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) => Home()),
                                          (Route<dynamic> route) => false,
                                        );
                                        Navigator.of(context)
                                            .pushNamed("completorder");
                                        val.switchBottomNavigatorBar(3);
                                      })
                                ],
                              ),
                            );
                          });
                    },
                    leading: Icon(Icons.payment_outlined),
                    title: Text("بطاقة الاتمان"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(color: colorApp.colorborder, width: 1)),
                  child: ListTile(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Home()),
                        (Route<dynamic> route) => false,
                      );
                      Navigator.of(context).pushNamed("completorder");
                      val.switchBottomNavigatorBar(3);
                    },
                    leading: Icon(Icons.home_outlined),
                    title: Text("الدفع نقدا عند الإستلام"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
          );
        }));
  }
}
