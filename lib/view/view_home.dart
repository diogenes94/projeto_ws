import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController textController = TextEditingController();
  String texto = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Testando inputs')),
      body: Column(children: [
        TextField(
          controller: textController,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              texto = textController.text;
            });
          },
          child: Text('Ok'),
        ),
        Text('Rua: $texto'),
      ]),
    );
  }
}
