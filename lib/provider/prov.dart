import 'dart:async';
import 'dart:ffi';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:gazhome/provider/api.dart';
import 'package:gazhome/view/home/home.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:url_launcher/url_launcher.dart';

class Control extends ChangeNotifier {
/////User
  var checkAll = null;
  Api api = new Api();
  late Box languagebox = Hive.box("language");
  choseLanguage(String lan) {
    languagebox.put("language", "$lan");
    print(languagebox.get("language"));
    notifyListeners();
  }

  String authentication = "signin";
  switchAuthentcation(String value) {
    authentication = value;
    notifyListeners();
  }

  int screen = 3;
  switchBottomNavigatorBar(int val) {
    screen = val;
    if (val == 3) {
      ChoseCatogery(0);
      HomeCatogery();
      CountNoti();
    } else if (val == 2) {
      CartUser();
      Address();
      CountNoti();
    } else if (val == 1) {
      AllOrders();
      CountNoti();
    }
    notifyListeners();
  }

  double sliderValue = 30.0;
  int screenBoard = 1;
  switchboard() {
    screenBoard += 1;
    sliderValue += 30.0;
    notifyListeners();
  }

  List<Map<String, String>> orderStages = [
    {'ar': 'تجهيز الطلب', 'en': 'Request processing'},
    {'ar': 'التوصيل', 'en': 'delivery'},
    {'ar': 'استلام الطلبية', 'en': 'Receipt of order'}
  ];
  //register user
  var registerUser;
  late Box tokenregister_user = Hive.box("tokenregister");
  Future RegisterUser() async {
    registerUser = null;
    checkAll = null;
    registerUser = await api.RegisterUser();
    if (registerUser != null) {
      if (registerUser['message'] == "User Created and SMS Sent Successfully") {
        tokenregister_user.put("tokenregister", registerUser['data']["token"]);
      }
    }
    checkAll = registerUser;
    print("register $registerUser");
    print("register $registerUser");
    print("register $registerUser");
    notifyListeners();
  }

  var codeEmailUser;
  Future CodeEmailUser() async {
    codeEmailUser = null;
    checkAll = null;
    codeEmailUser =
        await api.CodeEmailUser(tokenregister_user.get("tokenregister"));
    checkAll = codeEmailUser;
    print("register $codeEmailUser");
    print("register $codeEmailUser");
    print("register $registerUser");
    notifyListeners();
  }

  late Box first_name_user = Hive.box("first_name_user");
  late Box last_name_user = Hive.box("last_name_user");
  late Box id_user = Hive.box("id_user");
  late Box phone_number_user = Hive.box("phone_number_user");
  late Box token_user = Hive.box("token_user");

  late Box type_user = Hive.box("type_user");

  late Box name_driver = Hive.box("name_driver");
  late Box phone_number_driver = Hive.box("phone_number_driver");
  late Box image_driver = Hive.box("image_driver");
  late Box license_number_driver = Hive.box("license_number_driver");
  late Box vehicle_license_driver = Hive.box("vehicle_license_driver");
  late Box vehicle_number_driver = Hive.box("vehicle_number_driver");
  late Box address_driver = Hive.box("address_driver");
  late Box token_driver = Hive.box("token_driver");
  var fbm = FirebaseMessaging.instance;
  String tokendevice = '';
  GetTokenDevice() async {
    await fbm.requestPermission();
    fbm.getToken().then((value) {
      tokendevice = value!;
      print("token== $value");
      print("token== $value");
      print("token== $value");
    });
    notifyListeners();
  }

  bool passshow1 = true;
  bool passshow2 = true;
  bool passshow3 = true;
  PassShow1() {
    passshow1 = !passshow1;
    notifyListeners();
  }

  PassShow2() {
    passshow2 = !passshow2;
    notifyListeners();
  }

  PassShow3() {
    passshow3 = !passshow3;
    notifyListeners();
  }

