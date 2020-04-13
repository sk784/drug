import 'package:drug/core/card_item.dart';
import 'package:drug/core/data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardStackWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: cardItems(context),
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
          feedback: Container(
            height: 250.0,
            width: 250.0,
            child: Card(
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              elevation: 2.0,
              child: Center(
                  child: Text(
                    'Карта номер: ${Provider.of<Data>(context).itemsList[i].content}',
                  )),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(right: _getMargin(Provider.of<Data>(context).itemsList[i],i)),
            child: Container(
              height: 250.0,
              width: 250.0,
              child: Card(
                shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 2.0,
                child: Center(
                    child: Text(
                      'Карта номер: ${Provider.of<Data>(context).itemsList[i].content}',
                    )),
              ),
            ),
          ),
        ));
    }
    return cardItemsList;
  }

  double _getMargin(CardItem card, int count){
    switch (count) {
      case 0:
        return 30.0;
        break;
      case 1:
        return 15.0;
        break;
      default:
        return 0.0;
    }
  }
}
