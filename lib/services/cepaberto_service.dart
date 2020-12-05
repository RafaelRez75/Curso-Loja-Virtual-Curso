import 'dart:io';

import 'package:dio/dio.dart';
import 'package:lojavirtual/models/cepaberto_address.dart';

const token = "0ff19841ed9ad63aca2c4a9121387443";

class CepAbertoService{

  Future<CepAbertoAddress> getAddressFromCep(String cep) async {
    final cleancep = cep.replaceAll('.', '').replaceAll('-', '');
    final endpoint = "https://www.cepaberto.com/api/v3/cep?cep=$cleancep";

    final Dio dio = Dio();

    dio.options.headers[HttpHeaders.authorizationHeader] = 'Token token=$token';

    try{
      final response = await dio.get<Map<String, dynamic>>(endpoint);

      if(response.data.isEmpty){
        return Future.error('CEP Inválido');
      }

      final CepAbertoAddress address = CepAbertoAddress.fromMap(response.data);

      return address;
    // ignore: unused_catch_clause
    } on DioError catch(e){
      return Future.error('Erro ao Buscar CEP');
    }
}

}