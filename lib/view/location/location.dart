import 'package:flutter/material.dart';
import 'package:gazhome/componanet/appbarapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/componanet/dialogapp.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class Location extends StatefulWidget {
  //key google map == AIzaSyDR8GagcxyB0L7QNiST2A07mlHI_cEmNqs
  @override
  State<StatefulWidget> createState() {
    return _Location();
  }
}

class _Location extends State<Location> {
  void initState() {
    //TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Control>(context, listen: false).getPosion();
    });

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Provider.of<Control>(context, listen: false).getLifeLocation();
    // });
  }

  @override
  Widget build(BuildContext context) {
    ColorApp colorApp = new ColorApp();
    DialogApp dialogApp = new DialogApp();
    LangLocal langLocal = new LangLocal();
    return Consumer<Control>(builder: (context, val, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: AppBarBack(),
          backgroundColor: colorApp.colorbody,
        ),
        backgroundColor: colorApp.colorbody,
        body: val.kGooglePlexUser.target.latitude == 0.0
            ? Center(child: CircularProgressIndicator())
            : GoogleMap(
                mapType: MapType.hybrid,
                markers: val.mymarker,
                initialCameraPosition: val.kGooglePlexUser,
                onTap: (argument) {
                  val.pinMarcker(argument.latitude, argument.longitude);
                  val.long = argument.longitude;
                  val.lat = argument.latitude;
                  print("new location${val.lat}///${argument.latitude}");
                },
                onMapCreated: (GoogleMapController controller) {
                  // val.controller.complete(controller);
                  val.gmc = controller;
                  print(" loca${val.gmc}");
                },
              ),
        floatingActionButton: Container(
            alignment: Alignment.center,
            height: 50,
            decoration: BoxDecoration(
                color: colorApp.colorbgbuttonapp,
                borderRadius: BorderRadius.circular(10)),
            width: double.infinity,
            margin: EdgeInsets.only(left: 50, right: 50),
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () async {
                if (val.placemarks.isNotEmpty) {
                  Navigator.of(context).pushNamed("completlocation");
                  
                  // val.getPosion();
                }
                // LatLng latLng = LatLng(0.0, 0.0);
                // val.gmc.animateCamera(CameraUpdate.newLatLng(latLng));

                // var xy =
                //     await val.gmc.getLatLng(ScreenCoordinate(x: 10, y: 10));
                // print(xy);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${langLocal.langLocal['ok']['${val.languagebox.get("language")}']}",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: colorApp.colorFontwhite),
                  ),
                ],
              ),
            )),
      );
    });
  }
}
