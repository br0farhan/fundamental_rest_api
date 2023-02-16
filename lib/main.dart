import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundamental_rest_api/model/sample.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Sample? result;

  Future _loadJsonSample() async {
    String jsonString = await rootBundle.loadString("assets/sample.json");
    //Process Mapping Data
    final jsonData = jsonDecode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
      result = sample;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fundamental Parsing JSON",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Fundamental Parsing JSON"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    _loadJsonSample();
                  },
                  child: const Text("Read JSON data")),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('$result'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
