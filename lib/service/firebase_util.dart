import 'package:caress/model/patient_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStoreUtils {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static Reference storage = FirebaseStorage.instance.ref();


   static Future addDriverInbox(PatientInfo patientInfo) async {
    return await firestore.collection("chat_driver").doc(patientInfo.email).set(patientInfo.toMap()).then((document) {
      return patientInfo;
    });
  }

    

}
