import 'package:care_brecelet/api_manager/api_manager.dart';
import 'package:care_brecelet/models/patients_model.dart';
import 'package:care_brecelet/models/seizure_model.dart';
import 'package:care_brecelet/view/homeScreen/patient_details.dart';
import 'package:flutter/material.dart';

import '../screens/QrPage.dart';

class PatientListView extends StatefulWidget {
  static const String routeName = 'patientlist';
  PatientListView({Key? key}) : super(key: key);

  @override
  State<PatientListView> createState() => _PatientListViewState();
}

class _PatientListViewState extends State<PatientListView> {
  PatientsModel? patientsModel;
  SeizureModel? seizureModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      patientsModel = await ApiManager.getPatients();
      seizureModel = await ApiManager.getHistorySeizure();
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Patient List'),
      ),
      body: ListView.separated(
        itemCount: patientsModel?.patientDocId?.length ?? 0,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PatientDetails.routeName,
                  arguments: seizureModel!.patientSeizure![
                      seizureModel!.patientSeizure!.indexWhere((element) =>
                          element.email ==
                          patientsModel?.patientDocId?[index].email)]);
            },
            child: Container(
              height: 102,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.grey.withOpacity(.4),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patientsModel?.patientDocId?[index].firstName ?? '',
                        style: TextStyle(fontSize: 19),
                      ),
                      Text(
                        patientsModel?.patientDocId?[index].email ?? '',
                        style: TextStyle(fontSize: 19),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 25);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(QrPage.routeName, arguments: 'doctor')
              .then((value) async {
            patientsModel = await ApiManager.getPatients();
            seizureModel = await ApiManager.getHistorySeizure();
            setState(() {});
          });
          // Add your onPressed functionality here
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.purple.shade300,
      ),
    );
  }
}
