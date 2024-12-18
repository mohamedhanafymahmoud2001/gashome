import 'package:flutter/material.dart';
import 'package:gazhome/componanet/bottonapp.dart';
import 'package:gazhome/componanet/colors.dart';
import 'package:gazhome/provider/prov.dart';
import 'package:provider/provider.dart';

class ProdectAccount extends StatelessWidget {
  ColorApp colorApp = new ColorApp();
  int _currentStep = 0;

  // مراحل الطلبية
  final List<String> _orderStages = [
    'استلام الطلب',
    // 'تجهيز الطلب',
    // 'الشحن',
    'التوصيل',
    'استلام الطلبية'
  ];
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
              width: 200,
              height: 300,
              child: Stepper(
                //type: StepperType.horizontal, // تغيير الاتجاه إلى أفقي
                currentStep: _currentStep,
                // onStepContinue: _currentStep < _orderStages.length - 1
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
                steps: _orderStages.map((stage) {
                  int index = _orderStages.indexOf(stage);
                  return Step(
                    title: Text(stage),
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
                      child: Image.asset("assets/images/prodect1.png")),
                  Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      "أنابيب بي-آل-بي",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorApp.colorFontblack),
                    ),
                  ),
                  Container(
                    child: Text(
                      textAlign: TextAlign.center,
                      "مناسب للنقل ، يمكن تعبئته في لفة",
                      style: TextStyle(color: colorApp.colorFontblack),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          textAlign: TextAlign.center,
                          "ريال سعودي",
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
                          "23",
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
