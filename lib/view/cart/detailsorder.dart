import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/cart/pay.dart';
import 'package:gazhome/view/home/home.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
    DialogApp dialogApp = new DialogApp();
    LangLocal langLocal = new LangLocal();
    return Consumer<Control>(builder: (context, val, child) {
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
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.5)),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        val.selectAddress == ""
                            ? "${langLocal.langLocal['lang37']['${val.languagebox.get("language")}']}"
                            : val.selectAddress,
                        style: TextStyle(fontSize: 15)),
                  ),
                  IconButton(
                      onPressed: () {
                        dialogApp.addAddress(context);
                      },
                      icon: Icon(Icons.keyboard_arrow_down))
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
                          "${langLocal.langLocal['lang21']['${val.languagebox.get("language")}']}",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: colorApp.colorFontblack),
                        ),
                        Row(
                          children: [
                            Text(
                              "${val.createOrder['totalCost']} ${langLocal.langLocal['lang16']['${val.languagebox.get("language")}']}",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colorApp.colorbgbuttonapp),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "${langLocal.langLocal['lang22']['${val.languagebox.get("language")}']}",
                              style: TextStyle(
                                  fontSize: 15, color: colorApp.colorFontblack),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              " ${langLocal.langLocal['lang16']['${val.languagebox.get("language")}']} ${val.createOrder['tax']}",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: colorApp.colorbgbuttonapp),
                            ),
                            Expanded(child: Container()),
                            Text(
                              "${langLocal.langLocal['lang23']['${val.languagebox.get("language")}']}",
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
                          "${val.createOrder['totalCostAfterTax']} ${langLocal.langLocal['lang16']['${val.languagebox.get("language")}']}",
                          style: TextStyle(
                              fontSize: 15, color: colorApp.colorbgbuttonapp),
                        ),
                        Expanded(child: Container()),
                        Text(
                          "${langLocal.langLocal['lang24']['${val.languagebox.get("language")}']}",
                          style: TextStyle(
                              fontSize: 15, color: colorApp.colorFontblack),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  MaterialButton(
                    padding: EdgeInsets.all(0),
                    onPressed: () async {
                      final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (pickedDate != null) {
                        // صياغة التاريخ بالصيغة المطلوبة
                        val.selectDate(
                            DateFormat('yyyy-MM-dd').format(pickedDate));
                      }
                    },
                    child: Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: colorApp.colorborder, width: 1)),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_view_day_rounded),
                          Expanded(
                            child: SizedBox(),
                          ),
                          Text(val.selectedDate == ""
                              ? "${langLocal.langLocal['lang38']['${val.languagebox.get("language")}']}"
                              : "${val.selectedDate}"),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "${langLocal.langLocal['lang25']['${val.languagebox.get("language")}']}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: colorApp.colorFontblue),
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
                        val.PayMentMethod("online");
                        dialogApp.checkdialogPayOnLine(context, () {
                          if (val.linkPay != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                //${val.linkPay}
                                builder: (context) =>
                                    web(paymentToken: "${val.linkPay}"),
                              ),
                            );
                          }
                        });
                      },
                      leading: Icon(Icons.payment_outlined),
                      title: Text(
                          "${langLocal.langLocal['lang26']['${val.languagebox.get("language")}']}"),
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
                        if (val.selectAddress != "add address") {
                          val.PayMentMethod("cod");
                          dialogApp.checkdialog(context, () {
                            if (val.completOrder['message'] ==
                                "Order created successfully with Cash on Delivery.") {
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(builder: (context) => Home()),
                                (Route<dynamic> route) => false,
                              );
                              Navigator.of(context).pushNamed("completorder");
                              val.switchBottomNavigatorBar(3);
                            }
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "${langLocal.langLocal['lang27']['${val.languagebox.get("language")}']}"),
                              duration:
                                  const Duration(seconds: 2), // المدة الزمنية
                            ),
                          );
                        }
                      },
                      leading: Icon(Icons.home_outlined),
                      title: Text(
                          "${langLocal.langLocal['lang28']['${val.languagebox.get("language")}']}"),
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
    });
  }
}
