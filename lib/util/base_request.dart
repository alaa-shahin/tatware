import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:tatware/util/util_function.dart';

import '../../../index.dart';
import '../../util/constants.dart';
import '../global_widget/loading_widget.dart';
import '../global_widget/no_network_widget.dart';

class BaseRequest {
  static Future<dynamic> dynamicRequest({
    required String path,
    RequestType requestType = RequestType.get,
    dynamic body,
    bool showDialog = true,
  }) async {
    WidgetsBinding.instance.addPostFrameCallback((s) async {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        NoNetworkWidget();
        return;
      }
      if (showDialog) {
        showToastWidget(
          LoadingWidget(),
          duration: Duration(seconds: 8),
          dismissOtherToast: true,
        );
      }
    });
    final Dio _dio = Dio();
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    _dio.options.baseUrl = Constants.domainUrl;
    try {
      var response = await _dio.request(
        path,
        options: Options(
          method: "$requestType".split(".").last,
        ),
        data: body,
      );
      _dio.close();
      if (response.statusCode! < 300) {
        dismissAllToast();
        return response.data;
      } else {
        showErrorToast('Something went wrong');
      }
    } on DioError {
      showErrorToast('Something went wrong');
      return null;
    }
  }
}

enum RequestType { get, post, put, delete }
