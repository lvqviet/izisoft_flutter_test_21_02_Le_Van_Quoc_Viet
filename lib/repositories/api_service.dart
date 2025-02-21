// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:izi_app/commons/utils.dart';
import 'package:izi_app/models/base_response_model.dart';


const pageSizeResult = 20;

class ApiService extends BaseService {
  ApiService() {
    initApiService();
  }

  Future<BaseResponseModel> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Function(String)? customErrorRes,
    Function(DioException)? customErrorCatch,
    bool printLog = true,
  }) async {
    try {
      logRequest(
        url: path,
        method: 'GET',
        query: queryParameters,
        printLog: printLog,
      );
      final res = await _dio.get(path, queryParameters: queryParameters);
      logResponse(res, printLog: printLog);
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: responseData(res));
      } else {
        EasyLoading.dismiss();
        if (customErrorRes != null) {
          customErrorRes.call(getMegError(res));
        } else {
          Get.showSnackbar(GetSnackBar(message: getMegError(res)));
        }
      }
    } catch (e) {
      if (customErrorCatch != null) {
        customErrorCatch.call(e as DioException);
      } else {
        checkError(e as DioException);
      }
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }

  Future<BaseResponseModel> post(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Function(String)? customErrorRes,
    Function(DioException)? customErrorCatch,
    bool printLog = true,
  }) async {
    try {
      logRequest(
        url: path,
        method: 'POST',
        body: data,
        query: queryParameters,
        printLog: printLog,
      );
      final res = await _dio.post(path, queryParameters: queryParameters, data: data);
      logResponse(res, printLog: printLog);
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: responseData(res));
      } else {
        EasyLoading.dismiss();
        if (customErrorRes != null) {
          customErrorRes.call(getMegError(res));
        } else {
                    Get.showSnackbar(GetSnackBar(message: getMegError(res)));
        }
      }
    } catch (e) {
      if (customErrorCatch != null) {
        customErrorCatch.call(e as DioException);
      } else {
        checkError(e as DioException);
      }
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }

  Future<BaseResponseModel> put(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool printLog = true,
  }) async {
    try {
      logRequest(
        url: path,
        method: 'PUT',
        body: data,
        query: queryParameters,
        printLog: printLog,
      );
      final res = await _dio.put(path, queryParameters: queryParameters, data: data);
      logResponse(res, printLog: printLog);
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: responseData(res));
      } else {
        EasyLoading.dismiss();
                  Get.showSnackbar(GetSnackBar(message: getMegError(res)));
      }
    } catch (e) {
      checkError(e as DioException);
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }

  Future<BaseResponseModel> patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool printLog = true,
  }) async {
    try {
      logRequest(
        url: path,
        method: 'PATCH',
        body: data,
        query: queryParameters,
        printLog: printLog,
      );
      final res = await _dio.patch(path, queryParameters: queryParameters, data: data);
      logResponse(res, printLog: printLog);
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: responseData(res));
      } else {
        EasyLoading.dismiss();
                  Get.showSnackbar(GetSnackBar(message: getMegError(res)));

      }
    } catch (e) {
      checkError(e as DioException);
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }

  Future<BaseResponseModel> delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool printLog = true,
  }) async {
    try {
      logRequest(
        url: path,
        method: 'DELETE',
        body: data,
        query: queryParameters,
        printLog: printLog,
      );
      final res = await _dio.delete(path, queryParameters: queryParameters, data: data);
      logResponse(res, printLog: printLog);
      if (isSuccess(res)) {
        return BaseResponseModel(isSuccess: true, data: responseData(res));
      } else {
        EasyLoading.dismiss();
                  Get.showSnackbar(GetSnackBar(message: getMegError(res)));

      }
    } catch (e) {
      checkError(e as DioException);
    }
    return BaseResponseModel(isSuccess: false, data: null);
  }

}

abstract class BaseService {
  late Dio _dio;
  String? _token;

  void initApiService() {
    final headers = <String, dynamic>{
      'content-type': 'application/json',
      'accept': 'application/json',
    }..removeWhere((key, value) => value == null);
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://6551f0255c69a77903294d34.mockapi.io/v1/',
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json,
        headers: headers,
      ),
    );
  }

  String? get token => _token;

  Future<void> setToken(String? token) async {
    final box = GetStorage();
    _token = token;
    initApiService();
    if (token == null) {
      await box.remove('token');
    } else {
      await box.write('token', token);
    }
  }

  bool isAuthorized() {
    return _token?.isNotEmpty == true;
  }

  bool _checkStatusCodeIsSuccess(dynamic code) {
    try {
      if (code is int) {
        return code >= 200 && code < 300;
      } else {
        final codeInt = int.tryParse(code);
        return codeInt == null ? false : codeInt >= 200 && codeInt < 300;
      }
    } catch (e) {
      return false;
    }
  }

  bool isSuccess(dio.Response response) {
    try {
      return _checkStatusCodeIsSuccess(response.statusCode) ||
          (_checkStatusCodeIsSuccess(response.data?['code']) ||
              response.data?['status'] != 'error');
    } catch (e) {
      return false;
    }
  }

  String getMegError(dio.Response response) {
    return response.data['message'];
  }

  dynamic responseData(var response) {
    try {
      if (response.data['data'] == null) {
        return response.data;
      }
      return response.data['data'];
    } catch (e) {
      return response.data;
    }
  }

  void checkError(DioException e) {
    EasyLoading.dismiss();
    Get.log('---ERROR---\n${e.toString()}');
    if (e.response?.statusCode == 401) {
      // DialogUtil.showDialog(
      //   description: 'Your login session has expired. Please re-login.',
      //   actionButtonTitle: 'Login',
      //   onTap: () {
      //     Get.find<AppController>().onLogout();
      //   },
      //   isShowClose: false,
      //   barrierDismissible: false,
      // );
    } else {
      try {
        Get.showSnackbar(e.response!.data['message']);
      } catch (e) {
        Get.showSnackbar(const GetSnackBar(message: 'An error occurred!'));
      }
    }
  }
}

void logRequest({
  required String url,
  required String method,
  Map<String, String>? headers,
  Map<String, dynamic>? query,
  dynamic body,
  bool printLog = true,
}) {
  if (printLog == false) return;
  final log = '-------- REQUEST -----------\n'
      'url: $url\n'
      'method: $method\n'
      'headers: $headers\n'
      'query: ${beautifyJson(query)}\n'
      "${body != null ? "body: ${beautifyJson(body)}" : ""}";
  if (kDebugMode) {
    Get.log(log);
  }
}

void logResponse(
  dio.Response response, {
  bool printLog = true,
}) {
  if (printLog == false) return;
  final log = '-------- RESPONSE -----------\n'
      'url: ${response.requestOptions.path}\n'
      'statusCode: ${response.statusCode}\n'
      "token: ${response.requestOptions.headers['Authorization']}\n"
      'json: ${beautifyJson(response.data)}';
  if (kDebugMode) {
    Get.log(log);
  }
}
