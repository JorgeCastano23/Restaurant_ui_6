import 'package:flutter/material.dart';
import 'package:restaurant_ui_6/Pages/Cart.dart';
import 'package:restaurant_ui_6/Pages/Home.dart';
import 'Bloc/cart_bloc.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CartBloc>(
      create: (context) => CartBloc(),
      child: MaterialApp(
        title: 'Restaurant_ui_6',
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
