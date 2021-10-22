import 'package:cryptocurrencies_app/model/coin_info.dart';
import 'package:flutter/material.dart';

class CoinDetails extends StatelessWidget {
  const CoinDetails({Key? key, required this.coinInfo}) : super(key: key);
  static const String routeName = '"/coin_details"';

// Declare a field that holds the Todo.
  final CoinInfo coinInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinInfo.name)),
    );
  }
}
