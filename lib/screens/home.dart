import 'package:cryptocurrencies_app/model/coin_info.dart';
import 'package:cryptocurrencies_app/network/end_points.dart';
import 'package:cryptocurrencies_app/screens/coin_details.dart';
import 'package:cryptocurrencies_app/screens/components/coin_info_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CoinInfo> coinInfoList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    invokeAPI();
  }

  Future<void> invokeAPI() async {
    setState(() {
      _isLoading = true;
    });
    await getAllCryptocurrenciesIds();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptocurrencies'),
      ),
      body: Container(
        color: Colors.white,
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : coinInfoList.isNotEmpty
                ? ListView.separated(
                    padding: const EdgeInsets.only(
                        bottom: kFloatingActionButtonMargin + 48),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: coinInfoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    CoinDetails(coinInfo: coinInfoList[index]),
                              ),
                            );
                          },
                          child: CoinInfoRowItem(
                            info: coinInfoList[index],
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Colors.black26,
                      );
                    },
                  )
                : const Text('No Data!'),
      ),
    );
  }

  Future<void> getAllCryptocurrenciesIds() async {
    final result =
        await EndPointAPI().getAllCryptocurrenciesIds() as Map<String, dynamic>;

    if (result['status']['error_code'] == 0) {
      print(result['status']['timestamp']);
      List responseJson = result['data'];
      coinInfoList = responseJson.map((m) => CoinInfo.fromJson(m)).toList();
    }
  }
}
