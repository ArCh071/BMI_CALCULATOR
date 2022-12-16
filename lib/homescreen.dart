import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _height = 170.0;
  double _weight = 75.0;
  int _bmi = 0;
  String _condition = '';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "BMI",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30.0),
          ),
          SizedBox(
            width: size.width * 0.02,
          ),
          Text(
            "Calculator",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ],
      ),backgroundColor: Colors.indigo[300],

      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: double.infinity,
              child: Column(
                children:[
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Height : ",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25.0),),
                      Text("$_height cm",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 8.0,
                      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    ),
                    child: Slider(
                      value: _height,
                      min: 0,
                      max: 250,
                      onChanged: (height) {
                        setState(() {
                          _height = height;
                        });
                      },
                      divisions: 250,
                      label: "$_height",
                      activeColor: Colors.indigo[300],
                      inactiveColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("Weight : ",
                       style:
                       TextStyle(color: Colors.black, fontSize: 25.0),),
                     Text( "$_weight kg",
                       style: TextStyle(
                           color: Colors.black,
                           fontSize: 25.0,
                           fontWeight: FontWeight.bold),
                     )
                   ],
                 ),

                        ]),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        trackHeight: 8.0,
                        valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    ), child: Slider(
                    value: _weight,
                    min: 0,
                    max: 300,
                    onChanged: (weight) {
                      setState(() {
                        _weight = weight;
                      });
                    },
                    divisions: 300,
                    label: "$_weight",
                    activeColor: Colors.indigo[300],
                    inactiveColor: Colors.grey,
                  ),
                  ),
                  SizedBox(
                    height: size.height * 0.08,
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            _bmi =
                                (_weight / ((_height / 100) * (_height / 100)))
                                    .round()
                                    .toInt();
                            if (_bmi >= 18.5 && _bmi <= 25) {
                              _condition = " Normal";
                            } else if (_bmi > 25 && _bmi <= 30) {
                              _condition = " Overweight";
                            } else if (_bmi > 30) {
                              _condition = " Obesity";
                            } else {
                              _condition = " Underweight";
                            }
                          });
                        },
                        child: Text(
                          "Calculate",
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        style: TextButton.styleFrom(backgroundColor: Colors.indigo[300],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 200,
                          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 40),
                        )),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  FutureBuilder(
                    builder: (context, snapshot) {
                      if(_bmi == 0){
                        return Lottie.network('https://assets5.lottiefiles.com/private_files/lf30_g0xeklmz.json',
                            width: 170);
                      }
                      if(_bmi! == null){
                        return CircularProgressIndicator();
                      }
                      return Column(
                        children: [
                          Container(
                            child: Text(
                              "$_bmi",
                              style: TextStyle(
                                  color: Colors.indigo[300],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text( "Your condition is",
                                style: TextStyle(color: Colors.indigo[300], fontSize: 25.0),),
                          Text( "$_condition",
                            style: TextStyle(
                                color: Colors.indigo[300],
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),

                          ]);
                    }
                  )
                ],

              ),
            )
    );
  }
}
