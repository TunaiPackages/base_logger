import 'package:aws_cloudwatch/aws_cloudwatch.dart';
import 'package:flutter/material.dart';

abstract class BaseCloudWatch {
  String get awsAccessKey;
  String get awsSecretKey;
  String get region;
  String get groupName;
  String get streamName;

  Future<void> log(String message) async {
    try {
      final CloudWatch cloudWatch = CloudWatch(
        awsAccessKey: awsAccessKey,
        awsSecretKey: awsSecretKey,
        region: region,
        groupName: groupName,
        streamName: streamName,
      );
      return cloudWatch.log(message);
    } catch (e) {
      debugPrint('$runtimeType log error: $e');
    }
  }
}
