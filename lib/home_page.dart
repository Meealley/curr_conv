import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final border = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, style: BorderStyle.solid),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );
  final error_border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Convert your Currency",
              style: GoogleFonts.arsenal(
                  textStyle: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w600))),
        ),
        body: WillPopScope(
          onWillPop: () async {
            // Prevent back navigation by returning false.
            return false;
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "0",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "What currency are you planning to convert?💵",
                    style: GoogleFonts.manrope(
                      textStyle: const TextStyle(
                        fontSize: 21,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    onSubmitted: (value) => debugPrint(value),
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      hintText: "Enter the number",
                      hintStyle: GoogleFonts.raleway(
                        textStyle: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      focusedBorder: border,
                      errorBorder: error_border,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
