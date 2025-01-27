import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/onboarding/board1.dart';
import 'package:gazhome/view/onboarding/board2.dart';
import 'package:gazhome/view/onboarding/board3.dart';
import 'package:provider/provider.dart';

class Board extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Board();
  }
}

class _Board extends State<Board> {
  ColorApp colorsApp = new ColorApp();
  LangLocal langLocal=new LangLocal();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorsApp.colorbody,
      body: Consumer<Control>(builder: (context, val, child) {
        return Container(
          child: Column(
        
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, right: 20, left: 20),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 0.0), // إخفاء النقطة
                    overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 0.0), // إزالة تأثير التفاعل
                  ),
                  child: Slider(
                    activeColor: colorsApp.colorbgbuttonapp,
                    value: val.sliderValue,
                    min: 0,
                    max: 90,
                    divisions: 90,
                    onChanged: (value) {},
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(5),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed("authentcation");
                    },
                    child: Text(
                      "${langLocal.langLocal['Skip']['${val.languagebox.get("language")}']}",//
                      style: TextStyle(
                        fontSize: 16,
                        color: colorsApp.colorFontblack,
                        fontWeight: FontWeight.w300,
                      ),
                    )),
              ),
              //////////
              Expanded(
                  child: Container(
                    alignment: Alignment.topCenter ,
                    child: AnimatedSwitcher(
                        duration: Duration(seconds: 1), // مدة الأنيميشن
                        transitionBuilder:
                            (Widget child, Animation<double> animation) {
                          return FadeTransition(
                              opacity: animation,
                              child: child); // أنيميشن التلاشي
                        },
                        child: val.screenBoard == 1
                            ? Board1()
                            : val.screenBoard == 2
                                ? Board2()
                                : Board3()),
                  )),
              //////////
              Container(
                margin: EdgeInsets.all(10),
                child: BottonApp(
                    title: "${langLocal.langLocal['Next']['${val.languagebox.get("language")}']}",
                    color: colorsApp.colorbgbuttonapp,
                    width: 150,
                    func: () {
                      if (val.screenBoard < 3) {
                        val.switchboard();
                      } else {
                        Navigator.of(context).pushReplacementNamed("authentcation");
                      }
                    }),
              )
            ],
          ),
        );
      }),
    );
  }
}
