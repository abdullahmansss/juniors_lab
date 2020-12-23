import 'package:courses/shared/styles/style.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final GlobalKey<ExpansionTileCardState> cardA = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ExpansionTileCard(
          key: cardA,
          borderRadius: BorderRadius.circular(
            0.0,
          ),
          title: Text('Tap me!'),
          trailing: null,
          children: <Widget>[
            Text('test'),
          ],
        ),
      ),
    );
  }
}
