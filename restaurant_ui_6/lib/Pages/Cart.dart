import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_ui_6/Bloc/cart_bloc.dart';
import 'package:restaurant_ui_6/Style/Colors.dart';
import 'package:restaurant_ui_6/Model/Items.dart';


class CartScreen extends StatelessWidget {
  CartScreen({Key key}) : super(key: key);

  // CartScreen({
  // @required this.imgUrl,
  // @required this.itemName,
  // @required this.itemPrice
  // });

  // final double itemPrice;
  // final String itemName;
  // final String imgUrl;

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);
    var cart = bloc.cart;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: gradientColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
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
            'Tu Carrito',
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w500
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            int giftIndex = cart.keys.toList()[index];
            int count = cart[giftIndex];
          }
        )
      ),
    );
  }
}