  var loginUser;
  Future LoginUser() async {
    checkAll = null;
    loginUser = null;
    loginUser = await api.LoginUser(tokendevice);
    if (loginUser != null) {
      if (loginUser['message'] == "User Logged In Successfully") {
        first_name_user.put(
            'first_name_user', '${loginUser['data']['first_name']}');
        last_name_user.put(
            'last_name_user', '${loginUser['data']['last_name']}');
        id_user.put('id_user', '${loginUser['data']['id']}');
        phone_number_user.put(
            'phone_number_user', '${loginUser['data']['phone_number']}');
        first_name_user.put(
            'first_name_user', '${loginUser['data']['first_name']}');
        token_user.put('token_user', '${loginUser['data']['token']}');
        type_user.put("type_user", "user");
        print(first_name_user.get("first_name_user"));
        print(token_user.get("token_user"));
      } else if (loginUser['message'] == "Driver Logged In Successfully") {
        name_driver.put('name_driver', '${loginUser['data']['name']}');
        phone_number_driver.put(
            'phone_number', '${loginUser['data']['phone_number']}');
        image_driver.put('image_driver', '${loginUser['data']['image']}');
        license_number_driver.put(
            'license_number_driver', '${loginUser['data']['license_number']}');
        vehicle_license_driver.put('vehicle_license_driver',
            '${loginUser['data']['vehicle_license']}');
        vehicle_number_driver.put(
            'vehicle_numer_driver', '${loginUser['data']['vehicle_number']}');
        address_driver.put('address_driver', '${loginUser['data']['address']}');
        token_driver.put('token_driver', '${loginUser['data']['token']}');
        type_user.put("type_user", "driver");
      }
    }
    checkAll = loginUser;
    print("login $loginUser");
    print("login $loginUser");
    print("login $loginUser");
    notifyListeners();
  }

  int choseCatogery = 0;
  ChoseCatogery(int val) {
    choseCatogery = val;
    notifyListeners();
  }

  var homeUser;
  Future HomeUser(int id) async {
    homeUser = null;
    homeUser = await api.HomeUser(
        id, token_user.get("token_user"), languagebox.get("language"));
    if (homeUser != null) {
      if (homeUser['message'] == 'All Products') {
        for (var user in homeUser['data']) {
          user['number'] = 1;
        }
      }
    }

    print("home $homeUser");
    print("home $homeUser");
    print("home $homeUser");
    notifyListeners();
  }

  increazeProdect(int i) {
    homeUser['data'][i]['number'] = homeUser['data'][i]['number'] + 1;
    notifyListeners();
  }

  decreazeProdect(int i) {
    if (homeUser['data'][i]['number'] != 1) {
      homeUser['data'][i]['number'] = homeUser['data'][i]['number'] - 1;
    }
    notifyListeners();
  }

  var homeCatogery;
  Future HomeCatogery() async {
    homeCatogery = null;
    homeCatogery = await api.HomeCatogery(
        token_user.get("token_user"),
        languagebox.get(
            "language")); //token_user.get("token_user"),languagebox.get("language")
    print("home $homeUser");
    print("home $homeUser");
    print("home $homeUser");
    if (homeCatogery != null) {
      if (homeCatogery['message'] == "All Categories") {
        HomeUser(homeCatogery['data'][0]['id']);
      }
    }
    notifyListeners();
  }

  var addtoCart = null;
  Future AddToCart(int i) async {
    addtoCart = null;
    checkAll = null;
    print(token_user.get("token_user"));
    print(homeUser['data'][i]['id']);
    print(homeUser['data'][i]['number']);
    addtoCart = await api.AddToCart(token_user.get("token_user"),
        homeUser['data'][i]['id'], homeUser['data'][i]['number']);

    checkAll = addtoCart;
    print("addtoCart $addtoCart");
    print("addtoCart $addtoCart");
    notifyListeners();
  }

  var cartUser = null;
  Future CartUser() async {
    cartUser = null;
    cartUser = await api.CartUser(
        token_user.get("token_user"),
        languagebox.get(
            "language")); //token_user.get("token_user"),languagebox.get("language")
    print("cartUser $cartUser");
    print("cartUser $cartUser");
    print("cartUser $cartUser");
    notifyListeners();
  }

  var increezeCart = null;

