import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/onboarding/langoage.dart';
import 'package:provider/provider.dart';

class DialogApp {
  ColorApp colorApp = new ColorApp();
  LangLocal langLocal = new LangLocal();
  Future<void> checkdialog(BuildContext context, VoidCallback func) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,

            scrollable: true,
            // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            // title: Text('Verify'),
            elevation: 10,
            content: val.checkAll == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )
                : Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: Image.asset(val.checkAll['message'] ==
                                      "User Logged In Successfully" ||
                                  val.checkAll['message'] ==
                                      "Added to Cart Successfully" ||
                                  val.checkAll['message'] ==
                                      "Product Already in Cart" ||
                                  val.checkAll['message'] ==
                                      "Product Deleted Successfully" ||
                                  val.checkAll['message'] ==
                                      "User Created and SMS Sent Successfully" ||
                                  val.checkAll['message'] ==
                                      "All items are available." ||
                                  val.checkAll['message'] ==
                                      "Driver Logged In Successfully" ||
                                  val.checkAll['message'] ==
                                      "Order created successfully with Cash on Delivery." ||
                                  val.checkAll['message'] ==
                                      "Address added successfully" ||
                                  val.checkAll['message'] ==
                                      "Order assigned to driver successfully" ||
                                  val.checkAll['message'] ==
                                      "Order cancelled" ||
                                  val.checkAll['message'] ==
                                      "Order delivered" ||
                                  val.checkAll['message'] ==
                                      "Order Rejected Successfully" ||
                                  val.checkAll['message'] ==
                                      "User Created and SMS Sent Successfully" ||
                                  val.checkAll['message'] ==
                                      "The phone number has already been taken." ||
                                  val.checkAll['message'] ==
                                      "User Verified Successfully" ||
                                  val.checkAll['message'] ==
                                      "code sent to phone number" ||
                                  val.checkAll['message'] ==
                                      "Code confirmed successfully." ||
                                  val.checkAll['message'] ==
                                      "Password changed successfully"
                              ? "assets/images/seccess.png"
                              : "assets/images/error.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: Text(
                            textAlign: TextAlign.center,
                            val.checkAll['message'] ==
                                        "User Logged In Successfully" ||
                                    val.checkAll['message'] ==
                                        "Added to Cart Successfully" ||
                                    val.checkAll['message'] ==
                                        "Product Already in Cart" ||
                                    val.checkAll['message'] ==
                                        "Product Deleted Successfully" ||
                                    val.checkAll['message'] ==
                                        "User Created and SMS Sent Successfully" ||
                                    val.checkAll['message'] ==
                                        "All items are available." ||
                                    val.checkAll['message'] ==
                                        "Driver Logged In Successfully" ||
                                    val.checkAll['message'] ==
                                        "Order created successfully with Cash on Delivery." ||
                                    val.checkAll['message'] ==
                                        "Address added successfully" ||
                                    val.checkAll['message'] ==
                                        "Order assigned to driver successfully" ||
                                    val.checkAll['message'] ==
                                        "Order cancelled" ||
                                    val.checkAll['message'] ==
                                        "Order delivered" ||
                                    val.checkAll['message'] ==
                                        "Order Rejected Successfully" ||
                                    val.checkAll['message'] ==
                                        "User Created and SMS Sent Successfully" ||
                                    val.checkAll['message'] ==
                                        "The phone number has already been taken." ||
                                    val.checkAll['message'] ==
                                        "User Verified Successfully" ||
                                    val.checkAll['message'] ==
                                        "code sent to phone number" ||
                                    val.checkAll['message'] ==
                                        "Code confirmed successfully." ||
                                    val.checkAll['message'] ==
                                        "Password changed successfully"
                                ? "${langLocal.langLocal['lang51']['${val.languagebox.get("language")}']}"
                                : "${val.checkAll['message']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            height: 1,
                            color: Colors.grey.shade300,
                            thickness: 2,
                            endIndent: 70,
                            indent: 70,
                          ),
                        ),
                      ],
                    )),
            actions: <Widget>[
              val.checkAll == null
                  ? Container()
                  : Center(
                      child: BottonApp(
                          width: 150,
                          title:
                              "${langLocal.langLocal['ok']['${val.languagebox.get("language")}']}",
                          color: colorApp.colorbgbuttonapp,
                          func: val.checkAll['message'] ==
                                      "User Logged In Successfully" ||
                                  val.checkAll['message'] ==
                                      "Added to Cart Successfully" ||
                                  val.checkAll['message'] ==
                                      "Product Already in Cart" ||
                                  val.checkAll['message'] ==
                                      "User Created and SMS Sent Successfully" ||
                                  val.checkAll['message'] ==
                                      "All items are available." ||
                                  val.checkAll['message'] ==
                                      "Driver Logged In Successfully" ||
                                  val.checkAll['message'] ==
                                      "Order created successfully with Cash on Delivery." ||
                                  val.checkAll['message'] ==
                                      "Address added successfully" ||
                                  val.checkAll['message'] ==
                                      "Order assigned to driver successfully." ||
                                  val.checkAll['message'] ==
                                      "Order cancelled" ||
                                  val.checkAll['message'] ==
                                      "Order delivered" ||
                                  val.checkAll['message'] ==
                                      "Order Rejected Successfully" ||
                                  val.checkAll['message'] ==
                                      "User Created and SMS Sent Successfully" ||
                                  val.checkAll['message'] ==
                                      "The phone number has already been taken." ||
                                  val
                                          .checkAll['message'] ==
                                      "User Verified Successfully" ||
                                  val.checkAll['message'] ==
                                      "code sent to phone number" ||
                                  val.checkAll['message'] ==
                                      "Code confirmed successfully." ||
                                  val.checkAll['message'] ==
                                      "Password changed successfully"
                              ? func
                              : () {
                                  Navigator.of(context).pop();
                                })),
            ],
          );
        });
      },
    );
  }

  Future<void> checkdialogPayOnLine(
      BuildContext context, VoidCallback func) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,
            scrollable: true,
            // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            // title: Text('Verify'),
            elevation: 10,
            content: val.checkAll == null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                    ],
                  )
                : Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          child: Image.asset(
                              val.completOrder['message'] == 'Payment Linke'
                                  ? "assets/images/seccess.png"
                                  : "assets/images/error.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          child: Text(
                            textAlign: TextAlign.center,
                            "${val.completOrder['message']}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            height: 1,
                            color: Colors.grey.shade300,
                            thickness: 2,
                            endIndent: 70,
                            indent: 70,
                          ),
                        ),
                      ],
                    )),
            actions: <Widget>[
              val.checkAll == null
                  ? Container()
                  : Center(
                      child: BottonApp(
                          width: 150,
                          title:
                              "${langLocal.langLocal['ok']['${val.languagebox.get("language")}']}",
                          color: colorApp.colorbgbuttonapp,
                          func: val.completOrder['message'] == 'Payment Linke'
                              ? func
                              : () {
                                  Navigator.of(context).pop();
                                })),
            ],
          );
        });
      },
    );
  }

  Future<void> addAddress(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,

            scrollable: true,
            // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            // title: Text('Verify'),
            elevation: 10,
            content: Container(
              width: 250,
              height: 250,
              child: ListView.builder(
                  itemCount: val.address['data'].length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          val.SelectAddress(
                              "${val.address['data'][i]['city']} ,${val.address['data'][i]['state']} ,${val.address['data'][i]['street_name']} ,${val.address['data'][i]['building_number']}",
                              val.address['data'][i]['id']);
                          Navigator.of(context).pop();
                        },
                        title: Text(
                            "${val.address['data'][i]['city']} ,${val.address['data'][i]['state']} ,${val.address['data'][i]['street_name']} ,${val.address['data'][i]['building_number']}"),
                      ),
                    );
                  }),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottonApp(
                      title:
                          "${langLocal.langLocal['lang15']['${val.languagebox.get("language")}']}",
                      color: colorApp.colorbgbutton2,
                      func: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pushNamed("location");
                      },
                      width: 150),
                ],
              )
            ],
          );
        });
      },
    );
  }

  Future<void> Logout(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Consumer<Control>(builder: (context, val, child) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shadowColor: Colors.white,

            scrollable: true,
            // titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            // title: Text('Verify'),
            elevation: 10,
            content: Container(
              margin:  EdgeInsets.only(top: 20),
              child: Text( textAlign: TextAlign.center,
                  "${langLocal.langLocal['lang52']['${val.languagebox.get("language")}']}",
                              style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottonApp(
                      title:
                          "${langLocal.langLocal['lang11']['${val.languagebox.get("language")}']}",
                      color: colorApp.colorbgbutton2,
                      func: () {
                        Navigator.of(context).pop();
                      },
                      width: 100),
                  Expanded(child: SizedBox()),
                  BottonApp(                    
                      title:
                          "${langLocal.langLocal['lang12']['${val.languagebox.get("language")}']}",
                      color: colorApp.colorbgbutton2,
                      func: () {
                        val.type_user.clear();
                        print(val.type_user.get("type_user"));
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => Langoage()),
                          (Route<dynamic> route) => false,
                        );
                      },
                      width: 100),
                ],
              )
            ],
          );
        });
      },
    );
  }
}
