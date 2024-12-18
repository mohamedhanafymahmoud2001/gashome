import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';

class Notificat extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Notificat();
  }
  
}
class _Notificat extends State<Notificat>{
  
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 10,top: 10),
          decoration: BoxDecoration(
            border: Border.all(color: colorApp.colorborder,width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_left)),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text("الإشعارات",style: TextStyle(color: colorApp.colorFontblue, fontSize: 23,fontWeight: FontWeight.bold),)),
        ],
      ),
      body: ListView.builder(itemBuilder: (context,i){
        return Column(children: [
          Directionality(
            textDirection: TextDirection.rtl, // تغيير الاتجاه إلى من اليمين إلى اليسار
            child: ListTile(
              leading: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(color: colorApp.colorborder,width: 1),
                  borderRadius: BorderRadius.circular(100) ,
                ),
                child: Image.asset("assets/images/logo.png"),
              ),
              title: Text("GasHome",style: TextStyle(fontWeight: FontWeight.bold),) ,
              subtitle: Text("الأحد 17 مارس",style: TextStyle(color: colorApp.colorgreyapp),) ,
              trailing: CircleAvatar(radius: 4, backgroundColor: colorApp.colorbgbutton2,),
              
            ),
          ),
          Text("سيتم توصيل طلبك الموافق 30 / 10 / 2024",style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
        ],);
      }),
    );
  }

}