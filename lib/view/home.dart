import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_ws/model/user_model.dart';
import 'package:projeto_ws/services/api_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UserModel> _userModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApiService().getUsers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    _userModel.forEach((usm) {
      print('Nome: ${usm.name}');
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API - CPU 2022'),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Text('Dados carregados.'),
    );
  }
}
