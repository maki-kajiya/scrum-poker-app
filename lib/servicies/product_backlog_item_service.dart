import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart'; // *.freezed.dartで必要なのでimportしておく

part 'product_backlog_item_service.freezed.dart';
part 'product_backlog_item_service.g.dart';

class ProductBacklogItemService {
  Future<void> send(ProductBacklogItemRequest request) async {
    final client = http.Client();
    final String url = 'http://localhost:3000/product-backlog-item';
    await client.post(url, body: request.toJson());
  }
}

@freezed
abstract class ProductBacklogItemRequest with _$ProductBacklogItemRequest {
  const factory ProductBacklogItemRequest({
    String story_point,
    String name,
    int confident_degree,
  }) = _ProductBacklogItemRequest;

  factory ProductBacklogItemRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductBacklogItemRequestFromJson(json);
}
