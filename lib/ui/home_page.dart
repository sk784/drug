import 'package:drug/core/card_item.dart';
import 'package:drug/core/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'card_stack_widget.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  List<Widget> cardList;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 30,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: DragTarget(builder:
                    (context, List<CardItem> cd, rd) {
                  return Container();
                },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text("Карточка ушла налево!")));
                      Provider.of<Data>(context).removeLastItem();
                    }
                ),
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    width: 240.0,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    child: Center(
                        child: CardStackWidget())
                )
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 30,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                child: DragTarget(builder:
                    (context, List<CardItem> cd, rd) {
                  return Container();
                 },
                    onWillAccept: (data) {
                      return true;
                    },
                    onAccept: (data) {
                      scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text("Карточка ушла направо!")));
                      Provider.of<Data>(context).removeLastItem();
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}