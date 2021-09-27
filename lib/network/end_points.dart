import 'package:cryptocurrencies_app/network/network.dart';

const String baseURL = 'https://pro-api.coinmarketcap.com/v1';
String allCryptocurrenciesIds = '$baseURL/cryptocurrency/map';

class EndPointAPI {
  ///Returns a mapping of all cryptocurrencies to unique CoinMarketCap ids
  Future<dynamic> getAllCryptocurrenciesIds() async {
    final network = Network(allCryptocurrenciesIds);
    final results = await network.getWebService() as Map<String, dynamic>;
    return results;
  }
}
