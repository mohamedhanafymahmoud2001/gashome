import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:gazhome/view/account/acount.dart';
import 'package:gazhome/view/authentcation/authentcation.dart';
import 'package:gazhome/view/authentcation/changepass1.dart';
import 'package:gazhome/view/authentcation/changepass2.dart';
import 'package:gazhome/view/authentcation/changepass3.dart';
import 'package:gazhome/view/authentcation/codeauthentication.dart';
import 'package:gazhome/view/cart/cart.dart';
import 'package:gazhome/view/cart/completeorder.dart';
import 'package:gazhome/view/cart/detailsorder.dart';
import 'package:gazhome/view/home/home.dart';
import 'package:gazhome/view/location/completlocation.dart';
import 'package:gazhome/view/location/location.dart';
import 'package:gazhome/view/mainAppUser.dart';
import 'package:gazhome/view/notific/notificat.dart';
import 'package:gazhome/view/onboarding/board.dart';
import 'package:gazhome/view/onboarding/langoage.dart';
import 'package:gazhome/view/suport/suport.dart';
import 'package:gazhome/viewdriver/account/account.dart';
import 'package:gazhome/viewdriver/mainappdriver.dart';
import 'package:gazhome/viewdriver/myorder/myorder.dart';
import 'package:gazhome/viewdriver/reservOrder/reservOrder.dart';
import 'package:gazhome/viewdriver/supportdriver/supportdriver.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  await Hive.openBox('first_name_user');
  await Hive.openBox('last_name_user');
  await Hive.openBox('id_user'); 
  await Hive.openBox('phone_number_user');
  await Hive.openBox('token_user');
  await Hive.openBox('language');
  // قفل الشاشة على الوضع العمودي فقط
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(MyApp());
  });
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Control();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'langoage': (context) => Langoage(),
          'account': (context) => Account(),
          'authentcation': (context) => Authentcation(),
          'codeauthentcation': (context) => CodeAuthentication(),
          'changepass1': (context) => ChangePass1(),
          'changepass2': (context) => ChangePass2(),
          'changepass3': (context) => ChangePass3(),
          'cart': (context) => Cart(),
          'completorder': (context) => CompleteOrder(),
          'detailsorder': (context) => DetailsOrder(),
          'home': (context) => Home(),
          'location': (context) => Location(),
          'completlocation': (context) => CompletLocation(),
          'suport': (context) => Suport(),
          'reservorder': (context) => ReservOrder(),
          'myorders': (context) => MyOrders(),
          'accountdriver': (context) => AccountDriver(),
          'supportdriver': (context) => SupportDriver(),
          'notification': (context) => Notificat(),
          'board': (context) => Board(),
          'mainappdriver': (context) => MainAppDriver(),
          'mainappuser': (context) => MainAppUser(),
        },
        home: Board(), //Location() //
      ),
    );
  }
}
