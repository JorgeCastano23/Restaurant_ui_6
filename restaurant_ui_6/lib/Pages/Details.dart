import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_ui_6/Bloc/cart_bloc.dart';
import 'package:restaurant_ui_6/Style/Colors.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    @required this.itemPrice,
    @required this.itemName,
    @required this.imgUrl,
    @required this.ingredients,
  });

  final double itemPrice;
  final String itemName;
  final String imgUrl;
  final String ingredients;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColor,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            }
          ),
          title: Text(
            'Details',
            style: TextStyle(
                fontFamily: 'PlayfairDisplay',
                color: Colors.white,
                fontSize: 30.0,
                fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height - 70.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent),
            Positioned(
                top: 105.0,
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80.0),
                          topRight: Radius.circular(80.0),
                        ),
                        color: Colors.white),
                    height: MediaQuery.of(context).size.height - 100.0,
                    width: MediaQuery.of(context).size.width)),
            Positioned(
                //image
                top: 30.0,
                left: (MediaQuery.of(context).size.width / 2) - 100.0,
                child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 27,
                              offset: Offset(7, 23))
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(imgUrl), fit: BoxFit.fill)),
                    height: 200.0,
                    width: 200.0)),
            Positioned(
                //Bowl name
                top: 260.0,
                left: 40.0,
                right: 25.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                            text: (itemName),
                            style: TextStyle(
                                fontFamily: 'PlayfairDisplay',
                                fontSize: 27,
                                color: Colors.black87),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' BOWL',
                                  style: TextStyle(
                                      fontFamily: 'PlayfairDisplay',
                                      fontSize: 27,
                                      color: Colors.black))
                            ]),
                      )
                    ])),
            Positioned(
                // Item price
                top: 320.0,
                left: 40.0,
                right: 25.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("\$$itemPrice",
                          style: TextStyle(
                              fontFamily: 'PlayfairDisplay',
                              fontSize: 27,
                              fontWeight: FontWeight.w100))
                    ])),
            Positioned(
                //Item ingredients
                top: 390.0,
                left: 40.0,
                right: 25.0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(ingredients,
                          style: TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 17.0,
                          ))
                    ])),
            Positioned(
              //button
              top: 620,
              left: 50,
              right: 50,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: AddDetector(itemName: itemName)),
            ),
          ],
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 220,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(38),
          color: Colors.greenAccent[400]),
      child: Center(
        child: Text(
          'Add',
          style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 3),
        ),
      ),
    );
  }
}

class AddDetector extends StatelessWidget {
  @override
  AddDetector({@required this.itemName});

  final String itemName;

  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    int totalCount = 0;
    if (bloc.cart.length > 0) {
      totalCount = bloc.cart.values.reduce((a, b) => a + b);
    }
    return GestureDetector(
        onTap: () {
          bloc.addToCart(null);
          final snackBar = SnackBar(
            content: RichText(
              text:
                  TextSpan(text: (itemName).toLowerCase(), children: <TextSpan>[
                TextSpan(
                  text: ' bowl has been added',
                )
              ]),
            ),
            duration: Duration(seconds: 1),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: AddButton());
  }
}
