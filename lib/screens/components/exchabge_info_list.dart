import 'package:cryptocurrencies_app/model/exchange_info.dart';
import 'package:flutter/material.dart';

class ExchangeInfoRowItem extends StatelessWidget {
  final ExchangeInfo info;

  const ExchangeInfoRowItem({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                width: 45,
                height: 45,
                child: FadeInImage(
                  placeholder: const AssetImage('placeholder.png'),
                  image: NetworkImage(
                      'https://s2.coinmarketcap.com/static/img/exchanges/64x64/'
                      '${info.id}'
                      ".png"),
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  fadeInDuration: const Duration(milliseconds: 200),
                  fadeInCurve: Curves.linear,
                ),
              ),
              const Padding(padding: EdgeInsets.only(right: 8)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info.name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        )),
        const IconButton(
            iconSize: 14.0,
            onPressed: null,
            icon: Icon(Icons.arrow_forward_ios_sharp))
      ],
    );
  }
}
