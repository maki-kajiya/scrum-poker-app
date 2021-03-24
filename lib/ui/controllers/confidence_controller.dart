import 'package:flutter/material.dart';
import 'package:new_scrum_poker/servicies/product_backlog_item_service.dart';

class ConfidenceController with ChangeNotifier {
  void send(BuildContext context, ProductBacklogItem productBacklogItem) {
    ProductBacklogItemService().send(ProductBacklogItemRequest(
      storyPoint: productBacklogItem.storyPoint,
      name: productBacklogItem.name,
      confidentDegree: productBacklogItem.confidentDegree,
    ));
    // ダイアログを閉じる
    Navigator.pop(context);
    Navigator.pushNamed(context, '/result');
  }
}

class ProductBacklogItem {
  ProductBacklogItem({this.storyPoint, this.name, this.confidentDegree});
  String storyPoint;
  String name;
  int confidentDegree;
}
