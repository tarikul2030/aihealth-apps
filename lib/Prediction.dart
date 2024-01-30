import 'dart:convert';
import 'dart:ffi';
import 'package:health/health.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'ProfilePage.dart';

class Prediction extends StatefulWidget {
  Prediction(
      this.age,
      this.sex,
      this.cp,
      this.trestbps,
      this.chol,
      this.fbs,
      this.restecg,
      this.thalach,
      this.exang,
      this.oldpeak,
      this.slope,
      this.ca,
      this.thal);
  final String age;
  final String sex;
  final String cp;
  final HealthValue trestbps;
  final String chol;
  final String fbs;
  final String restecg;
  final HealthValue thalach;
  final String exang;
  final String oldpeak;
  final String slope;
  final String ca;
  final String thal;

  @override
  State<Prediction> createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  TextEditingController age = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController cp = TextEditingController();
  TextEditingController trestbps = TextEditingController();
  TextEditingController chol = TextEditingController();
  TextEditingController fbs = TextEditingController();
  TextEditingController restecg = TextEditingController();
  TextEditingController thalach = TextEditingController();
  TextEditingController exang = TextEditingController();
  TextEditingController oldpeak = TextEditingController();
  TextEditingController slope = TextEditingController();
  TextEditingController ca = TextEditingController();
  TextEditingController thal = TextEditingController();

  String? z;
  bool editingEnabled = true;

  @override
  void initState() {
    age.text = widget.age;
    sex.text = widget.sex;
    cp.text = widget.cp;
    trestbps.text = widget.trestbps.toString();
    chol.text = widget.chol;
    fbs.text = widget.fbs;
    restecg.text = widget.restecg;
    thalach.text = widget.thalach.toString();
    exang.text = widget.exang;
    oldpeak.text = widget.oldpeak;
    slope.text = widget.slope;
    ca.text = widget.ca;
    thal.text = widget.thal;
    super.initState();
  }

  Future<String> MLdata(
      String age,
      String sex,
      String cp,
      double trestbps,
      String chol,
      String fbs,
      String restecg,
      double thalach,
      String exang,
      String oldpeak,
      String slope,
      String ca,
      String thal) async {
    final int trestbpsAsInt = trestbps.round();
    final int thalachAsInt = thalach.round();
    final response = await http.post(
      Uri.parse(
          "https://dietai-rw8x.onrender.com/apihr/predict-heart-disease/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "age": age,
        "sex": sex,
        "cp": cp,
        "trestbps": trestbpsAsInt,
        "chol": chol,
        "fbs": fbs,
        "restecg": restecg,
        "thalach": thalachAsInt,
        "exang": exang,
        "oldpeak": oldpeak,
        "slope": slope,
        "ca": ca,
        "thal": thal
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
        title: Text('Smart Heart Prediction'),
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextsField("age (last 1 min)", '', age, false),
              TextsField("sex (last 1 min)", '', sex, false),
              TextsField("Cp (last 1 min)", '', cp, false),
              TextsField("Blood pressure (centigrade)", '', trestbps, false),
              TextsField("lip (last 1 min)", '', chol, false),
              TextsField("Fbs (last 1 min)", '', fbs, false),
              TextsField("Ecg (last 1 min)", '', restecg, false),
              TextsField("Spo2 (last 1 min)", '', thalach, false),
              TextsField("Exercise (last 1 min)", '', exang, false),
              TextsField("ol (last 1 min)", '', oldpeak, false),
              TextsField("slo (last 1 min)", '', slope, false),
              TextsField("ca (last 1 min)", '', ca, false),
              TextsField("thl (last 1 min)", '', thal, false),
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
                            ? Text('Heart Disease')
                            : Text('No Heart Disease'),
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
                          widget.age,
                          widget.sex,
                          widget.cp,
                          double.parse(widget.trestbps.toString()),
                          widget.chol,
                          widget.restecg,
                          widget.fbs,
                          double.parse(widget.thalach.toString()),
                          widget.exang,
                          widget.oldpeak,
                          widget.slope,
                          widget.ca,
                          widget.thal,
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
