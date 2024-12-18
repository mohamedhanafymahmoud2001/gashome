import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class InputApp extends StatelessWidget {
  InputApp({
    super.key,
    required this.hint,
    required this.controler,
    required this.icon,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final Widget icon;
  final TextInputType keyboard;

  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          keyboardType: keyboard,
          controller: controler,
          decoration: InputDecoration(
              prefixIcon: icon,
              hintText: hint,
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: colorApp.colorborder),
                  borderRadius: BorderRadius.circular(10))),
        ),
      );
    });
  }
}

class InputAppPass extends StatelessWidget {
  InputAppPass({
    super.key,
    required this.hint,
    required this.show,
    required this.controler,
    required this.icon,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final Widget icon;
  final bool show;
  final TextInputType keyboard;

  ColorApp colorsApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          obscureText: show,
          keyboardType: keyboard,
          controller: controler,
          decoration: InputDecoration(
              prefixIcon: icon,
              hintText: hint,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
      );
    });
  }
}

class InputCode extends StatelessWidget {
  InputCode({
    super.key,
    required this.hint,
    required this.controler,
    required this.keyboard,
  });
  final TextEditingController controler;
  final String hint;
  final TextInputType keyboard;

  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return val.languagebox.get("language") == "en" ? "empty" : "فارغ";
            }
            return null;
          },
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          maxLength: 1,
          textAlign: TextAlign.center,
          keyboardType: keyboard,
          controller: controler,
          decoration: InputDecoration(
              hintText: hint,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
      );
    });
  }
}
