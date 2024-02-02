import 'package:cloud_firestore/cloud_firestore.dart';

class PatientInfo {
  String? name;
  String? ageOn;
  String? email;
  String? phoneNo;
  String? friendName;
  String? specialistName;
  String? friendContact;
  String? specialistContact;
  String? profileLink;
  String? sex;
  String? chestPain;
  String? ecg;
  String? fbs;
  String? exercise;
  String? oldPeak;
  String? slope;
  String? ca;
  String? thal;
  String? lipid;
  String? hoursOfSleep;
  String? mood;
  String? familyDiabetes;
  String? highBP;
  String? physicallyActive;
  String? smoking;
  String? alcohol;
  String? soundSleep;
  String? regularMedicine;
  String? junkFood;
  String? stress;
  String? bpLevel;
  String? pregnancies;
  String? pdiabetes;
  String? urinationFreq;
  String? bmi;
  String? caloriesBurned;
  String? weightKg;
  String? stepCount;

  PatientInfo({
    this.name,
    this.ageOn,
    this.email,
    this.phoneNo,
    this.friendName,
    this.specialistName,
    this.friendContact,
    this.specialistContact,
    this.profileLink,
    this.sex,
    this.chestPain,
    this.ecg,
    this.fbs,
    this.exercise,
    this.oldPeak,
    this.slope,
    this.ca,
    this.thal,
    this.lipid,
    this.hoursOfSleep,
    this.mood,
    this.familyDiabetes,
    this.highBP,
    this.physicallyActive,
    this.smoking,
    this.alcohol,
    this.soundSleep,
    this.regularMedicine,
    this.junkFood,
    this.stress,
    this.bpLevel,
    this.pregnancies,
    this.pdiabetes,
    this.urinationFreq,
    this.bmi,
    this.caloriesBurned,
    this.weightKg,
    this.stepCount,
  });

  factory PatientInfo.fromMap(Map<String, dynamic> map) {
    return PatientInfo(
      name: map['name'],
      ageOn: map['ageOn'],
      email: map['email'],
      phoneNo: map['phoneNo'],
      friendName: map['friendName'],
      specialistName: map['specialistName'],
      friendContact: map['friendContact'],
      specialistContact: map['specialistContact'],
      profileLink: map['profileLink'],
      sex: map['sex'],
      chestPain: map['chestPain'],
      ecg: map['ecg'],
      fbs: map['fbs'],
      exercise: map['exercise'],
      oldPeak: map['oldPeak'],
      slope: map['slope'],
      ca: map['ca'],
      thal: map['thal'],
      lipid: map['lipid'],
      hoursOfSleep: map['hoursOfSleep'],
      mood: map['mood'],
      familyDiabetes: map['familyDiabetes'],
      highBP: map['highBP'],
      physicallyActive: map['physicallyActive'],
      smoking: map['smoking'],
      alcohol: map['alcohol'],
      soundSleep: map['soundSleep'],
      regularMedicine: map['regularMedicine'],
      junkFood: map['junkFood'],
      stress: map['stress'],
      bpLevel: map['bpLevel'],
      pregnancies: map['pregnancies'],
      pdiabetes: map['pdiabetes'],
      urinationFreq: map['urinationFreq'],
      bmi: map['bmi'],
      caloriesBurned: map['caloriesBurned'],
      weightKg: map['weightKg'],
      stepCount: map['stepCount'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'ageOn': ageOn,
      'email': email,
      'phoneNo': phoneNo,
      'friendName': friendName,
      'specialistName': specialistName,
      'friendContact': friendContact,
      'specialistContact': specialistContact,
      'profileLink': profileLink,
      'sex': sex,
      'chestPain': chestPain,
      'ecg': ecg,
      'fbs': fbs,
      'exercise': exercise,
      'oldPeak': oldPeak,
      'slope': slope,
      'ca': ca,
      'thal': thal,
      'lipid': lipid,
      'hoursOfSleep': hoursOfSleep,
      'mood': mood,
      'familyDiabetes': familyDiabetes,
      'highBP': highBP,
      'physicallyActive': physicallyActive,
      'smoking': smoking,
      'alcohol': alcohol,
      'soundSleep': soundSleep,
      'regularMedicine': regularMedicine,
      'junkFood': junkFood,
      'stress': stress,
      'bpLevel': bpLevel,
      'pregnancies': pregnancies,
      'pdiabetes': pdiabetes,
      'urinationFreq': urinationFreq,
      'bmi': bmi,
      'caloriesBurned': caloriesBurned,
      'weightKg': weightKg,
      'stepCount': stepCount,
    };
  }

  Future<void> addToFirestore(String documentId) async {
    final firestore = FirebaseFirestore.instance;
    await firestore.collection('patientInfo').doc(documentId).set(toMap());
  }
}
