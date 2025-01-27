import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class Api {
  String ip = "https://gazhome.sa/GasProject/public";
  String imageDomain = "https://gazhome.sa/GasProject/public";
  String imagedomain2 = "https://gazhome.sa/GasProject/public/storage/";
  TextEditingController phoneSignin = TextEditingController();
  TextEditingController passSignin = TextEditingController();

  var loginUser;
  Future LoginUser(String tokendevice) async {
    loginUser = null;
    String uri = "$ip/api/user/login";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "phone_number": "+966${phoneSignin.text}",
        "password": "+966${passSignin.text}",
        "fcm_token": tokendevice,
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
        "phone_number": "+966${phoneSignUp.text}",
        "password": "+966${passSignUp.text}",
        "password_confirmation": "+966${confirmPassSignUp.text}"
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
  Future CodeEmailUser(String tok) async {
    codeEmailUser = null;
    String uri = "$ip/api/user/verify-code";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "code": "${code1.text}${code2.text}${code3.text}${code4.text}"
      }, headers: {
        "Accept": "application/json",
        "Authorization":
            "$tok"
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
  Future HomeUser(int id, String token, String lang) async {
    homeUser = null;
    String url = "$ip/api/user/products/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': '$token',
          'Accept-Language': '$lang'
        },
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

  var homeCatogery = null;
  Future HomeCatogery(String token, String lang) async {
    //String token_user,String lan
    homeCatogery = null;
    String url = "$ip/api/user/categories";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': '$token',
          'Accept-Language': '$lang'
        }, //,'Authorization':'$token_user','Accept-Language':'$lan'
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        homeCatogery = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return homeCatogery;
  }

  var addtoCart;
  Future AddToCart(String token, int product_id, int quantity) async {
    addtoCart = null;
    String uri = "$ip/api/user/add-to-cart";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "product_id": product_id.toString(),
        "quantity": quantity.toString(),
      }, headers: {
        "Accept": "application/json",
        "Authorization": "$token"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        addtoCart = responsbody;
      }
      print("addtocart: ${responsbody}");
    } catch (e) {
      print(e);
    }
    print("addtoCart $addtoCart");
    print("addtoCart $addtoCart");
    return addtoCart;
  }

  var cartUser = null;
  Future CartUser(String token, String lang) async {
    cartUser = null;
    String url = "$ip/api/user/cart";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': '$token',
          'Accept-Language': '$lang'
        },
      );
      if (response.statusCode == 200 && !response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        cartUser = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }
    return cartUser;
  }

  var removeCart;
  Future RemoveCart(String token, int product_id, int quantity) async {
    removeCart = null;
    String uri = "$ip/api/user/remove-from-cart";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "product_id": product_id.toString(),
        "quantity": quantity.toString(),
      }, headers: {
        "Accept": "application/json",
        "Authorization": "$token"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        removeCart = responsbody;
      }
      print("removeCart: ${responsbody}");
    } catch (e) {
      print(e);
    }
    print("removeCart $removeCart");
    print("removeCart $removeCart");
    return removeCart;
  }

  var increezeCart;
  Future IncreezeCart(String token, int product_id, int quantity) async {
    increezeCart = null;
    String uri = "$ip/api/user/increece-quntaty-for-product";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "product_id": product_id.toString(),
        "quantity": quantity.toString(),
      }, headers: {
        "Accept": "application/json",
        "Authorization": "$token"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        increezeCart = responsbody;
      }
      print("increezeCart: ${responsbody}");
    } catch (e) {
      print(e);
    }
    print("increezeCart $increezeCart");
    print("increezeCart $increezeCart");
    return increezeCart;
  }

  TextEditingController city = TextEditingController();
  TextEditingController neighbor = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController numberBuild = TextEditingController();
  var addlocation = null;
  Future addLocation(String token, double lat, double long) async {
    addlocation = null;
    String uri = "$ip/api/user/store-address";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "city": city.text,
        "state": neighbor.text,
        "street_name": street.text,
        "building_number": numberBuild.text,
        "status": "home",
        "latitude": lat.toString(),
        "longitude": long.toString()
      }, headers: {
        "Accept": "application/json",
        "Authorization": "$token"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        addlocation = responsbody;
      }
      print("addlocation: ${responsbody}");
    } catch (e) {
      print(e);
    }
    print("addlocation $addlocation");
    print("addlocation $addlocation");
    return addlocation;
  }

  var creatOrder = null;
  Future CreateOrder(String token) async {
    creatOrder = null;
    String url = "$ip/api/user/create-order";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': '$token',
        },
      );
      if (response.statusCode == 200 && !response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        creatOrder = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }
    return creatOrder;
  }

  var address = null;
  Future Address(String token) async {
    address = null;
    String url = "$ip/api/user/address";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': '$token',
        },
      );
      if (response.statusCode == 200 && !response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        address = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }
    return address;
  }

  var completOrder = null;
  // Future CompletOrder(String token, String delivery_date , String payment_method ,int address_id ) async {
  //   completOrder = null;
  //   String uri = "$ip/api/user/complete-order";
  //   try {
  //     var respons = await http.post(Uri.parse(uri), body: {
  //       "delivery_date": delivery_date,
  //       "payment_method": payment_method,
  //       "address_id": address_id.toString(),
  //     }, headers: {
  //       "Accept": "application/json",
  //       "Authorization": "$token"
  //     });
  //     var responsbody = jsonDecode(respons.body);
  //     if (responsbody.isNotEmpty) {
  //       completOrder = responsbody;
  //     }
  //     print("completOrder: ${responsbody}");
  //   } catch (e) {
  //     print("error == $e");
  //   }
  //   print("completOrder $completOrder");
  //   print("completOrder $completOrder");
  //   return completOrder;
  // }

  CompletOrder(String token, String delivery_date , String payment_method ,int address_id) async {
    completOrder = null;
    final dio = Dio();

    FormData formData = FormData.fromMap({
        "delivery_date": delivery_date,
        "payment_method": payment_method,
        "address_id": address_id.toString(),
    });
    // إرسال الطلب
    try {
      Response response = await dio.post(
        '$ip/api/user/complete-order', // رابط الخادم الخاص بك
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json',
            "Authorization": "$token",
            // 'User-Agent':
            //     'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'
          },
        ),
      );

      // التحقق من حالة الرد
      if (response.statusCode == 200 || response.statusCode == 201) {
        completOrder = jsonDecode(response.toString());
        print('تم إضافة السائق بنجاح: ${response.data}');
      } else {
        print('فشل في إضافة السائق: ${response.statusCode}');
        print('الرد من الخادم: ${response.data}');
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        // خطأ مع استجابة من الخادم
        print('خطأ من الخادم: ${dioError.response?.statusCode}');
        print('تفاصيل الخطأ: ${dioError.response?.data}');
        return dioError.response?.data;
      } else {
        // خطأ في الاتصال بالخادم
        print('فشل الاتصال بالخادم: ${dioError.message}');
      }
    } catch (e) {
      // لأي خطأ غير متوقع
      print('حدث خطأ غير متوقع: $e');
    }
    return completOrder;
  }
  
  Future<dynamic> getLink(String url) async {
    String responseBody;
  try {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200 && response.body.isNotEmpty) {
      String responseBody = response.body;

      // محاولة فك JSON
      try {
        var jsonResponse = jsonDecode(responseBody);
        print('تم فك JSON: $jsonResponse');
        print(jsonResponse['data']);
        return jsonResponse['data']; // إذا كان JSON
      } catch (e) {
        print('النص المستلم ليس JSON: $responseBody');
        return responseBody; // إذا كان نص عادي
      }
    } else {
      print('استجابة غير متوقعة: ${response.statusCode}');
    }
  } catch (e) {
    print('حدث خطأ: $e');
  }
  return null; // في حال الفشل
}


  var allOrders = null;
  Future AllOrders(String token,String lang) async {
    allOrders = null;
    String url = "$ip/api/user/all-orders";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': '$token',
          'Accept-Language':'$lang'
        },
      );
      if (response.statusCode == 200 && !response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        allOrders = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }
    return allOrders;
  }
  
  TextEditingController phonechangepass = TextEditingController();
  var changepass1=null;
  changePass1() async {
    changepass1 = null;
    final dio = Dio();

    FormData formData = FormData.fromMap({
        "phone_number": "+966${phonechangepass.text}",
    });
    // إرسال الطلب
    try {
      Response response = await dio.post(
        '$ip/api/user/send-code', // رابط الخادم الخاص بك
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json' 
          },
        ),
      );

      // التحقق من حالة الرد
      if (response.statusCode == 200 || response.statusCode == 201) {
        changepass1 = jsonDecode(response.toString());
        print('تم  ${response.data}');
      } else {
        print('فشل : ${response.statusCode}');
        print('الرد من الخادم: ${response.data}');
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        // خطأ مع استجابة من الخادم
        print('خطأ من الخادم: ${dioError.response?.statusCode}');
        print('تفاصيل الخطأ: ${dioError.response?.data}');
        return dioError.response?.data;
      } else {
        // خطأ في الاتصال بالخادم
        print('فشل الاتصال بالخادم: ${dioError.message}');
      }
    } catch (e) {
      // لأي خطأ غير متوقع
      print('حدث خطأ غير متوقع: $e');
    }
    return changepass1;
  }
  
  var changepass2=null;
  changePass2() async {
    changepass2 = null;
    final dio = Dio();

    FormData formData = FormData.fromMap({
        "phone_number": "+966${phonechangepass.text}",
        "code" : "${code1.text}${code2.text}${code3.text}${code4.text}"
    });
    // إرسال الطلب
    try {
      Response response = await dio.post(
        '$ip/api/user/confirmed-code', // رابط الخادم الخاص بك
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json' 
          },
        ),
      );

      // التحقق من حالة الرد
      if (response.statusCode == 200 || response.statusCode == 201) {
        changepass2 = jsonDecode(response.toString());
        print('تم  ${response.data}');
      } else {
        print('فشل : ${response.statusCode}');
        print('الرد من الخادم: ${response.data}');
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        // خطأ مع استجابة من الخادم
        print('خطأ من الخادم: ${dioError.response?.statusCode}');
        print('تفاصيل الخطأ: ${dioError.response?.data}');
        return dioError.response?.data;
      } else {
        // خطأ في الاتصال بالخادم
        print('فشل الاتصال بالخادم: ${dioError.message}');
      }
    } catch (e) {
      // لأي خطأ غير متوقع
      print('حدث خطأ غير متوقع: $e');
    }
    return changepass2;
  }
   TextEditingController newpass = TextEditingController();
  TextEditingController confirmnewpass = TextEditingController();
  var changepass3=null;
  changePass3(String token) async {
    changepass3 = null;
    final dio = Dio();

    FormData formData = FormData.fromMap({
        "password": "+966${newpass.text}",
        "password_confirmation" : "+966${confirmnewpass.text}"
    });
    // إرسال الطلب
    try {
      Response response = await dio.post(
        '$ip/api/user/reset-password', // رابط الخادم الخاص بك
        data: formData,
        options: Options(
          headers: {
            'Accept': 'application/json' ,
            'Authorization' : '$token'
          },
        ),
      );

      // التحقق من حالة الرد
      if (response.statusCode == 200 || response.statusCode == 201) {
        changepass3 = jsonDecode(response.toString());
        print('تم  ${response.data}');
      } else {
        print('فشل : ${response.statusCode}');
        print('الرد من الخادم: ${response.data}');
      }
    } on DioError catch (dioError) {
      if (dioError.response != null) {
        // خطأ مع استجابة من الخادم
        print('خطأ من الخادم: ${dioError.response?.statusCode}');
        print('تفاصيل الخطأ: ${dioError.response?.data}');
        return dioError.response?.data;
      } else {
        // خطأ في الاتصال بالخادم
        print('فشل الاتصال بالخادم: ${dioError.message}');
      }
    } catch (e) {
      // لأي خطأ غير متوقع
      print('حدث خطأ غير متوقع: $e');
    }
    return changepass3;
  }

 

  TextEditingController numbervisa = TextEditingController();
  TextEditingController codevisa = TextEditingController();
  TextEditingController datevisa = TextEditingController();


  //driver 

  var allRegions = null;
  Future AllRegions( String token, String lang) async {
    allRegions = null;
    String url = "$ip/api/driver/all-regions";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': '$token',
          'Accept-Language': '$lang'
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        allRegions = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return allRegions;
  }
  var regionsOrders = null;
  Future RegionsOrders( int id, String token, String lang) async {
    regionsOrders = null;
    String url = "$ip/api/driver/orders/$id";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': '$token',
          'Accept-Language': '$lang'
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        regionsOrders = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return regionsOrders;
  }
  
  var myOrders = null;
  Future MyOrders(String token, String lang) async {
    myOrders = null;
    String url = "$ip/api/driver/driver-orders";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': '$token',
          'Accept-Language': '$lang'
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        myOrders = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return myOrders;
  }

  var getOrder = null;
  Future GetOrder(String token, int order_id ) async {
    getOrder = null;
    String uri = "$ip/api/driver/get-order";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "order_id": "${order_id}",//order_id.toString,
      }, headers: {
        "Accept": "application/json",
        "Authorization": "$token"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        getOrder = responsbody;
      }
      print("getOrder: ${responsbody}");
    } catch (e) {
      print(e);
    }
    print("getOrder $getOrder");
    print("getOrder $getOrder");
    
    return getOrder;
  }
  
  //"هل رفض العميل استلام الطلبية"
  var cancelOrder = null;
  Future CancelOrder(String token, int order_id ) async {
    cancelOrder = null;
    String uri = "$ip/api/driver/cancel-order";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "order_id": "${order_id}",//order_id.toString,
      }, headers: {
        "Accept": "application/json",
        "Authorization": "$token"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        cancelOrder = responsbody;
      }
      print("cancelOrder: ${responsbody}");
    } catch (e) {
      print(e);
    }
    print("cancelOrder $cancelOrder");
    print("cancelOrder $cancelOrder");
    
    return cancelOrder;
  }
  
  var endOrder = null;
  Future EndOrder(String token, int order_id ) async {
    endOrder = null;
    String uri = "$ip/api/driver/update-payment";
    try {
      var respons = await http.post(Uri.parse(uri), body: {
        "order_id": "${order_id}",//order_id.toString,
      }, headers: {
        "Accept": "application/json",
        "Authorization": "$token"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        endOrder = responsbody;
      }
      print("endOrder: ${responsbody}");
    } catch (e) {
      print(e);
    }
    print("endOrder $endOrder");
    print("endOrder $endOrder");
    
    return endOrder;
  }
  
  var deleteOrder = null;
  Future DeleteOrder(String token, int order_id ) async {
    deleteOrder = null;
    String uri = "$ip/api/driver/reject-order/$order_id";
    try {
      var respons = await http.get(Uri.parse(uri), headers: {
        "Accept": "application/json",
        "Authorization": "$token"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        deleteOrder = responsbody;
      }
      print("deleteOrder: ${responsbody}");
    } catch (e) {
      print(e);
    }
    print("deleteOrder $deleteOrder");
    print("deleteOrder $deleteOrder");
    
    return deleteOrder;
  }


  var completeOrdersDrivers = null;
  Future CompleteOrdersDrivers(String token, String lang) async {
    completeOrdersDrivers = null;
    String url = "$ip/api/driver/orders-delivered";
    try {
      var response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': '$token',
          'Accept-Language': '$lang'
        },
      );
      if (!response.body.isEmpty) {
        var responsebody = jsonDecode(response.body);
        completeOrdersDrivers = responsebody;
        print(responsebody.length);
        print(responsebody.length);
        print(responsebody);
        print(responsebody);
      }
    } catch (e) {
      print(e);
    }

    return completeOrdersDrivers;
  }


  var getMyOrders = null;
  Future GetMyOrders(String token ) async {
    getMyOrders = null;
    String uri = "$ip/api/driver/orders-delivered";
    try {
      var respons = await http.get(Uri.parse(uri), headers: {
        "Accept": "application/json",
        "Authorization": "$token"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        getMyOrders = responsbody;
      }
      print("getOrder: ${responsbody}");
    } catch (e) {
      print(e);
    }
    print("getMyOrders $getMyOrders");
    print("getMyOrders $getMyOrders");
    
    return getMyOrders;
  }


  var logOut = null;
  Future LogOut(String token ) async {
    logOut = null;
    String uri = "$ip/api/driver/logout";
    try {
      var respons = await http.get(Uri.parse(uri), headers: {
        "Accept": "application/json",
        "Authorization": "$token"
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        logOut = responsbody;
      }
      print("getOrder: ${responsbody}");
    } catch (e) {
      print(e);
    }
    print("logOut $logOut");
    print("logOut $logOut");
    
    return logOut;
  }
  
  var noti = null;
  Future Noti(int id ) async {
    noti = null;
    String uri = "$ip/api/notifications/$id";
    try {
      var respons = await http.get(Uri.parse(uri), headers: {
        "Accept": "application/json",
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        noti = responsbody;
      }
      print("getOrder: ${responsbody}");
    } catch (e) {
      print(e);
    }
    print("noti $noti");
    print("noti $noti");
    
    return noti;
  }

  var countnoti = null;
  Future CountNoti(int id ) async {
    countnoti = null;
    String uri = "$ip/api/count-notification/$id";
    try {
      var respons = await http.get(Uri.parse(uri), headers: {
        "Accept": "application/json",
      });
      var responsbody = jsonDecode(respons.body);
      if (responsbody.isNotEmpty) {
        countnoti = responsbody;
      }
      print("getOrder: ${responsbody}");
    } catch (e) {
      print(e);
    }
    print("countnoti $countnoti");
    print("countnoti $countnoti");
    
    return countnoti;
  }
}
