import 'package:care_brecelet/view/homeScreen/DeleteAccount/DeleteAccountFragment.dart';
import 'package:care_brecelet/view/homeScreen/F&Q/F&Q_Fragment.dart';
import 'package:care_brecelet/view/homeScreen/Privacy/Privacy_Policy.dart';
import 'package:care_brecelet/view/homeScreen/comolaints/Complaints.dart';
import 'package:care_brecelet/view/homeScreen/patientList/Patient.dart';
import 'package:care_brecelet/view/homeScreen/patient_list.dart';
import 'package:care_brecelet/view/homeScreen/signOut/SignOut.dart';
import 'package:flutter/material.dart';

import 'HomeDrawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAD1F4),
      // backgroundColor: Colors.white,
      drawer: HomeDrawer(onMenuItemClick),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: selectedWidget,

      // Column(
      //   children: [
      //     GestureDetector(
      //       onTap: () {
      //         Navigator.pushNamed(context, PatientListView.routeName,);
      //       },
      //       child: Container(
      //         margin: EdgeInsets.symmetric(horizontal: 24),
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(16),
      //           color: Colors.grey.withOpacity(.5)
      //         ),
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 12),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text('Pationt List'),
      //               Icon(Icons.arrow_forward_outlined)
      //             ],
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }

  Widget selectedWidget= Patient();

  void onMenuItemClick(MenuItem item){
    Navigator.pop(context);
    switch(item){
      case MenuItem.patient : {
        selectedWidget = Patient();
      }
      case MenuItem.F_Q : {
        selectedWidget = F_Q();
      }
      case MenuItem.deleteAccount : {
        selectedWidget = DeleteAccount();
      }
      case MenuItem.privacy : {
        selectedWidget = PrivacyPolicyFragment();
      }
      case MenuItem.signOut : {
        selectedWidget= SignOut();
      }
      case MenuItem.complaints : {
        selectedWidget = ComplaintsFragment(role: 'doctor',);

      }
    }
    setState(() {

    });
  }
}
