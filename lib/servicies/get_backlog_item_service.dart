import 'dart:convert';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart'; // *.freezed.dartで必要なのでimportしておく

part 'get_backlog_item_service.freezed.dart';
part 'get_backlog_item_service.g.dart';

@freezed
abstract class GetBacklogItemResponse with _$GetBacklogItemResponse {
  const factory GetBacklogItemResponse({
    String story_point,
    String name,
    int confident_degree,
  }) = _GetBacklogItemResponse;

  factory GetBacklogItemResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBacklogItemResponseFromJson(json);
}

class GetBacklogItemServise {
  final url = 'http:';
  Future<GetBacklogItemResponse> getBacklogItems() async {
    final client = http.Client();
    final String url = 'http://localhost:3000/product-backlog-items';
    final response = await client.get(url);
    final _decodedResponse = utf8.decode(response.bodyBytes);
    dynamic body;
    if (_decodedResponse.isNotEmpty) {
      body = await jsonDecode(_decodedResponse);
    }
    if (response.statusCode < 300) {
      return GetBacklogItemResponse.fromJson(body);
    }
  }
}
