import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class Langoage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Langoage();
  }
}

class _Langoage extends State<Langoage> {
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Image.asset("assets/images/langoage.png"),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Consumer<Control>(builder: (context, val, child) {
                  return ListTile(
                    title: Text("العربية"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      val.choseLanguage("ar");
                      Navigator.of(context)
                          .pushNamed("authentcation");
                    },
                  );
                })),
            Card(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Consumer<Control>(builder: (context, val, child) {
                  return ListTile(
                    title: Text("ُEnglish"),
                    trailing: Icon(Icons.keyboard_arrow_right),
                    onTap: () {
                      val.choseLanguage("en");
                    },
                  );
                })),
          ],
        ),
      ),
    );
  }
}
