import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class loginSucssbottom extends StatelessWidget {
  const loginSucssbottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/image/sucss.png',
            height: 150,
            width: 200,
          ),
          SizedBox(height: 16.0),
          Text(
            'Register Successful',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'You are now Register in to your account.',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(fontSize: 16.0),
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ButtonStyle(),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }
}
