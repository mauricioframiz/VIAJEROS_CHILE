import 'package:flutter/material.dart';


class MyStepper extends StatefulWidget {
  @override
  _MyStepperState createState() => new _MyStepperState();
 }
class _MyStepperState extends State<MyStepper> {
  int _currentStep = 0 ;

  List<Step> mySteps = [
    new Step(
      title: new Text ("Paso 1"),
      content : new Text("Crear usuario y Logear en App")
    ),
     new Step(
      title: new Text ("Paso 2"),
      content : new Text("Buscar las mejores ofertas en destinos")
    ),
     new Step(
      title: new Text ("Paso 3"),
      content : new Text("Viajar y compartir tus experiencias")
    )
  ];


  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar : new AppBar(
       title: new Text("Ayuda"),
     ),
     body: new Container(
       child: new Stepper(
         // Nos indica cual es el paso actual del stepper
         currentStep : this._currentStep,
         steps: mySteps,
         onStepCancel: (){
           setState(() {
             if(_currentStep > 0 ){
                 _currentStep = _currentStep - 1;   
             }else{
               _currentStep = 0;
             }           
                      });
                    print("Mi paso actual es " + _currentStep.toString());
         },
         onStepTapped: (step){
          setState(() {
                      _currentStep = step;
                    });
                    print("Mi paso actual es " + _currentStep.toString());
         },
         onStepContinue: ()
         {
            setState(() {
              if(_currentStep <mySteps.length - 1){
              _currentStep = _currentStep + 1;
              }else {
                _currentStep = 0;
              }
                   print("Mi paso actual es " + _currentStep.toString());
            });          
         },
       ),

     ),
  
   );
  }
}
