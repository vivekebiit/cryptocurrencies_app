class CoinInfo {
  late int id, rank, isActive;
  late String name, symbol, slug, firstFistoricalData, lastHistoricalData;

  CoinInfo({
    this.id = 0,
    this.rank = 0,
    this.name = "",
    this.symbol = "",
    this.slug = "",
    this.isActive = 0,
    this.firstFistoricalData = "",
    this.lastHistoricalData = "",
  });

  CoinInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rank = json['rank'];
    name = json['name'];
    symbol = json['symbol'];
    slug = json['slug'];
    isActive = json['is_active'];
    firstFistoricalData = json['first_historical_data'];
    lastHistoricalData = json['last_historical_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rank'] = rank;
    data['name'] = name;
    data['symbol'] = symbol;
    data['slug'] = slug;
    data['is_active'] = isActive;
    data['first_historical_data'] = firstFistoricalData;
    data['last_historical_data'] = lastHistoricalData;
    return data;
  }
}
