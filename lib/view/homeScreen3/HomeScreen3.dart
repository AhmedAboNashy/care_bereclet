
import 'package:care_brecelet/view/homeScreen3/signOut/SignOut.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../homeScreen/DeleteAccount/DeleteAccountFragment.dart';
import '../homeScreen/F&Q/F&Q_Fragment.dart';
import '../homeScreen/Privacy/Privacy_Policy.dart';
import '../homeScreen/comolaints/Complaints.dart';
import '../homeScreen/patientList/Patient.dart';
import '../homeScreen/signOut/SignOut.dart';
import '../screens/generate_qrcode.dart';
import 'Home3.dart';
import 'HomeDrawer3.dart';

class HomeScreen3 extends StatefulWidget {
  static const String routeName = 'Home3';
   HomeScreen3({Key? key}) : super(key: key);

  @override
  State<HomeScreen3> createState() => _HomeScreenState3();
}

class _HomeScreenState3 extends State<HomeScreen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDAD1F4),
      drawer: Container(
          child: HomeDrawer3(onMenuItemClick),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading: HomeDrawer2(onMenuItemClick),
        centerTitle: true,
        title: Text('Home', style: TextStyle(fontWeight: FontWeight.bold , color: Colors.white)),

      ),
      body: selectedWidget,
    );
  }

  Widget selectedWidget= Home3();

  void onMenuItemClick(MenuItem item){
    Navigator.pop(context);
    switch(item){
      case MenuItem.Home : {
        selectedWidget = Home3();
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
      case MenuItem.signOut3 : {
        selectedWidget= SignOut3();
      }
      case MenuItem.complaints : {
        selectedWidget = ComplaintsFragment(role: 'guardian',);

      }
    }
    setState(() {

    });
  }
}
