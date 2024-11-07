import 'dart:convert';

import 'package:basic_structure/main.dart';
import 'package:basic_structure/src/utils/custom_talkerLog.dart';
import 'package:basic_structure/src/utils/log_message.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

import 'package:talker_http_logger/talker_http_logger.dart';

class ApiClient {
  ApiClient();
  static const int timeoutRequest = 60;

  final client = InterceptedClient.build(interceptors: [
    TalkerHttpLogger(
      talker: talker,
    ),
  ]);

  final Map<String, String> _mainHeaders = {
    'Content-Type': 'application/json',
    'Vary': 'Accept',
  };

  ///get http request supported
  Future<http.Response> getData({
    required String url,
    Uri? uri,
    String? token,
    Map<String, String>? headers,
    int? timeOut,
  }) async {
    if (uri != null) {
      logMessage(title: "parse uri", message: uri);
    } else {
      logMessage(title: "parse url", message: Uri.parse(url));
    }

    http.Response response = await client
        .get(
      uri ?? Uri.parse(url),
      headers:
          headers ?? (token != null ? currentUserHeader(token) : _mainHeaders),
    )
        .timeout(
      Duration(seconds: timeOut ?? timeoutRequest),
      onTimeout: () {
        return http.Response(
            addedErrorMessage(), 408); // Replace 500 with your http code.
      },
    );
    talker.logTyped(
      ShowResponseLog(
        'GET: Request URL: ${response.request?.url} \n Response Status: ${response.body}',
      ),
    );
    // talker.log('Response Status: ${response.body}');
    return response;
  }

  static Map<String, String> currentUserHeader(String token) {
    Map<String, String> mainHeaders = {
      'Content-Type': 'application/json',
      'Vary': 'Accept',
      'Authorization': 'Bearer $token',
    };
    return mainHeaders;
  }

  String addedErrorMessage({String message = 'error'}) {
    return '{"error": "$message"}';
  }

  Future<http.Response> postData({
    required String url,
    dynamic body,
    String? token,
    Map<String, String>? headers,
    int? timeOut,
  }) async {
    logMessage(title: 'post url', message: url);
    logMessage(title: 'post body', message: jsonEncode(body));
    logMessage(title: 'post token', message: token);

    http.Response response = await client
        .post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers:
          headers ?? (token != null ? currentUserHeader(token) : _mainHeaders),
    )
        .timeout(
      Duration(seconds: timeOut ?? timeoutRequest),
      onTimeout: () {
        return http.Response(
            addedErrorMessage(), 408); // Replace 500 with your http code.
      },
    );
    talker.logTyped(
      ShowResponseLog(
        'POST: Request URL: ${response.request?.url} \n POST BODY:${jsonEncode(body)}  \n Response Status: ${response.body}',
      ),
    );

    // logMessage(
    //     title: 'post response url: ${Uri.parse(url)}', message: response.body);
    return response;
  }

  /// delete http request supported
  Future<http.Response> deleteData({
    required String url,
    String? token,
    Map<String, String>? headers,
    int? timeOut,
  }) async {
    http.Response response = await http
        .delete(
      Uri.parse(url),
      headers:
          headers ?? (token != null ? currentUserHeader(token) : _mainHeaders),
    )
        .timeout(
      Duration(seconds: timeOut ?? timeoutRequest),
      onTimeout: () {
        return http.Response(
            addedErrorMessage(), 408); // Replace 500 with your http code.
      },
    );
    talker.logTyped(
      ShowResponseLog(
        'DELETE: Request URL: ${response.request?.url} \n Response Status: ${response.body}',
      ),
    );
    return response;
  }

  ///put http request supported
  Future<http.Response> putData({
    required String url,
    dynamic body,
    String? token,
    Map<String, String>? headers,
    int? timeOut,
  }) async {
    http.Response response = await http
        .put(
      Uri.parse(url),
      body: jsonEncode(body),
      headers:
          headers ?? (token != null ? currentUserHeader(token) : _mainHeaders),
    )
        .timeout(
      Duration(seconds: timeOut ?? timeoutRequest),
      onTimeout: () {
        return http.Response(
          addedErrorMessage(),
          408,
        ); // Replace 500 with your http code.
      },
    );
    talker.logTyped(
      ShowResponseLog(
        'PUT: Request URL: ${response.request?.url} \n Response Status: ${response.body}',
      ),
    );

    return response;
  }
}
