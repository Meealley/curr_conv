import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Controller
  TextEditingController textEditingController = TextEditingController();
  bool hasError = false;
  double result = 0;

  void currConverter() {
    final input = textEditingController.text;
    setState(() {
      if (input.isNotEmpty) {
        result = double.parse(input) * 1025;
        hasError = false;
      } else {
        hasError = true;
      }
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  //this is the border style
  final border = const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, style: BorderStyle.solid),
    borderRadius: BorderRadius.all(
      Radius.circular(8),
    ),
  );
  final error_border = const OutlineInputBorder(
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
        elevation: 0,
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
                Text(
                  'NGN ${result.toStringAsFixed(2)}',
                  style: GoogleFonts.anekOdia(
                    textStyle: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
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
                  controller: textEditingController,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: "Enter the number",
                    hintStyle: GoogleFonts.raleway(
                      textStyle: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: hasError ? Colors.red : Colors.black),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    focusedBorder: hasError ? error_border : border,
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    currConverter();
                  },
                  style: const ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                        Size(double.infinity, 50),
                      ),
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  child: Text(
                    "Convert",
                    style: GoogleFonts.mavenPro(
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
