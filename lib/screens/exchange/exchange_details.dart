import 'package:cryptocurrencies_app/model/exchange_info.dart';
import 'package:cryptocurrencies_app/network/end_points.dart';
import 'package:flutter/material.dart';

class ExchangeDetailsScreen extends StatefulWidget {
  const ExchangeDetailsScreen({Key? key, required this.exchangeInfo})
      : super(key: key);
  static const String routeName = '"/exchange_list_info"';
// Declare a field that holds the Todo.
  final ExchangeInfo exchangeInfo;
  @override
  _ExchangeDetails createState() => _ExchangeDetails();
}

class _ExchangeDetails extends State<ExchangeDetailsScreen> {
  var responseData;
  @override
  void initState() {
    super.initState();
    invokeAPI();
  }

  Future<void> invokeAPI() async {
    await getExchangeDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exchangeInfo.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExchangeDetailsLabel('Description:'),
              ExchangeDetailsValue(responseData != null
                  ? responseData['description'] ?? ''
                  : ''),
              ExchangeDetailsLabel('Date Launched:'),
              ExchangeDetailsValue(responseData != null
                  ? responseData['date_launched'] ?? ''
                  : ''),
              ExchangeDetailsLabel('Maker Fee:'),
              ExchangeDetailsValue(responseData != null
                  ? responseData['maker_fee'].toString()
                  : ''),
              ExchangeDetailsLabel('Taker Fee:'),
              ExchangeDetailsValue(responseData != null
                  ? responseData['taker_fee'].toString()
                  : 'No Taker Fee'),
              ExchangeDetailsLabel('Spot Volume USD:'),
              ExchangeDetailsValue(responseData != null
                  ? responseData['spot_volume_usd'].toString()
                  : ''),
              ExchangeDetailsLabel('Spot Volume Last Updated:'),
              ExchangeDetailsValue(responseData != null
                  ? responseData['spot_volume_last_updated'] ?? ''
                  : ''),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getExchangeDetails() async {
    final result = await EndPointAPI()
        .getExchangesDetails(widget.exchangeInfo.id) as Map<String, dynamic>;

    if (result['status']['error_code'] == 0) {
      final data = result['data'] as Map<String, dynamic>;

      responseData = data['${widget.exchangeInfo.id}'] as Map<String, dynamic>;
      setState(() {});
    }
  }
}

// ignore: must_be_immutable
class ExchangeDetailsLabel extends StatelessWidget {
  ExchangeDetailsLabel(this.label, {Key? key}) : super(key: key);
  String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ignore: must_be_immutable
class ExchangeDetailsValue extends StatelessWidget {
  ExchangeDetailsValue(this.value, {Key? key}) : super(key: key);
  String value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Column(
        children: [
          if (value.isNotEmpty)
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.normal),
            ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
