import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  String ip = "https://mangamediaa.com/Gas/public";
  TextEditingController phoneSignin = TextEditingController();
  TextEditingController passSignin = TextEditingController();

  var loginUser;
  Future LoginUser() async {
    loginUser = null;
    String uri = "$ip/api/user/login";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "phone_number": phoneSignin.text,
        "password": passSignin.text,
      }, headers: {
        "Accept": "application/json"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        loginUser = responsbody;
      }
      print("login user : ${responsbody}");
    } catch (e) {
      print(e);
    }
    return loginUser;
  }

  //register user
  TextEditingController firstNameSignUp = TextEditingController();
  TextEditingController lastNameSignUp = TextEditingController();
  TextEditingController phoneSignUp = TextEditingController();
  TextEditingController passSignUp = TextEditingController();
  TextEditingController confirmPassSignUp = TextEditingController();
  var registerUser;
  Future RegisterUser() async {
    //User Created Successfully
    registerUser = null;
    String uri = "$ip/api/user/register";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "first_name": firstNameSignUp.text,
        "last_name": lastNameSignUp.text,
        "phone_number": phoneSignUp.text,
        "password": passSignUp.text,
        "password_confirmation": confirmPassSignUp.text
      }, headers: {
        "Accept": "application/json"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        registerUser = responsbody;
      }
      print("register user : ${responsbody}");
      print("register user : ${responsbody}");
      print("register user : ${responsbody}");
    } catch (e) {
      print(e);
    }
    return registerUser;
  }

  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();
  var codeEmailUser;
  Future CodeEmailUser() async {
    codeEmailUser = null;
    String uri = "$ip/api/user/verify-code";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "code": "${code1.text}${code2.text}${code3.text}${code4.text}"
      }, headers: {
        "Accept": "application/json",
        "Authorization":
            "1|72mVAeSOoSnjviKYSmKFoJRH8ZptTfk7b3q9QVBv96c01bf2token"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        codeEmailUser = responsbody;
      }
      print("code Email user : ${responsbody}");
      print("code Email user : ${responsbody}");
    } catch (e) {
      print(e);
    }
    return codeEmailUser;
  }

  var homeUser = null;
  Future HomeUser() async {
    homeUser = null;
    String url = "$ip/api/user/products/1";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        homeUser = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return homeUser;
  }
  var homeUserWithOutCatogery = null;
  Future HomeUserWithOutCatogery() async {
    homeUserWithOutCatogery = null;
    String url = "$ip/api/user/products";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        homeUserWithOutCatogery = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return homeUserWithOutCatogery;
  }

  TextEditingController phonechangepass = TextEditingController();

  TextEditingController newpass = TextEditingController();
  TextEditingController confirmnewpass = TextEditingController();

  TextEditingController city = TextEditingController();
  TextEditingController neighbor = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController numberBuild = TextEditingController();

  TextEditingController numbervisa = TextEditingController();
  TextEditingController codevisa = TextEditingController();
  TextEditingController datevisa = TextEditingController();
}
