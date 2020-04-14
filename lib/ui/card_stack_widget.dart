import 'package:drug/core/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardStackWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: Provider
          .of<Data>(context)
          .itemsList
          .length> 3 ? cardItems(context).sublist(Provider
          .of<Data>(context)
          .itemsList
          .length -3):cardItems(context),
    );
  }

  List<Widget> cardItems(BuildContext context) {
    List<Widget> cardItemsList = [];
    for (int i = 0; i < Provider
        .of<Data>(context)
        .itemsList
        .length; i++) {

      cardItemsList.add(
        Draggable(
          data: Provider.of<Data>(context).itemsList[i],
          childWhenDragging:Container(),
          feedback: _buildDraggableWidget('Карта номер: ${Provider.of<Data>(context).itemsList[i].content}'),
          child: Padding(
            padding: EdgeInsets.only(right: _getMargin(Provider.of<Data>(context).itemsList.length,i)),
            child: _buildDraggableWidget('Карта номер: ${Provider.of<Data>(context).itemsList[i].content}')
          ),
        ));
    }
    return cardItemsList;
  }

  double _getMargin(int length,int count){
    if (count==length-1){
      print(20.0);
      return 20.0;
    } else if (count==length-2){
      print(10.0);
      return 10.0;
    } else {
      print(0.0);
      return 0.0;
    }
  }

  Widget _buildDraggableWidget(String cardNumber) =>
      Container(
        height: 250.0,
        width: 250.0,
        child: Card(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          elevation: 2.0,
          child: Center(
              child: Text(cardNumber)
          ),
        ),
      );
}
