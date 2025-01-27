import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';

class BottonAuthentcation extends StatelessWidget {
  BottonAuthentcation(
      {super.key,
      required this.title,
      required this.color,
      required this.colorfont,
      required this.func});
  final String title;
  final Color color;
  final Color colorfont;
  final VoidCallback func;
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: func,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: colorApp.colorborder, width: 1)),
        child: Text(
          "$title",
          style: TextStyle(color: colorfont, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class BottonApp extends StatelessWidget {
  BottonApp({
    super.key,
    required this.title,
    required this.color,
    required this.func,
    required this.width,
  });
  final String title;
  final Color color;
  final VoidCallback func;
  final double width;
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 51,
            width: width,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorApp.colorborder, width: 1)),
          ),
          Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
                color: colorApp.colorbody,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(100))),
          ),
          MaterialButton(
            onPressed: func,
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: width,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.0),
                // borderRadius: BorderRadius.circular(10),
                // border: Border.all(color: colorApp.colorborder, width: 1)
              ),
              child: Text(
                textAlign:  TextAlign.center,
                "$title",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottonHome extends StatelessWidget {
  BottonHome(
      {super.key,
      required this.title,
      required this.color,
      required this.colorfont,
      required this.func});
  final String title;
  final Color color;
  final Color colorfont;
  final VoidCallback func;
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 0),
      onPressed: func,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 7),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
            border: Border.all(color: colorApp.colorbgbutton2, width: 1)),
        child: Text(
          "$title",
          style: TextStyle(color: colorfont, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class BottonRservOrder extends StatelessWidget {
  BottonRservOrder({
    super.key,
    required this.title,
    required this.color,
    required this.colorfont,
    required this.func,
    required this.active,
  });
  final String title;
  final Color color;
  final Color colorfont;
  final VoidCallback func;
  final bool active;
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(5),
      onPressed: func,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 7),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
                color: active == true
                    ? colorApp.colorborder
                    : colorApp.colorbgbutton1,
                width: active == true ? 0 : 1)),
        child: Text(
          "$title",
          style: TextStyle(color: colorfont, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
