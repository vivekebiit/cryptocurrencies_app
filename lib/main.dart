import 'package:cryptocurrencies_app/model/coin_info.dart';
import 'package:cryptocurrencies_app/model/exchange_info.dart';
import 'package:cryptocurrencies_app/screens/cryptocurrency/coin_details.dart';
import 'package:cryptocurrencies_app/screens/exchange/exchange_details.dart';
import 'package:cryptocurrencies_app/screens/exchange/exchange_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptocurrencies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExchangeListScreen(),
      routes: {
        CoinDetails.routeName: (context) => CoinDetails(
              coinInfo: CoinInfo(),
            ),
        ExchangeDetailsScreen.routeName: (context) => ExchangeDetailsScreen(
              exchangeInfo: ExchangeInfo(),
            ),
      },
    );
  }
}
