import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/langlocal.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class ProdectAccount extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  LangLocal langLocal = new LangLocal();
  ProdectAccount({
    super.key,
    required this.data,
  });
  var data;
  // مراحل الطلبية

  @override
  Widget build(BuildContext context) {
    return Consumer<Control>(builder: (context, val, child) {
      return Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: colorApp.colorborder, width: 1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///////////////////////
            Container(
              width: 150,
              height: 300,
              child: 
              Stepper(
                //type: StepperType.horizontal, // تغيير الاتجاه إلى أفقي
                // currentStep: _currentStep,
                // onStepContinue: _currentStep < val.orderStages.length - 1
                //     ? () => setState(() => _currentStep += 1)
                //     : null,
                // onStepCancel: _currentStep > 0
                //     ? () => setState(() => _currentStep -= 1)
                //     : null,
                // لا يوجد onStepContinue أو onStepCancel لإخفاء الأزرار
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return SizedBox.shrink(); // يخفي الأزرار
                },
                steps: val.orderStages.map((stage) {
                  //languagebox.get("language")=="ar"
                  int index = val.orderStages.indexOf(stage);
                  int _currentStep = data['order_status']=="pending"? 0: data['order_status']=="shipped"?1:data['order_status']=="delivered"?3:-1;
                  return Step(
                    title: Text(stage["${val.languagebox.get("language")}"]!),
                    content: Container(), //Text('الوصول إلى مرحلة: $stage'),
                    isActive: _currentStep >= index,
                    state: _currentStep > index
                        ? StepState.complete
                        : StepState.indexed,
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.width / 5,
                      child: Image.network(
                        "${val.api.imagedomain2}${data['product_image']}",
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          // في حال حدوث خطأ، يمكنك عرض صورة افتراضية
                          return Image.asset(
                            "assets/images/logo.png", // المسار إلى الصورة الافتراضية
                            fit: BoxFit.cover,
                          );
                        },
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          // عرض مؤشر تحميل أثناء تحميل الصورة
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                      )),
                  Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      "${data['product_name']}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorApp.colorFontblack),
                    ),
                  ),
                  Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      "${data['product_description']}",
                      style: TextStyle(color: colorApp.colorFontblack),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          textAlign: TextAlign.center,
                          "${langLocal.langLocal['lang16']['${val.languagebox.get("language")}']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colorApp.colorbgbutton2),
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Container(
                        child: Text(
                          textAlign: TextAlign.center,
                          "${data['order_total_price_after_tax']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colorApp.colorFontblack),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