  increazeCart(int i) async {
    increezeCart = null;
    cartUser['data'][i]['quantity_in_cart'] =
        cartUser['data'][i]['quantity_in_cart'] + 1;
    cartUser['data'][i]['total_price'] =
        cartUser['data'][i]['total_price'] + cartUser['data'][i]['price'];
    cartUser['data'][cartUser['data'].length - 1]['total_cost'] =
        cartUser['data'][cartUser['data'].length - 1]['total_cost'] +
            cartUser['data'][i]['price'];
    print(
        "totalCost : ${cartUser['data'][cartUser['data'].length - 1]['total_cost']}");
    increezeCart = await api.IncreezeCart(
        token_user.get("token_user"), cartUser['data'][i]['id'], 1);
    if (increezeCart != null) {
      if (increezeCart['message'] != "Quantity Increased") {
        cartUser['data'][i]['quantity_in_cart'] =
            cartUser['data'][i]['quantity_in_cart'] - 1;
        cartUser['data'][i]['total_price'] =
            cartUser['data'][i]['total_price'] - cartUser['data'][i]['price'];
        cartUser['data'][cartUser['data'].length - 1]['total_cost'] =
            cartUser['data'][cartUser['data'].length - 1]['total_cost'] -
                cartUser['data'][i]['price'];
      }
    } else {
      cartUser['data'][i]['quantity_in_cart'] =
          cartUser['data'][i]['quantity_in_cart'] - 1;
      cartUser['data'][i]['total_price'] =
          cartUser['data'][i]['total_price'] - cartUser['data'][i]['price'];
      cartUser['data'][cartUser['data'].length - 1]['total_cost'] =
          cartUser['data'][cartUser['data'].length - 1]['total_cost'] -
              cartUser['data'][i]['price'];
    }
    notifyListeners();
  }

  var decreezeCart = null;
  decreazeCart(int i) async {
    decreezeCart = null;
    if (cartUser['data'][i]['quantity_in_cart'] != 1) {
      cartUser['data'][i]['quantity_in_cart'] =
          cartUser['data'][i]['quantity_in_cart'] - 1;
      cartUser['data'][i]['total_price'] =
          cartUser['data'][i]['total_price'] - cartUser['data'][i]['price'];
      cartUser['data'][cartUser['data'].length1]['total_cost'] =
          cartUser['data'][cartUser['data'].length - 1]['total_cost'] -
              cartUser['data'][i]['price'];
      decreezeCart = await api.IncreezeCart(
          token_user.get("token_user"), cartUser['data'][i]['id'], -1);
      if (increezeCart != null) {
        if (increezeCart['message'] != "Quantity Increased") {
          cartUser['data'][i]['quantity_in_cart'] =
              cartUser['data'][i]['quantity_in_cart'] + 1;
          cartUser['data'][i]['total_price'] =
              cartUser['data'][i]['total_price'] + cartUser['data'][i]['price'];
          cartUser['data'][cartUser['data'].length - 1]['total_cost'] =
              cartUser['data'][cartUser['data'].length - 1]['total_cost'] +
                  cartUser['data'][i]['price'];
        }
      } else {
        cartUser['data'][i]['quantity_in_cart'] =
            cartUser['data'][i]['quantity_in_cart'] + 1;
        cartUser['data'][i]['total_price'] =
            cartUser['data'][i]['total_price'] + cartUser['data'][i]['price'];
        cartUser['data'][cartUser['data'].length - 1]['total_cost'] =
            cartUser['data'][cartUser['data'].length - 1]['total_cost'] +
                cartUser['data'][i]['price'];
      }
    }
    notifyListeners();
  }

  var removeCart = null;
  Future RemoveCart(int i) async {
    removeCart = null;
    checkAll = null;
    removeCart = await api.RemoveCart(token_user.get("token_user"),
        cartUser['data'][i]['id'], cartUser['data'][i]['quantity_in_cart']);
    checkAll = removeCart;
    CartUser();
    print("removeCart $removeCart");
    print("removeCart $removeCart");
    notifyListeners();
  }

////////////////////////////////////////////////////////////////////////location
  double lat = 0.0;
  double long = 0.0;

