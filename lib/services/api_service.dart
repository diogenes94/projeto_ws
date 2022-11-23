import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:projeto_ws/constants.dart';
import 'package:projeto_ws/model/user_model.dart';

/// Classe responsável por criar a chamada do serviço */
class ApiService {
  // ignore: slash_for_doc_comments
  /** Chama um Future - é um recurso da programação assíncrona, 
   * pois ele indica que algo será retornado no futuro. 
   * O async diz que nossa chamada é assícrona
   * E o await diz que dentro da execução do método assícrono ele deverá
   * aguardar a resposta para continuar
   * */
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      print(url);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
