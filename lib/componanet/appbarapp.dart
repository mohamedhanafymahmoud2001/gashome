import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class AppBarBack extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
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
        Expanded(child: SizedBox()),
        Container(
            height: 25,
            width: 120,
            // margin: EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset("assets/images/gazar.png"))
      ],
    );
  }
}

class AppBarApp extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 25,
            width: 120,
            child: Image.asset("assets/images/gazar.png")),
        Expanded(child: SizedBox()),
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorApp.colorborder, width: 1)),
          child: IconButton(
              onPressed: () {
              },
              icon: Icon(Icons.notifications)),
        ),
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorApp.colorborder, width: 1)),
          child: TextButton(
            onPressed: () {},
            child: Text("M"),
          ),
        ),
      ],
    );
  }
}
class AppBarAppDriver extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
        return  Row(
      children: [
        Container(
            height: 25,
            width: 120,
            child: Image.asset("assets/images/gazar.png")),
        Expanded(child: SizedBox()),
        
        Container(
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorApp.colorborder, width: 1)),
          child: TextButton(
            onPressed: () {
              val.changenavbardriver(1);
            },
            child: Text("A"),
          ),
        ),
      ],
    );});
  }
}
