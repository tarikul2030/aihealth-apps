import 'package:caress/HomeScreen.dart';
import 'package:caress/Instruction.dart';
import 'package:caress/model/user_secret.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'UserScreen.dart';
import 'main.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

late User loggedinUser;

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _auth = FirebaseAuth.instance;

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  //using this function you can use the credentials of the user
  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedinUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController ageOn = TextEditingController();
  TextEditingController friendName = TextEditingController();
  TextEditingController friendContact = TextEditingController();
  TextEditingController friendPhone = TextEditingController();
  TextEditingController specialist = TextEditingController();
  TextEditingController specialistContact = TextEditingController();
  TextEditingController sex = TextEditingController();
  TextEditingController chestPain = TextEditingController();
  TextEditingController ecg = TextEditingController();
  TextEditingController fbs = TextEditingController();
  TextEditingController exercise = TextEditingController();
  TextEditingController oldpeak = TextEditingController();
  TextEditingController slope = TextEditingController();
  TextEditingController ca = TextEditingController();
  TextEditingController thal = TextEditingController();
  TextEditingController lipid = TextEditingController();
  TextEditingController hours_of_sleep = TextEditingController();
  TextEditingController mood = TextEditingController();
  TextEditingController step_count = TextEditingController();
  TextEditingController familyDiabetes = TextEditingController();
  TextEditingController highBP = TextEditingController();
  TextEditingController PhysicallyActive = TextEditingController();
  TextEditingController Smoking = TextEditingController();
  TextEditingController Alcohol = TextEditingController();
  TextEditingController SoundSleep = TextEditingController();
  TextEditingController RegularMedicine = TextEditingController();
  TextEditingController JunkFood = TextEditingController();
  TextEditingController Stress = TextEditingController();
  TextEditingController BPLevel = TextEditingController();
  TextEditingController Pregancies = TextEditingController();
  TextEditingController Pdiabetes = TextEditingController();
  TextEditingController UriationFreq = TextEditingController();
  TextEditingController BMI = TextEditingController();
  TextEditingController calories_burned = TextEditingController();
  TextEditingController weight_kg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fill Your Basic Information'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.redAccent, Colors.blue])),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height / 20),
              Image(
                image: const AssetImage('assets/brain4.png'),
                height: height / 4,
                width: 0.75 * width,
              ),
              TextFieldComponent(
                width: width,
                controller: name,
                hintText: "Enter your name",
                FieldName: "Name",
                type: TextInputType.text,
                necessaryField: true,
              ),
              TextFieldComponent(
                width: width,
                controller: ageOn,
                hintText: "Enter your age",
                FieldName: "Age",
                type: TextInputType.number,
                necessaryField: true,
              ),
              TextFieldComponent(
                width: width,
                controller: friendName,
                hintText: "Enter your well wisher's name",
                FieldName: "Well Wisher's Name",
                type: TextInputType.text,
                necessaryField: true,
              ),
              TextFieldComponent(
                width: width,
                controller: friendContact,
                hintText: "Enter your Well wisher's Email",
                FieldName: "Email",
                type: TextInputType.emailAddress,
                necessaryField: true,
              ),
              TextFieldComponent(
                width: width,
                controller: friendPhone,
                hintText: "Enter your Well wisher's Contact No",
                FieldName: "Phone",
                type: TextInputType.phone,
                necessaryField: true,
              ),
              SizedBox(height: height / 20),
              const Text(
                'If you have any history of mental/health related diagonasis,\nPlease fill the following',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),
              TextFieldComponent(
                width: width,
                controller: specialist,
                hintText: "Enter name of specialist/pyschologist",
                FieldName: "Name of specialist",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: specialistContact,
                hintText: "Enter email of specialist/pyschologist",
                FieldName: "Email of specialist",
                type: TextInputType.emailAddress,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: sex,
                hintText: "Enter sex ",
                FieldName: "sex Male / Female",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: chestPain,
                hintText: "chest pain type",
                FieldName: "chest Pain",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: ecg,
                hintText: "ecg",
                FieldName: "ecg",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: fbs,
                hintText: "fbs",
                FieldName: "fbs",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: exercise,
                hintText: "exercise",
                FieldName: "exercise",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: oldpeak,
                hintText: "oldpeak",
                FieldName: "oldpeak",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: slope,
                hintText: "slope",
                FieldName: "slope",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: ca,
                hintText: "ca",
                FieldName: "ca",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: thal,
                hintText: "thal",
                FieldName: "thal",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: lipid,
                hintText: "lipid",
                FieldName: "lipid",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: hours_of_sleep,
                hintText: "sleep",
                FieldName: "sleep",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: mood,
                hintText: "mood",
                FieldName: "mood",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: step_count,
                hintText: "step",
                FieldName: "step",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: familyDiabetes,
                hintText: "familyDiabetes",
                FieldName: "familyDiabetes",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: highBP,
                hintText: "highBP",
                FieldName: "highBP",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: Smoking,
                hintText: "Smoking",
                FieldName: "Smoking",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: Alcohol,
                hintText: "Alcohol",
                FieldName: "Alcohol",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: SoundSleep,
                hintText: "SoundSleep",
                FieldName: "SoundSleep",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: RegularMedicine,
                hintText: "RegularMedicine",
                FieldName: "RegularMedicine",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: JunkFood,
                hintText: "JunkFood",
                FieldName: "JunkFood",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: Stress,
                hintText: "Stress",
                FieldName: "Stress",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: BPLevel,
                hintText: "BPLevel",
                FieldName: "BPLevel",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: Pregancies,
                hintText: "Pregancies",
                FieldName: "Pregancies",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: Pdiabetes,
                hintText: "Pdiabetes",
                FieldName: "Pdiabetes",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: UriationFreq,
                hintText: "UriationFreq",
                FieldName: "UriationFreq",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: BMI,
                hintText: "BMI",
                FieldName: "BMI",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: PhysicallyActive,
                hintText: "PhysicallyActive",
                FieldName: "PhysicallyActive",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: calories_burned,
                hintText: "calo",
                FieldName: "calo",
                type: TextInputType.text,
                necessaryField: false,
              ),
              TextFieldComponent(
                width: width,
                controller: weight_kg,
                hintText: "wei",
                FieldName: "wei",
                type: TextInputType.text,
                necessaryField: false,
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Read Instructions before proceeding!!!',
                    style: TextStyle(color: Colors.red),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Instruction()));
                      },
                      child: const Text(
                        'Instructions Page',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ))
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    width / 15, height / 30, width / 15, height / 20),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.8),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0))),
                  child: MaterialButton(
                      elevation: 10.00,
                      minWidth: width / 1.2,
                      height: height / 11.5,
                      onPressed: () async {
                        if (name.text.isEmpty ||
                            ageOn.text.isEmpty ||
                            friendName.text.isEmpty ||
                            friendContact.text.isEmpty ||
                            friendPhone.text.isEmpty ||
                            sex.text.isEmpty ||
                            chestPain.text.isEmpty ||
                            ecg.text.isEmpty ||
                            fbs.text.isEmpty ||
                            exercise.text.isEmpty ||
                            oldpeak.text.isEmpty ||
                            slope.text.isEmpty ||
                            ca.text.isEmpty ||
                            thal.text.isEmpty ||
                            lipid.text.isEmpty ||
                            hours_of_sleep.text.isEmpty ||
                            mood.text.isEmpty ||
                            step_count.text.isEmpty ||
                            familyDiabetes.text.isEmpty ||
                            highBP.text.isEmpty ||
                            PhysicallyActive.text.isEmpty ||
                            BMI.text.isEmpty ||
                            Smoking.text.isEmpty ||
                            Smoking.text.isEmpty ||
                            Alcohol.text.isEmpty ||
                            SoundSleep.text.isEmpty ||
                            RegularMedicine.text.isEmpty ||
                            JunkFood.text.isEmpty ||
                            Stress.text.isEmpty ||
                            BPLevel.text.isEmpty ||
                            Pregancies.text.isEmpty ||
                            Pdiabetes.text.isEmpty ||
                            UriationFreq.text.isEmpty ||
                            calories_burned.text.isEmpty ||
                            weight_kg.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text("Fill all the * necessary fields")));
                        } else if (!EmailValidator.validate(
                            friendContact.text)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Friends mail address is invalid!")));
                        } else if (!EmailValidator.validate(
                                specialistContact.text) &&
                            specialistContact.text.isNotEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      "Specialist mail address is invalid!")));
                        } else {
                          db.collection("Users").doc("${UserSecret.email}").set(
                            {
                              'name': name.text,
                              'ageOn': ageOn.text,
                              'friend': friendName.text,
                              'friendContact': friendContact.text,
                              'friendPhone': friendPhone.text,
                              'specialist': specialist.text.isEmpty
                                  ? "null"
                                  : specialist.text,
                              'specialistContact':
                                  specialistContact.text.isEmpty
                                      ? "null"
                                      : specialistContact.text,
                              'sex': sex.text.isEmpty ? "null" : sex.text,
                              'chestPain': chestPain.text,
                              'ecg': ecg.text,
                              'fbs': fbs.text,
                              'exercise': exercise.text,
                              'oldpeak': oldpeak.text,
                              'slope': slope.text,
                              'ca': ca.text,
                              'thal': thal.text,
                              'lipid': lipid.text,
                              'hours_of_sleep': hours_of_sleep.text.isEmpty
                                  ? "null"
                                  : hours_of_sleep,
                              'mood': mood.text.isEmpty ? "null" : mood.text,
                              'familyDiabetes': familyDiabetes.text,
                              'highBP': highBP.text,
                              'PhysicallyActive': PhysicallyActive.text,
                              'Smoking': Smoking.text,
                              'Alcohol': Alcohol.text,
                              'SoundSleep': SoundSleep.text,
                              'RegularMedicine': RegularMedicine.text,
                              'JunkFood': JunkFood.text,
                              'Stress': Stress.text,
                              'BPLevel': BPLevel.text,
                              'Pregancies': Pregancies.text,
                              'Pdiabetes': Pdiabetes.text,
                              'UriationFreq': UriationFreq.text,
                              'BMI': BMI.text,
                              'calories_burned': calories_burned.text.isEmpty
                                  ? "null"
                                  : calories_burned.text,
                              'weight_kg': weight_kg.text.isEmpty
                                  ? "null"
                                  : weight_kg.text,
                              'step_count': step_count.text.isEmpty
                                  ? "null"
                                  : step_count.text,
                            },
                          );

                          UserSecret.name = name.text;
                          UserSecret.friendName = friendName.text;
                          UserSecret.friendContact = friendContact.text;
                          UserSecret.specialistName = specialist.text;
                          UserSecret.specialistContact = specialistContact.text;
                          UserSecret.phoneNo = friendPhone.text;
                          UserSecret.ageOn = ageOn.text;
                          UserSecret.sex = sex.text;
                          UserSecret.chestPain = chestPain.text;
                          UserSecret.ecg = ecg.text;
                          UserSecret.fbs = fbs.text;
                          UserSecret.exercise = exercise.text;
                          UserSecret.oldpeak = oldpeak.text;
                          UserSecret.slope = slope.text;
                          UserSecret.ca = ca.text;
                          UserSecret.thal = thal.text;
                          UserSecret.lipid = lipid.text;
                          UserSecret.hoursOfSleep = hours_of_sleep.text;
                          UserSecret.mood = mood.text;
                          UserSecret.stepCount = step_count.text;
                          UserSecret.familyDiabetes = familyDiabetes.text;
                          UserSecret.highBP = highBP.text;
                          UserSecret.physicallyActive = PhysicallyActive.text;
                          UserSecret.smoking = Smoking.text;
                          UserSecret.alcohol = Alcohol.text;
                          UserSecret.soundSleep = SoundSleep.text;
                          UserSecret.regularMedicine = RegularMedicine.text;
                          UserSecret.junkFood = JunkFood.text;
                          UserSecret.stepCount = Stress.text;
                          UserSecret.bpLevel = BPLevel.text;
                          UserSecret.pregnancies = Pregancies.text;
                          UserSecret.pdiabetes = Pdiabetes.text;
                          UserSecret.urinationFreq = UriationFreq.text;
                          UserSecret.bmi = BMI.text;
                          UserSecret.caloriesBurned = calories_burned.text;
                          UserSecret.weightKg = weight_kg.text;

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Data submitted")));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Homescreen()));
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 20.00),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldComponent extends StatelessWidget {
  const TextFieldComponent(
      {super.key,
      required this.width,
      required this.controller,
      required this.hintText,
      required this.FieldName,
      required this.type,
      required this.necessaryField});

  final double width;
  final TextEditingController controller;
  final String hintText;
  final String FieldName;
  final TextInputType type;
  final bool necessaryField;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: width * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  FieldName,
                  style: const TextStyle(fontSize: 15, color: Colors.blue),
                ),
                const SizedBox(width: 5),
                necessaryField
                    ? const Text('*',
                        style: TextStyle(fontSize: 15, color: Colors.red))
                    : const SizedBox()
              ],
            ),
            TextField(
              keyboardType: type,
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
              ),
              autofocus: true,
              style: const TextStyle(fontSize: 15, color: Colors.black),
              cursorColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
