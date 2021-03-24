import 'dart:ui';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_scrum_poker/servicies/get_backlog_item_service.dart';
import 'package:new_scrum_poker/ui/common_components/space_box.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final _contentsBackgroundColor = Colors.teal[100];
  bool _isLoading = false;

  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      // TODO: controllerクラスでserviceクラスを呼び出す。
      // ローディングも？State管理だめ
      //dynamic response = await GetBacklogItemServise().getBacklogItems();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildBody(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: _contentsBackgroundColor,
      leading: IconButton(
        icon: const Icon(
          Icons.close,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title:
          Text('Result', style: TextStyle(fontSize: 40, color: Colors.white)),
      centerTitle: true,
      elevation: 0.0,
      brightness: Brightness.light,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      color: _contentsBackgroundColor,
      child: Column(
        children: <Widget>[
          _buildBubbleList(context),
        ],
      ),
    );
  }

  // TODO:APIのレスポンスをListに入れる
  List<int> storyPointList = [3, 2, 3, 1];
  List<String> confidentList = ['自信あり', '普通', '自信なし', '普通'];
  List<String> nameList = ['maki', '牧', '巻き', 'カジマキ'];

  Widget _buildBubbleList(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: double.maxFinite,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: storyPointList.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SpaceBox.height(20),
                    Text(nameList[index],
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    Icon(
                      // TODO:confident_degreeの値に応じて顔文字のアイコンを変える
                      // icons:sentiment_very_satisfied = smile, sentiment_neutral = neutral, sentiment_very_dissatisfied = bad
                      Icons.sentiment_very_dissatisfied,
                      size: 50,
                      color: Colors.white,
                    )
                  ],
                ),
                Bubble(
                  margin: BubbleEdges.only(top: 30, left: 20),
                  padding: BubbleEdges.symmetric(horizontal: 50, vertical: 20),
                  alignment: Alignment.topLeft,
                  nip: BubbleNip.leftBottom,
                  child: Column(
                    children: <Widget>[
                      Text(
                        storyPointList[index].toString(),
                        style: TextStyle(fontSize: 40, color: Colors.grey[500]),
                      ),
                      // Text(confidentList[index]),
                    ],
                  ),
                  // shadowColor: Colors.blueGrey,
                  // elevation: 0,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
