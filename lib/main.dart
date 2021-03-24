import 'package:flutter/material.dart';
import 'package:new_scrum_poker/UI/pages/fibonacci_page.dart';
import 'package:new_scrum_poker/servicies/product_backlog_item_service.dart';
import 'package:new_scrum_poker/ui/pages/confidence_page.dart';
import 'package:new_scrum_poker/ui/pages/result_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductBacklogItemService>.value(
          value: ProductBacklogItemService(),
        )
      ],
      child: MaterialApp(
        // DEBUGバナーを消す
        debugShowCheckedModeBanner: false,
        //home: FibonacciPage(),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => FibonacciPage(),
          '/home': (BuildContext context) => FibonacciPage(),
          '/confidence': (BuildContext context) => ConfidenceDialog(),
          '/result': (BuildContext context) => ResultPage(),
        },
      ),
    );
  }
}
