import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/viewdriver/account/bodyaccount.dart';
class AccountDriver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccountDriver();
  }
}

class _AccountDriver extends State<AccountDriver> {
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:
                                Image.asset("assets/images/accountdriver.png")),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 10),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color:
                                        colorApp.colorgreyapp.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "Ahmed Salem Ali",
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 10, top: 10),
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                    color:
                                        colorApp.colorgreyapp.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "0102567289107",
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(left: 10, top: 10),
                                width: double.infinity,
                                // height: 60,
                                decoration: BoxDecoration(
                                    color:
                                        colorApp.colorgreyapp.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  "المملكة العربية السعودية جدة - حي الزهور - شارع الملك عبد الله - رقم المبني 15",
                                  style: TextStyle(
                                      fontSize: 12, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10, top: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: colorApp.colorgreyapp.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text(
                      "325617",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      "رقم رخصة القيادة :",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 10, top: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: colorApp.colorgreyapp.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Text(
                      "102934",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      "رقم رخصة السيارة :",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity, 
                // height: 400,
                child: ListView.builder(
                  physics:  NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, i) {
                  return BodyAccount();
                }),
              )
            ],
          ),
        ),
      );
  }
}
