import 'package:cryptocurrencies_app/model/exchange_info.dart';
import 'package:cryptocurrencies_app/network/end_points.dart';
import 'package:cryptocurrencies_app/screens/components/exchabge_info_list.dart';
import 'package:cryptocurrencies_app/screens/exchange/exchange_details.dart';
import 'package:flutter/material.dart';

class ExchangeListScreen extends StatefulWidget {
  const ExchangeListScreen({Key? key}) : super(key: key);
  static const String routeName = '"/exchange_list_info"';

  @override
  _ExchangeListScreenState createState() => _ExchangeListScreenState();
}

class _ExchangeListScreenState extends State<ExchangeListScreen> {
  List<ExchangeInfo> coinInfoList = [];
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
        title: const Text('Exchange List'),
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
                                builder: (context) => ExchangeDetailsScreen(
                                    exchangeInfo: coinInfoList[index]),
                              ),
                            );
                          },
                          child: ExchangeInfoRowItem(
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
        await EndPointAPI().getAllExchangesIds() as Map<String, dynamic>;

    if (result['status']['error_code'] == 0) {
      List responseJson = result['data'];
      coinInfoList = responseJson.map((m) => ExchangeInfo.fromJson(m)).toList();
    }
  }
}