  Position? cl;
  Future getPosion() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    print(services);
    per = await Geolocator.checkPermission();
    print(per);
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.whileInUse) {
        cl = await getLatAndLong();
        print(cl!.latitude);
        getDetailsLocation(cl!.latitude, cl!.longitude);
        long = cl!.longitude;
        lat = cl!.latitude;
      }else if (per == LocationPermission.always) {
        cl = await getLatAndLong();
        print(cl!.latitude);
        getDetailsLocation(cl!.latitude, cl!.longitude);
        long = cl!.longitude;
        lat = cl!.latitude;
      }
    } else { 
      if (per == LocationPermission.whileInUse) {
        cl = await getLatAndLong();
        print(cl!.latitude);
        getDetailsLocation(cl!.latitude, cl!.longitude);
        long = cl!.longitude;
        lat = cl!.latitude;
        // setCustomMarker();
      }else if (per == LocationPermission.always) {
        cl = await getLatAndLong();
        print(cl!.latitude);
        getDetailsLocation(cl!.latitude, cl!.longitude);
        long = cl!.longitude;
        lat = cl!.latitude;
        // setCustomMarker();
      }
    }
  }

  Future<Position> getLatAndLong() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  CameraPosition kGooglePlex = new CameraPosition(
    target: LatLng(0.0, 0.0),
    zoom: 14.4746,
  );
  CameraPosition kGooglePlexUser = new CameraPosition(
    target: LatLng(0.0, 0.0),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  late GoogleMapController gmc;
  late Set<Marker> mymarker = {
    Marker(
        onTap: () {
          print("object");
        },
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(title: "mohamed Hanafy"),
        markerId: MarkerId("1"),
        position: LatLng(cl!.latitude, cl!.longitude)),

    //
    // Marker  (
    // onTap: () {
    //   print("object");
    // },
    // draggable: true,
    // onDragEnd: (value) {
    //   print(value);
    // },
    // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    // // icon:await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,"assets/images/accept.png"),
    // infoWindow: InfoWindow(title: "saif Hanafy"),
    // markerId: MarkerId("2"),
    // position: LatLng(cl!.latitude+10, cl!.longitude+10))
  };

  // Future<void> setCustomMarker() async {
  //   mymarker.add(Marker  (
  //       onTap: () {
  //         print("object");
  //       },
  //       draggable: true,
  //       onDragEnd: (value) {
  //         print(value);
  //       },
  //       // icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //       icon:await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,"assets/images/seccess.png"),
  //       infoWindow: InfoWindow(title: "saif Hanafy"),
  //       markerId: MarkerId("2"),
  //       position: LatLng(10, 10)));
  // }

  List<Placemark> placemarks = [];
  Future getDetailsLocation(double lat, double long) async {
    placemarks = await placemarkFromCoordinates(lat, long);
    print(placemarks[0]);
    kGooglePlexUser = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    if (placemarks.isNotEmpty) {
      addDetailsToInput();
    }
    notifyListeners();
  }

  addDetailsToInput() {
    api.city.text = placemarks[0].administrativeArea ?? "";
    api.neighbor.text = placemarks[0].subAdministrativeArea ?? "";
    // api.street.text = placemarks[0].street ??"";
    notifyListeners();
  }

  pinMarcker(double lat, double long) async {
    mymarker = {
      Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          infoWindow: InfoWindow(title: "mohamed Hanafy"),
          markerId: MarkerId("1"),
          position: LatLng(lat, long)),
    };
    getDetailsLocation(lat, long);
    notifyListeners();
  }

  late StreamSubscription<Position> ps;
  getLifeLocation() {
    print("start");
    ps = Geolocator.getPositionStream().listen((Position? position) {
      print("work");
      print(position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
      mymarkerdriver = {
        Marker(
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            infoWindow: InfoWindow(title: "${name_driver.get("name_driver")}"),
            markerId: MarkerId("4"),
            position: LatLng(position!.latitude, position.longitude)),
        Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange),
            infoWindow: InfoWindow(title: "$nameclient"),
            markerId: MarkerId("3"),
            position: LatLng(latclient, longclient))
      };
      notifyListeners();
    });
    print("end");
    notifyListeners();
  }

 

  String nameclient = "";
  double latclient = 0.0;
  double longclient = 0.0;

  setdata(double lat, double long, String name) {
    latclient = lat;
    longclient = long;
    nameclient = name;
    mymarkerdriver = {
      Marker(
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          infoWindow: InfoWindow(title: "$nameclient"),
          markerId: MarkerId("3"),
          position: LatLng(longclient, lat))
    };
    kGooglePlex = CameraPosition(
      target: LatLng(latclient, longclient),
      zoom: 14.4746,
    );
    notifyListeners();
  }

  late Set<Marker> mymarkerdriver = {
    Marker(
        onTap: () {
          print("object");
        },
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(title: "$nameclient"),
        markerId: MarkerId("3"),
        position: LatLng(cl!.latitude , cl!.longitude)),

    //
    Marker(
        onTap: () {
          print("object");
        },
        draggable: true,
        onDragEnd: (value) {
          print(value);
        },
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        // icon:await BitmapDescriptor.fromAssetImage(ImageConfiguration.empty,"assets/images/accept.png"),
        infoWindow: InfoWindow(title: "${name_driver.get("name_driver")}"),
        markerId: MarkerId("4"),
        position: LatLng(cl!.latitude + 0.0001, cl!.longitude + 0.001))
  };

  ////////

  int ScreenDriver = 3;
  changenavbardriver(int value) {
    ScreenDriver = value;
    if (value == 3) {
      AllRegions();
    } else if (value == 2) {
      MyOrders();
    }
    if (value == 1) {
      GetMyOrderss();
    }
    notifyListeners();
  }

  int area = 0;
  changeAreaDriver(int value) {
    area = value;
    RegionsOrders(allRegions['data'][value]['id']);
    notifyListeners();
  }

  var createOrder = null;
  CreateOrder() async {
    checkAll = null;
    createOrder = null;
    createOrder = await api.CreateOrder(token_user.get("token_user"));
    checkAll = createOrder;
    print(createOrder);
    print(createOrder);
    print(createOrder);
    notifyListeners();
  }

  var addlocation = null;
  addLocation() async {
    checkAll = null;
    addlocation = null;
    addlocation =
        await api.addLocation(token_user.get("token_user"), lat, long);
    checkAll = addlocation;
    print(addlocation);
    print(addlocation);
    print(addlocation);
    notifyListeners();
    if (addlocation != null) {
      Address();
    }
  }

  var address = null;
  List itemAdddress = [];
  Address() async {
    address = null;
    address = await api.Address(token_user.get("token_user"));
    notifyListeners();
  }

  String selectAddress = "";
  int idAddress = 0;
  SelectAddress(String valu, int id) {
    selectAddress = valu;
    idAddress = id;
    notifyListeners();
  }

  String selectedDate = "";
  selectDate(String valu) {
    selectedDate = valu;
    notifyListeners();
  }

  var completOrder = null;
  CompleteOrder() async {
    checkAll = null;
    completOrder = null;
    completOrder = await api.CompletOrder(
        token_user.get("token_user"), selectedDate, paymentMethode, idAddress);
    checkAll = completOrder;
    if (completOrder != null) {
      if (completOrder['message'] == "Payment Linke") {
        getLink(completOrder['data']);
      }
    }
    print(completOrder);
    print(completOrder);
    print(completOrder);
    notifyListeners();
  }

  call(String number) async {
    final Uri uri = Uri(
      scheme: 'tel',
      path: '$number',
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      print('error');
    }
  }

  var linkPay = null;
  getLink(String url) async {
    linkPay = null;
    linkPay = await api.getLink(url);
    print("linkPay$linkPay");
    print("linkPay$linkPay");
    print("linkPay$linkPay");
    notifyListeners();
  }

  String paymentMethode = "";
  PayMentMethod(String valu) {
    paymentMethode = valu;
    CompleteOrder();
    notifyListeners();
  }

  var allOrders = null;
  AllOrders() async {
    allOrders = null;
    allOrders = await api.AllOrders(
        token_user.get("token_user"), languagebox.get("language"));
    print(allOrders);
    print(allOrders);
    print(allOrders);
    notifyListeners();
  }

  var changepass1 = null;
  changePass1() async {
    changepass1 = null;
    checkAll=null;
    changepass1 = await api.changePass1();
    checkAll=changepass1;
    notifyListeners();
  }

  var changepass2 = null;
  String newToken="";
  changePass2() async {
    changepass2= null;
    checkAll=null;
    changepass2 = await api.changePass2();
    checkAll=changepass2;
    if(changepass2!=null){
      if(changepass2['message']=="Code confirmed successfully."){
        newToken=changepass2['data']["token"];

      }
    }
    notifyListeners();
  }

  var changepass3 = null;
  changePass3() async {
    changepass3= null;
    checkAll=null;
    changepass3 = await api.changePass3(newToken);
    checkAll=changepass3;
    
    notifyListeners();
  }

