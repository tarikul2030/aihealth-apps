import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpline extends StatefulWidget {
  const Helpline({Key? key}) : super(key: key);

  @override
  State<Helpline> createState() => _HelplineState();
}

class _HelplineState extends State<Helpline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Helpline'),
        centerTitle: true,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: Text(
                  'Contact',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
                title: Text(
                  'Organisation Name',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  'Website',
                  style: TextStyle(
                      fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                ),
              ),
              HelplineTile(' 10616', 'Square Hospital',
                  'https://www.squarehospital.com/'),
              HelplineTile('1066', 'Apollo Hospital', 'https://www.apollohospitals.com/'),
              HelplineTile('10666', 'United Hospital Limited', 'https://www.uhlbd.com/'),
              HelplineTile('0255165001', 'Dhaka Medical College',
                  'https://dmch.gov.bd/'),
              HelplineTile(
                  '880255165760-94', 'BSMMU', 'https://bsmmu.ac.bd/'),
              HelplineTile('10606', 'LAB AID Hospital',
                  'https://labaidgroup.com/'),
              HelplineTile('01847259770', 'BIRDEM',
                  'https://www.birdembd.org/'),
              HelplineTile('10615', 'Ibn Sina Hospital',
                  'https://www.ibnsinatrust.com/'),
              HelplineTile('10602', 'Asgar Ali Hospital',
                  'https://www.asgaralihospital.com/'),
              HelplineTile('10674', 'Samorita Hospital', 'https://www.samoritahospital.org/'),
              HelplineTile('02-41060806', 'Central Hospital Ltd',
                  'https://centralhospitalltdbd.com/'),
            ],
          ),
        ),
      ),
    );
  }
}

class HelplineTile extends StatelessWidget {
  HelplineTile(this.contact, this.foundation, this.websiteUrl);
  final String contact;
  final String foundation;
  final String websiteUrl;

  _callNumber(String phoneNumber) async {
    String number = phoneNumber;
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: IconButton(
            icon: Icon(Icons.phone, color: Colors.green),
            onPressed: () {
              _callNumber(contact);
            },
          ),
          title: Text(
            foundation,
            style: TextStyle(color: Colors.indigo),
          ),
          trailing: IconButton(
            icon: Icon(Icons.open_in_new_rounded, color: Colors.blue),
            onPressed: () {
              launch(websiteUrl);
            },
          ),
          tileColor: Colors.grey[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        SizedBox(height: 15)
      ],
    );
  }
}
