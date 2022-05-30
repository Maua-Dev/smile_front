import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  String message = '';

  DioExceptions.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = "Requisição para o servidor foi cancelada";
        break;
      case DioErrorType.connectTimeout:
        message = "Tempo de conexão com o servidor API expirou";
        break;
      case DioErrorType.other:
        message =
            "Conexão com o servidor falhou por falta de conexão com a internet";
        break;
      case DioErrorType.receiveTimeout:
        message = "Tempo de resposta de conexão com o servidor expirou";
        break;
      case DioErrorType.response:
        message = dioError.response != null
            ? _handleError(dioError.response!.statusCode!)!
            : 'Erro de resposta da URL';
        break;
      case DioErrorType.sendTimeout:
        message = "Tempo de envio de requisição servidor expirou";
        break;
      default:
        message = "Algo deu errado";
        break;
    }
  }

  String? _handleError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return '400: Bad request';
      case 404:
        return '404: Not Found';
      case 500:
        return '500: Internal server error';
      case null:
        return 'Ops algo deu errado';
      default:
        return 'Ops algo deu errado';
    }
  }

  @override
  String toString() => message;
}
