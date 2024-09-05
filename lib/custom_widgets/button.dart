import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Make sure to add this package in pubspec.yaml

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final FontWeight? fontWeight; // Optional font weight parameter

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontWeight, // Initialize the optional parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * .047,
        width: MediaQuery.of(context).size.width * .35,
        decoration: BoxDecoration(
          color: Color(0xff17003C),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: fontWeight ?? FontWeight.normal, // Use provided fontWeight or default to normal
              ),
            ),
          ),
        ),
      ),
    );
  }
}
