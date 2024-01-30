import 'dart:convert';
import 'dart:ffi';
import 'package:health/health.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'ProfilePage.dart';

class Predictiondi extends StatefulWidget {
  Predictiondi(
      this.Age,
      this.Gender,
      this.Family_Diabetes,
      this.highBP,
      this.PhysicallyActive,
      this.BMI,
      this.Smoking,
      this.Alcohol,
      this.Sleep,
      this.SoundSleep,
      this.RegularMedicine,
      this.JunkFood,
      this.Stress,
      this.BPLevel,
      this.Pregancies,
      this.Pdiabetes,
      this.UriationFreq);
  final String Age;
  final String Gender;
  final String Family_Diabetes;
  final String highBP;
  final String PhysicallyActive;
  final String BMI;
  final String Smoking;
  final String Alcohol;
  final String Sleep;
  final String SoundSleep;
  final String RegularMedicine;
  final String JunkFood;
  final String Stress;
  final String BPLevel;
  final String Pregancies;
  final String Pdiabetes;
  final String UriationFreq;

  @override
  State<Predictiondi> createState() => _PredictiondiState();
}

class _PredictiondiState extends State<Predictiondi> {
  TextEditingController Age = TextEditingController();
  TextEditingController Gender = TextEditingController();
  TextEditingController Family_Diabetes = TextEditingController();
  TextEditingController highBP = TextEditingController();
  TextEditingController PhysicallyActive = TextEditingController();
  TextEditingController BMI = TextEditingController();
  TextEditingController Smoking = TextEditingController();
  TextEditingController Alcohol = TextEditingController();
  TextEditingController Sleep = TextEditingController();
  TextEditingController SoundSleep = TextEditingController();
  TextEditingController RegularMedicine = TextEditingController();
  TextEditingController JunkFood = TextEditingController();
  TextEditingController Stress = TextEditingController();
  TextEditingController BPLevel = TextEditingController();
  TextEditingController Pregancies = TextEditingController();
  TextEditingController Pdiabetes = TextEditingController();
  TextEditingController UriationFreq = TextEditingController();

  String? z;
  bool editingEnabled = true;

  @override
  void initState() {
    Age.text = widget.Age;
    Gender.text = widget.Gender;
    Family_Diabetes.text = widget.Family_Diabetes;
    highBP.text = widget.highBP;
    PhysicallyActive.text = widget.PhysicallyActive;
    BMI.text = widget.BMI.toString();
    Smoking.text = widget.Smoking;
    Alcohol.text = widget.Alcohol;
    Sleep.text = widget.Sleep;
    SoundSleep.text = widget.SoundSleep;
    RegularMedicine.text = widget.RegularMedicine;
    JunkFood.text = widget.JunkFood;
    Stress.text = widget.Stress;
    BPLevel.text = widget.BPLevel;
    Pregancies.text = widget.Pregancies;
    Pdiabetes.text = widget.Pdiabetes;
    UriationFreq.text = widget.UriationFreq;
    super.initState();
  }

  Future<String> MLdata(
      String Age,
      String Gender,
      String Family_Diabetes,
      String highBP,
      String PhysicallyActive,
      double BMI,
      String Smoking,
      String Alcohol,
      String Sleep,
      String SoundSleep,
      String RegularMedicine,
      String JunkFood,
      String Stress,
      String BPLevel,
      String Pregancies,
      String Pdiabetes,
      String UriationFreq) async {
    final response = await http.post(
      Uri.parse("https://dietai-rw8x.onrender.com/apidib/diabetic-prediction/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "Age": Age,
        "Gender": Gender,
        "Family_Diabetes": Family_Diabetes,
        "highBP": highBP,
        "PhysicallyActive": PhysicallyActive,
        "BMI": BMI,
        "Smoking": Smoking,
        "Alcohol": Alcohol,
        "Sleep": Sleep,
        "SoundSleep": SoundSleep,
        "RegularMedicine": RegularMedicine,
        "JunkFood": JunkFood,
        "Stress": Stress,
        "BPLevel": BPLevel,
        "Pregancies": Pregancies,
        "Pdiabetes": Pdiabetes,
        "UriationFreq": UriationFreq
      }),
    );

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      if (responseBody.containsKey('diagnosis')) {
        String diagnosis = responseBody['diagnosis'].toString();
        setState(() {
          editingEnabled = !editingEnabled;
          z = diagnosis;
        });
        return diagnosis;
      } else {
        throw Exception('Invalid response format: Missing "diagnosis" field.');
      }
    } else {
      throw Exception(
          'Failed to fetch ML Data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Smart Dibatice Prediction'),
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextsField("age (last 1 min)", '', Age, false),
              TextsField("Gender (last 1 min)", '', Gender, false),
              TextsField(
                  "Family_Diabetes (last 1 min)", '', Family_Diabetes, false),
              TextsField("Blood highBP (centigrade)", '', highBP, false),
              TextsField("PhysicallyActive", '', PhysicallyActive, false),
              TextsField("BMI", '', BMI, false),
              TextsField("Smoking", '', Smoking, false),
              TextsField("Alcohol", '', Alcohol, false),
              TextsField("Sleep", '', Sleep, false),
              TextsField("SoundSleep", '', SoundSleep, false),
              TextsField("RegularMedicine", '', RegularMedicine, false),
              TextsField("JunkFood", '', JunkFood, false),
              TextsField("Stress", '', Stress, false),
              TextsField("BPLevel", '', BPLevel, false),
              TextsField("Pregancies", '', Pregancies, false),
              TextsField("Pdiabetes", '', Pdiabetes, false),
              TextsField("UriationFreq", '', UriationFreq, false),
              SizedBox(height: 20),
              Container(
                height: 250,
                child: z != null
                    ? CircularPercentIndicator(
                        radius: 100.0,
                        lineWidth: 13.0,
                        animation: true,
                        animationDuration: 600,
                        percent:
                            z == '0' ? 0.8 : 0.5, // Adjust values as needed
                        center: z == '1'
                            ? Text('Dibatice Disease')
                            : Text('No Dibatice Disease'),
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: z == '1'
                            ? Colors.red // Color for Heart Disease
                            : Colors.green, // Color for No Heart Disease
                      )
                    : Container(
                        height: 250,
                        padding: EdgeInsets.all(20),
                        child: Image(
                          image: AssetImage('assets/robo.gif'),
                        ),
                      ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                  width / 15,
                  height / 20,
                  width / 15,
                  height / 20,
                ),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.redAccent.withOpacity(0.8),
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  child: MaterialButton(
                    elevation: 10.00,
                    minWidth: width / 1.2,
                    height: height / 11.5,
                    onPressed: () async {
                      try {
                        await MLdata(
                          widget.Age,
                          widget.Gender,
                          widget.Family_Diabetes,
                          widget.highBP,
                          widget.PhysicallyActive,
                          double.parse(widget.BMI.toString()),
                          widget.Smoking,
                          widget.Alcohol,
                          widget.Sleep,
                          widget.SoundSleep,
                          widget.RegularMedicine,
                          widget.JunkFood,
                          widget.Stress,
                          widget.BPLevel,
                          widget.Pregancies,
                          widget.Pdiabetes,
                          widget.UriationFreq,
                        );
                      } catch (e) {
                        // Handle exceptions or errors
                        print('Error: $e');
                      }
                    },
                    child: Text(
                      'Predict',
                      style: TextStyle(color: Colors.white, fontSize: 20.00),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
