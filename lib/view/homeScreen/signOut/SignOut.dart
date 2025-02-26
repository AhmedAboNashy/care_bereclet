import 'package:care_brecelet/model/loginScreen.dart';
import 'package:flutter/material.dart';

class SignOut extends StatelessWidget {
  Future<void> _navigateAfterDelay(BuildContext context) async {
    // Show CircularProgressIndicator
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dialog from being dismissed
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // Delay for 3 seconds
    await Future.delayed(Duration(seconds: 3));

    // Navigate to the next page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => loginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Start the process to navigate after delay
            _navigateAfterDelay(context);
          },
          child: Text('Sign out'),
        ),
      ),
    );
  }
}
