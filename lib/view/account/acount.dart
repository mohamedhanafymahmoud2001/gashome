import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/account/prodectaccount.dart';
import 'package:provider/provider.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorApp colorApp = new ColorApp();
    DialogApp dialogApp = new DialogApp();
    LangLocal langLocal = new LangLocal();
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: colorApp.colorborder, width: 1)),
                    child: ListTile(
                      title: Text(
                          "${val.first_name_user.get("first_name_user")}"),
                      trailing: Icon(Icons.person_2_outlined),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: colorApp.colorborder, width: 1)),
                    child: ListTile(
                      title:
                          Text("${val.last_name_user.get("last_name_user")}"),
                      trailing: Icon(Icons.person_2_outlined),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: colorApp.colorborder, width: 1)),
              child: ListTile(
                title:
                    Text("${val.phone_number_user.get("phone_number_user")}"),
                trailing: Icon(Icons.phone_outlined),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "${langLocal.langLocal['orders']['${val.languagebox.get("language")}']}",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: colorApp.colorFontblue),
              ),
            ),
            val.allOrders == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : val.allOrders['message'] !=
                        'All orders and their products'
                    ? Center(
                      child: Image.asset("assets/images/nodata.png"),
                    )
                    : Expanded(
                      child: Container(
                          width:MediaQuery.of(context).size.width,
                          child: ListView.builder(
                              // shrinkWrap: true,
                              // physics: NeverScrollableScrollPhysics(),
                              itemCount:val.allOrders['data'].length,
                              itemBuilder: (context, i) {
                                return ProdectAccount(data:val.allOrders['data'][i]);
                              }),
                        ),
                    ),
            //////////////
          ],
        ),
      );
    });
  }
}
