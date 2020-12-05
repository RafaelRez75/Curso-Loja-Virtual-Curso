import 'dart:io';

import 'package:dio/dio.dart';

const token = "0ff19841ed9ad63aca2c4a9121387443";

class CepAbertoService{

  Future<void> getAddressFromCep(String cep) async {
    final cleancep = cep.replaceAll('.', '').replaceAll('-', '');
    final endpoint = "https://www.cepaberto.com/api/v3/cep?cep=$cleancep";

    final Dio dio = Dio();

    dio.options.headers[HttpHeaders.authorizationHeader] = 'Token token=$token';

    try{
      final response = await dio.get<Map>(endpoint);

      if(response.data.isEmpty){
        return Future.error('CEP Inválido');
      }

    // ignore: unused_catch_clause
    } on DioError catch(e){
      return Future.error('Erro ao Buscar CEP');
    }
}

}