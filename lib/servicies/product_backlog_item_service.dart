import 'dart:convert';

import 'package:flutter/foundation.dart'; // *.freezed.dartで必要なのでimportしておく
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;

part 'product_backlog_item_service.freezed.dart';
part 'product_backlog_item_service.g.dart';

class ProductBacklogItemService {
  Future<void> send(ProductBacklogItemRequest request) async {
    final client = http.Client();
    final String url =
        'http://192.168confident_degree.1.5:3100/product-backlog-item';
    await client.post(url, body: json.encode(request));
  }
}

@freezed
abstract class ProductBacklogItemRequest with _$ProductBacklogItemRequest {
  const factory ProductBacklogItemRequest({
    @JsonKey(name: 'story_point') String storyPoint,
    String name,
    @JsonKey(name: 'confident_degree') int confidentDegree,
  }) = _ProductBacklogItemRequest;

  factory ProductBacklogItemRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductBacklogItemRequestFromJson(json);
}
