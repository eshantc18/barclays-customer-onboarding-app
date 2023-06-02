// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customer_onboard/screens/phoneVerification.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Account extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final firstContoller = TextEditingController();
  final lastContoller = TextEditingController();
  final emailContoller = TextEditingController();
  final accountTypeContoller = TextEditingController();
  final genderContoller = TextEditingController();
  final dateController = TextEditingController();
  final genderList = ['Male', 'Female', 'Others'];
  final accountType = ['Current Account', 'Recurring Deposit', 'Joint Deposit'];
  String? gender;
  String? account;
  DateTime? pickedDate;

  void goToPhone() {
    addDetails(
      firstContoller.text.trim(),
      lastContoller.text.trim(),
      emailContoller.text.trim(),
      accountTypeContoller.text.trim(),
      genderContoller.text.trim(),
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => PhoneVerification()),
    );
  }

  Future addDetails(String first_name, String last_name, String email_ID,
      String accountType, String gender) async {
    await FirebaseFirestore.instance.collection('account').add({
      'first_name': first_name,
      'last_name': last_name,
      'email_ID': email_ID,
      'accountType': accountType,
      'gender': gender,
    });
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.all(35),
            child: Center(
              child: Image.asset('assets/account.png'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Open Bank Account',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'For the purpose of industry regulation, your details are required.',
                  textAlign: TextAlign.center,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 12.5, 15),
                    child: Card(
                      elevation: 7,
                      child: SizedBox(
                        width: 145,
                        child: const TextField(
                          // controller: emailorphoneController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: 'First Name',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.5, 0, 10, 20),
                    child: Card(
                      elevation: 7,
                      child: SizedBox(
                        width: 145,
                        child: const TextField(
                          // controller: emailorphoneController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: 'Last Name',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 20, 15),
                child: Card(
                  elevation: 7,
                  child: SizedBox(
                    width: 330,
                    child: const TextField(
                      // controller: emailorphoneController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        hintText: 'Address',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 20, 10),
                child: Card(
                  elevation: 7,
                  child: SizedBox(
                    width: 330,
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                        elevation: 0,
                        hint: Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 25, 0),
                          child: Text('Account Type'),
                        ),
                        value: account,
                        items: accountType.map(buildMenuItem).toList(),
                        onChanged: (value) {
                          setState(() {
                            this.account = value as String?;
                          });
                        }),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 0, 7.5, 15),
                    child: Card(
                      elevation: 7,
                      child: SizedBox(
                        width: 145,
                        child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 1),
                              ),
                            ),
                            elevation: 0,
                            hint: Padding(
                              padding: EdgeInsets.fromLTRB(5, 0, 25, 0),
                              child: Text('Gender'),
                            ),
                            value: gender,
                            items: genderList.map(buildMenuItem).toList(),
                            onChanged: (value) {
                              setState(() {
                                this.gender = value as String?;
                              });
                            }),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(7.5, 0, 10, 20),
                    child: Card(
                      elevation: 7,
                      child: SizedBox(
                        width: 155,
                        child: TextField(
                          controller: dateController,
                          keyboardType: TextInputType.none,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.calendar_today_rounded),
                            hintText: 'DOB',
                          ),
                          onTap: () async {
                            pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime.now());

                            if (pickedDate != null) {
                              print(pickedDate);
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate!);

                              setState(() {
                                dateController.text = formattedDate;
                              });
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 70,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 10, 20),
                  child: SizedBox(
                    width: 340,
                    child: ElevatedButton(
                      onPressed: () => goToPhone(),
                      style: ElevatedButton.styleFrom(
                        side: BorderSide(width: 2, color: Colors.white),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 7,
                      ),
                      child: Text(
                        'Next',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
