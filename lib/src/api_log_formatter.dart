import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiLogFormatter {
  Map<String, dynamic> _getInfoJson() {
    return {};
    // String version = 'v${VersionTracker().version}';
    // final deviceInfo = DeviceInfoHelper.deviceInfo;

    // return {
    //   'outletID': _outletID,
    //   'userName': _userName,
    //   'bizType': _bizType,
    //   'version': version,
    //   'deviceInfo': deviceInfo,
    // };
  }

  Map<String, dynamic> formatResponse({
    required int responseMs,
    required http.BaseRequest request,
    required http.StreamedResponse response,
  }) {
    final Map<String, dynamic> logJson = {
      'responseMs': responseMs,
      ..._getRequestJson(request),
      ..._getResponseJson(response),
      ..._getInfoJson(),
    };

    return logJson;
  }

  Map<String, dynamic> formatSendFailed({
    required http.BaseRequest request,
    required dynamic message,
  }) {
    final Map<String, dynamic> logJson = {
      'type': 'SEND FAILED',
      'message': message,
      ..._getRequestJson(request),
      ..._getInfoJson(),
    };

    return logJson;
  }

  Map<String, dynamic> formatError({
    required http.BaseRequest request,
    required http.StreamedResponse response,
    required String returnedBody,
    required int responseMs,
  }) {
    final Map<String, dynamic> logJson = {
      'type': 'ERROR',
      'responseMs': responseMs,
      ..._getRequestJson(request),
      ..._getResponseJson(response),
      'returnedBody': returnedBody,
      ..._getInfoJson(),
    };

    return logJson;
  }

  Map<String, dynamic> formatTimeOut({
    required http.BaseRequest request,
    required Duration timeoutDuration,
  }) {
    final Map<String, dynamic> logJson = {
      'type': 'TIMEOUT',
      'timeoutDurationMs': timeoutDuration.inMilliseconds,
      ..._getRequestJson(request),
      ..._getInfoJson(),
    };

    return logJson;
  }

  Map<String, dynamic> _getRequestJson(
    http.BaseRequest request,
  ) {
    try {
      final url = request.url.toString();
      final host = request.url.host;
      final uuid = request.headers['uuid'] ?? '';
      final contentType = request.headers['Content-Type'] ?? '';
      Map<String, dynamic> bodyJson = {};
      if (request is http.Request) {
        if (contentType.contains('application/json')) {
          try {
            bodyJson = jsonDecode(request.body);
          } catch (e) {
            bodyJson = {};
          }
        }
      }

      final bodyFields = request is http.Request &&
              contentType.contains('application/x-www-form-urlencoded')
          ? request.bodyFields
          : {};

      return {
        'method': request.method,
        'url': url,
        'uuid': uuid,
        'host': host,
        if (contentType.isNotEmpty) 'contentType': contentType,
        if (bodyJson.isNotEmpty) 'bodyJson': bodyJson,
        if (bodyFields.isNotEmpty) 'bodyFields': bodyFields,
      };
    } catch (e) {
      debugPrint('ApiLogFormatter _getRequestJson error: $e');
      return {};
    }
  }

  Map<String, dynamic> _getResponseJson(
    http.StreamedResponse response,
  ) {
    try {
      final code = response.statusCode;
      final reason = response.reasonPhrase ?? '';
      return {
        'responseCode': code,
        if (reason.isNotEmpty) 'responseReason': reason,
      };
    } catch (e) {
      debugPrint('ApiLogFormatter _getResponseJson error: $e');
      return {};
    }
  }

  // String _formatJson(Map<String, dynamic> json, {int indent = 0}) {
  //   String formattedString = '{\n';
  //   String indentStr = ' ' * (indent + 2);

  //   json.forEach((key, value) {
  //     formattedString += '$indentStr"$key": ';

  //     if (value is Map<String, dynamic>) {
  //       formattedString += '${_formatJson(value, indent: indent + 2)},\n';
  //     } else if (value is List) {
  //       formattedString += '[\n';
  //       for (var item in value) {
  //         if (item is Map<String, dynamic>) {
  //           formattedString +=
  //               '$indentStr  ${_formatJson(item, indent: indent + 2)},\n';
  //         } else {
  //           formattedString += '$indentStr  "$item",\n';
  //         }
  //       }
  //       formattedString += '$indentStr],\n';
  //     } else {
  //       formattedString += '"$value",\n';
  //     }
  //   });

  //   formattedString += '${' ' * indent}}';
  //   return formattedString;
  // }
}
