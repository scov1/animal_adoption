import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class RootGatewayState extends Equatable {
  RootGatewayState({this.authError}) : key = UniqueKey();

  final DioException? authError;
  final LocalKey key;

  @override
  List<Object?> get props => [key];
}
