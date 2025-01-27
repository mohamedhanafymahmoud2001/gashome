import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/viewdriver/account/bodyaccount.dart';
import 'package:provider/provider.dart';
class AccountDriver extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccountDriver();
  }
}

class _AccountDriver extends State<AccountDriver> {
  ColorApp colorApp = new ColorApp();
  LangLocal langLocal = new LangLocal();
  @override
  Widget build(BuildContext context) {
    return  Consumer<Control>(builder: (context, val, child) {
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
                        height: 160,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child:Image.network(
                      "${val.api.imagedomain2}${val.image_driver.get("image_driver")}",
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        // في حال حدوث خطأ، يمكنك عرض صورة افتراضية
                        return Image.asset(
                          "assets/images/logo.png", // المسار إلى الصورة الافتراضية
                          fit: BoxFit.cover,
                        );
                      },
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        // عرض مؤشر تحميل أثناء تحميل الصورة
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      },
                    )),
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
                                  "${val.name_driver.get("name_driver")}",
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
                                  "${val.phone_number_driver.get("phone_number")}",
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
                                  "${val.address_driver.get("address_driver")}",
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
                      "${val.license_number_driver.get("license_number_driver")}",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      "${langLocal.langLocal['lang39']['${val.languagebox.get("language")}']}",
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
                      "${val.vehicle_license_driver.get("vehicle_license_driver")}",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                     "${langLocal.langLocal['lang40']['${val.languagebox.get("language")}']}",
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
                      "${val.vehicle_number_driver.get("vehicle_numer_driver")}",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Text(
                      "${langLocal.langLocal['lang41']['${val.languagebox.get("language")}']}",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity, 
                // height: 400,
                child:val.getMyOrders==null?Center(child: Container(child: CircularProgressIndicator())):val.getMyOrders['message']!='All orders'?Center(
                      child: Image.asset("assets/images/nodata.png"),
                    ) :ListView.builder(
                  physics:  NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: val.getMyOrders['data'].length,
                  itemBuilder: (context, i) {
                  return BodyAccount(data:val.getMyOrders['data'][i]);
                }),
              )
            ],
          ),
        ),
      );
      }
      );
  }
}
