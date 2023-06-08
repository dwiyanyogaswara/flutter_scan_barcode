import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: const Text('Barcode Scanner'),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    var res = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const SimpleBarcodeScannerPage()));
                    setState(() {
                      if (res is String) {
                        if (res == '-1') {
                          result = '';
                        } else {
                          result = res;
                        }
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      minimumSize: const Size(20, 70),
                      maximumSize: const Size(200, 70)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.document_scanner,
                        size: 30,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        'SCAN',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 30,
                            letterSpacing: 1,
                            color: Colors.black),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(35),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                        width: 3, style: BorderStyle.solid, color: Colors.grey),
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    const Text(
                      'Result:',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      result,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        letterSpacing: 1,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
