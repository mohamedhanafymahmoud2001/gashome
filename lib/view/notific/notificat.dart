import 'package:flutter/material.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class Notificat extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Notificat();
  }
  
}
class _Notificat extends State<Notificat>{

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Control>(context, listen: false).Noti();
    });
    super.initState();
  }
  
  ColorApp colorApp = new ColorApp();
  @override
  Widget build(BuildContext context) {
    return  Consumer<Control>(builder: (context, val, child) {
      return  Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 10,top: 10),
          decoration: BoxDecoration(
            border: Border.all(color: colorApp.colorborder,width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.keyboard_arrow_left)),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Text("الإشعارات",style: TextStyle(color: colorApp.colorFontblue, fontSize: 23,fontWeight: FontWeight.bold),)),
        ],
      ),
      body: val.noti==null?Center(child: CircularProgressIndicator())  : val.noti['message']!="Successfully retrieved notifications." ? Center(
                      child: Image.asset("assets/images/nodata.png"),
                    ) : ListView.builder(
        
        itemCount: val.noti['data'].length,
        itemBuilder: (context,i){
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
              title: Text("${val.noti['data'][i]['title']}",style: TextStyle(fontWeight: FontWeight.bold),) ,
              subtitle: Text("${DateTime.parse(val.noti['data'][i]['created_at']).day}-${DateTime.parse(val.noti['data'][i]['created_at']).month}-${DateTime.parse(val.noti['data'][i]['created_at']).year}",style: TextStyle(color: colorApp.colorgreyapp),) ,
              trailing:val.noti['data'][i]['read']== "false" ?CircleAvatar(radius: 4, backgroundColor: colorApp.colorbgbutton2,):SizedBox(),
            ),
          ),
          Text("${val.noti['data'][i]['description']}",style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),),
        ],);
      }),
    );});
  }

}