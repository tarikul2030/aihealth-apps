import 'dart:convert';
import 'dart:ffi';
import 'package:health/health.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'ProfilePage.dart';

class Predictiond extends StatefulWidget {
  Predictiond(this.step_counts, this.mood, this.calories_burned, this.hours_of_sleep, this.weight_kg);

  final String step_counts;
  final String mood;
  final HealthValue calories_burned; // Changed type to double
  final String hours_of_sleep;
  final HealthValue weight_kg;

  @override
  State<Predictiond> createState() => _PredictiondState();
}

class _PredictiondState extends State<Predictiond> {
  TextEditingController step_counts = TextEditingController();
  TextEditingController mood = TextEditingController();
  TextEditingController calories_burned = TextEditingController();
  TextEditingController hours_of_sleep = TextEditingController();
  TextEditingController weight_kg = TextEditingController();

  String? z;
  bool editingEnabled = true;

  @override
  void initState() {
    step_counts.text = widget.step_counts;
    mood.text = widget.mood;
    calories_burned.text = widget.calories_burned.toString(); // Convert double to string
    hours_of_sleep.text = widget.hours_of_sleep;
    weight_kg.text = widget.weight_kg.toString();
    super.initState();
  }

  Future<String> MLdata(
      String step_count, String mood, double calories_burned, String hours_of_sleep, double weight_kg) async {
    final int caloriesBurnedAsInt = calories_burned.round();
    final int weightKgAsInt = weight_kg.round();

    final response = await http.post(
      Uri.parse("https://dietai-rw8x.onrender.com/api/fitness-prediction/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "step_count": step_count,
        "mood": mood,
        "calories_burned": caloriesBurnedAsInt,
        "hours_of_sleep": hours_of_sleep,
        "weight_kg": weightKgAsInt
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
      throw Exception('Failed to fetch ML Data. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Smart Stress Prediction'),
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextsField("Calories burned (Calories)", '', calories_burned, false),
              TextsField("weight (kg)", '', weight_kg, false),
              SizedBox(height: 20),
              Container(
                height: 250,
                child: z != null
                    ? CircularPercentIndicator(
                  radius: 100.0,
                  lineWidth: 13.0,
                  animation: true,
                  animationDuration: 600,
                  percent: z == '0' ? 0.3 : z == '1' ? 0.6 : z == '2' ? 0.9 : z == '3' ? 0.2 : 0.0,
                  center: z == '3'
                      ? Text('Very Low Active')
                      : z == '2'
                      ? Text('Low Stress')
                      : z == '1'
                      ? Text('Normal Stress')
                      : z == '0'
                      ? Text('High Stress')
                      : Text('Very High Active'),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: z == '0'
                      ? Colors.blue
                      : z == '1'
                      ? Colors.green
                      : z == '2'
                      ? Colors.orange
                      : Colors.red,
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
                          widget.step_counts,
                          widget.mood,
                         double.parse(widget.calories_burned.toString()),
                          widget.hours_of_sleep,
                          double.parse(widget.weight_kg.toString()) ,
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
