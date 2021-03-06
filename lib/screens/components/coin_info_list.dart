import 'package:cryptocurrencies_app/model/coin_info.dart';
import 'package:flutter/material.dart';

class CoinInfoRowItem extends StatelessWidget {
  final CoinInfo info;

  const CoinInfoRowItem({Key? key, required this.info}) : super(key: key);

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
                      'https://s2.coinmarketcap.com/static/img/coins/64x64/'
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
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4, right: 4),
                        child: Text(
                          'Rank: ${info.rank.toString()}',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          info.symbol,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                    ],
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