//////////////////////////////////////////////////////////
////driver
  ///
  ///
  var allRegions;
  Future AllRegions() async {
    allRegions = null;
    allRegions = await api.AllRegions(
        token_driver.get("token_driver"), languagebox.get("language"));
    if (allRegions != null) {
      if (allRegions['message'] == 'Regions fetched successfully' &&
          allRegions['data'] != []) {
        RegionsOrders(allRegions['data'][area]['id']);
      }
    }

    print("allRegions $allRegions");
    print("allRegions $allRegions");
    print("allRegions $allRegions");
    notifyListeners();
  }

  var regionsOrders;
  Future RegionsOrders(int id) async {
    regionsOrders = null;
    regionsOrders = await api.RegionsOrders(
        id, token_driver.get("token_driver"), languagebox.get("language"));
    print("regionsOrders $regionsOrders");
    print("regionsOrders $regionsOrders");
    print("regionsOrders $regionsOrders");
    notifyListeners();
  }

  var myOrders;
  Future MyOrders() async {
    myOrders = null;
    myOrders = await api.MyOrders(
        token_driver.get("token_driver"), languagebox.get("language"));
    print("myOrders $myOrders");
    print("myOrders $myOrders");
    print("myOrders $myOrders");
    notifyListeners();
  }

  var getOrder;
  Future GetOrders(int id) async {
    getOrder = null;
    checkAll = null;
    getOrder = await api.GetOrder(token_driver.get("token_driver"), id);
    if (getOrder != null) {
      if (getOrder['message'] == "Order assigned to driver successfully") {
        RegionsOrders(allRegions['data'][area]['id']);
      }
    }
    checkAll = getOrder;
    print("getOrder $getOrder");
    print("getOrder $getOrder");
    print("getOrder $getOrder");
    notifyListeners();
  }
  
  //"هل رفض العميل استلام الطلبية"
  var cancelOrder;
  Future CancelOrder(int id) async {
    cancelOrder = null;
    checkAll = null;
    cancelOrder = await api.CancelOrder(token_driver.get("token_driver"), id);
    if (cancelOrder != null) {                
      if (cancelOrder['message'] == "Order cancelled") {
        MyOrders();
      }
    }
    checkAll = cancelOrder;
    print("cancelOrder $cancelOrder");
    print("cancelOrder $cancelOrder");
    print("cancelOrder $cancelOrder");
    notifyListeners();
  }

  var deleteOrder;
  Future DeleteOrder(int id) async {
     //السائق يريد عدم توصل الطبية
    deleteOrder = null;
    checkAll = null;
    deleteOrder = await api.DeleteOrder(token_driver.get("token_driver"), id);
    if (deleteOrder != null) {
      if (deleteOrder['message'] == "Order Rejected Successfully") {
        MyOrders();
      }
    }
    checkAll = deleteOrder;
    print("deleteOrder $deleteOrder");
    print("deleteOrder $deleteOrder");
    print("deleteOrder $deleteOrder");
    notifyListeners();
  }

  var endOrder;
  Future EndOrder(int id) async {
    endOrder = null;
    checkAll = null;
    endOrder = await api.EndOrder(token_driver.get("token_driver"), id);
    if (endOrder != null) {
      if (endOrder['message'] == "Order delivered") {
        MyOrders();
      }
    }
    checkAll = endOrder;
    print("endOrder $endOrder");
    print("endOrder $endOrder");
    print("endOrder $endOrder");
    notifyListeners();
  }

  var completeOrdersDrivers;
  Future CompleteOrdersDrivers(int id) async {
    completeOrdersDrivers = null;
    completeOrdersDrivers = await api.CompleteOrdersDrivers(
        token_driver.get("token_driver"), languagebox.get("language"));
    print("completeOrdersDrivers $completeOrdersDrivers");
    print("completeOrdersDrivers $completeOrdersDrivers");
    print("completeOrdersDrivers $completeOrdersDrivers");
    notifyListeners();
  }

  var getMyOrders;
  Future GetMyOrderss() async {
    getMyOrders = null;
    getMyOrders = await api.GetMyOrders(token_driver.get("token_driver"));
    print("getMyOrders $getMyOrders");
    print("getMyOrders $getMyOrders");
    print("getMyOrders $getMyOrders");
    notifyListeners();
  } 
  
  var noti;
  Future Noti() async {
    noti = null;
    noti = await api.Noti(int.parse(id_user.get("id_user")));
    CountNoti();
    print("noti $noti");
    print("noti $noti");
    print("noti $noti");
    notifyListeners();
  } 
  
  var countnoti;
  Future CountNoti() async {
    countnoti = null;
    countnoti = await api.CountNoti(int.parse(id_user.get("id_user")));
    print("countnoti $countnoti");
    print("countnoti $countnoti");
    print("countnoti $countnoti");
    notifyListeners();
  }
}
