import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';

class BodyReservOrder extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 0.5, color: colorApp.colorFontblack),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Image.asset("assets/images/prodect1.png"),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Text(
                          "محمد حنفي محمود",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 5),
                              child: Text(
                                "0123417635261",
                                style: TextStyle(),
                              ),
                            ),
                            Container(
                              height: 33,
                              width: 33,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.5, color: colorApp.colorFontblack),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.phone_outlined,
                                    size: 15,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 5),
                                child: Text(
                                  textAlign: TextAlign.end,
                                  "جدة - حي الزهور - شارع الملك عبد الله - رقم المبني 15",
                                  style: TextStyle(),
                                ),
                              ),
                            ),
                            Container(
                              height: 33,
                              width: 33,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 0.5, color: colorApp.colorFontblack),
                              ),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.pin_drop,
                                    size: 15,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 0.5, color: colorApp.colorFontblack),
                        ),
                        child: Text("تم سداد فاتورة الشراء"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          //////
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(width: 0.5, color: colorApp.colorFontblack),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ريال",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: colorApp.colorFontblack),
                      ),
                      Text(
                        " 323",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: colorApp.colorbgbutton2),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(width: 0.5, color: colorApp.colorFontblack),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "3",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: colorApp.colorFontblack),
                      ),
                      Text(
                        " عدد",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: colorApp.colorbgbutton2),
                      ),
                    ],
                  ),
                )),
                Expanded(
                    child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(width: 0.5, color: colorApp.colorFontblack),
                  ),
                  child: Text(
                    "أنابيب بي-آل-بي",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                )),
              ],
            ),
          ),
          BottonApp(
              width: double.infinity,
              title: "استلام الطلبية",
              color: colorApp.colorbgbutton2,
              func: () {})
        ],
      ),
    );
  }
}
