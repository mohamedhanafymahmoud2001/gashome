import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/bottomNavigationBar.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/home/prodect.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  DialogApp dialogApp = new DialogApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
          return val.homeCatogery==null?Center(child: CircularProgressIndicator()): val.homeCatogery['message']!="All Categories"?Center(
                      child: Image.asset("assets/images/nodata.png"),
                    ): Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 200,
                    
                      decoration: BoxDecoration(
                        
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/images/panner.jpg",fit: BoxFit.contain,)
                        )
                        ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: val.homeCatogery['data'].length,
                      itemBuilder: (context, i) {
                        return BottonHome(
                            title: "${val.homeCatogery['data'][i]['name']}",
                            color:val.choseCatogery==i? colorApp.colorbgbutton2:colorApp.colorFontwhite,
                            colorfont:val.choseCatogery==i? colorApp.colorbgbutton1:colorApp.colorFontblack,
                            func: () {
                              val.ChoseCatogery(i);
                              val.HomeUser(val.homeCatogery['data'][i]['id']);
                            });
                      },
                    ),
                  ),
                  val.homeUser==null?CircularProgressIndicator():val.homeUser['message']!='All Products'?Center(
                      child: Image.asset("assets/images/nodata.png"),
                    ) :Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(3),
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns
                          crossAxisSpacing: 10, // Space between columns
                          mainAxisSpacing: 10, // Space between rows
                          childAspectRatio:
                              0.47, // نسبة العرض إلى الطول، وهنا 1:2 (أي الطول ضعف العرض)
                        ),
                        itemCount: val.homeUser['data'].length,
                        itemBuilder: (context, i) {
                          return Prodect(data:  val.homeUser['data'][i],i:i);
                        }),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
