import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gazhome/provider/api.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Control extends ChangeNotifier {
/////User
  Api api = new Api();
  late Box languagebox = Hive.box("language");
  choseLanguage(String lan) {
    languagebox.put("language", "$lan");
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
    notifyListeners();
  }

  double sliderValue = 30.0;
  int screenBoard = 1;
  switchboard() {
    screenBoard += 1;
    sliderValue += 30.0;
    notifyListeners();
  }

  //register user
  var registerUser;
  Future RegisterUser() async {
    registerUser = null;
    registerUser = await api.RegisterUser();
    print("register $registerUser");
    print("register $registerUser");
    print("register $registerUser");
    notifyListeners();
  }

  var loginUser;
  Future LoginUser() async {
    loginUser = null;
    loginUser = await api.LoginUser();
    print("login $loginUser");
    print("login $loginUser");
    print("login $loginUser");
    notifyListeners();
  }

  var homeUser;
  Future HomeUser() async {
    homeUser = null;
    homeUser = await api.HomeUser();
    print("home $homeUser");
    print("home $homeUser");
    print("home $homeUser");
    notifyListeners();
  }

  var homeUserWithOutCatogery;
  Future HomeUserWithOutCatogery() async {
    homeUserWithOutCatogery = null;
    homeUserWithOutCatogery = await api.HomeUser();
    print("home $homeUser");
    print("home $homeUser");
    print("home $homeUser");
    notifyListeners();
  }

//////////////////////////////////////////////////////////////////////  //location
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
      }
    } else {
      if (per == LocationPermission.whileInUse) {
        cl = await getLatAndLong();
        print(cl!.latitude);
        getDetailsLocation(cl!.latitude, cl!.longitude);
        // setCustomMarker();
      }
    }
  }

  Future<Position> getLatAndLong() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  List<Placemark> placemarks = [];
  CameraPosition kGooglePlex = new CameraPosition(
    target: LatLng(0.0, 0.0),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> controller = Completer<GoogleMapController>();
  late GoogleMapController gmc;
  late Set<Marker> mymarker = {
    Marker  (
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
  Future getDetailsLocation(double lat, double long) async {
    placemarks = await placemarkFromCoordinates(lat, long);
    print(placemarks[0]);
    kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.4746,
    );
    notifyListeners();
  }

  pinMarcker(double lat,double long) async {
    mymarker = {
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(title: "mohamed Hanafy"),
        markerId: MarkerId("1"), position: LatLng(lat, long))
    };
    notifyListeners();
  }

  late StreamSubscription<Position> ps;
  getLifeLocation() {
    ps= Geolocator.getPositionStream().listen(
    (Position? position) {
        print(position == null ? 'Unknown' : '${position.latitude.toString()}, ${position.longitude.toString()}');
        mymarker = {
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        infoWindow: InfoWindow(title: "mohamed Hanafy"),
        markerId: MarkerId("1"), position: LatLng(position!.latitude, position.longitude))
    };
    notifyListeners();
    });
  }
//////////////////////////////////////////////////////////
////driver
  int ScreenDriver = 3;
  changenavbardriver(int value) {
    ScreenDriver = value;
    notifyListeners();
  }

  int area = 0;
  changeAreaDriver(int value) {
    area = value;
    notifyListeners();
  }
}
