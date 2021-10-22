class ExchangeInfo {
  late int id, isActive;
  late String name, symbol, slug, firstFistoricalData, lastHistoricalData;

  ExchangeInfo({
    this.id = 0,
    this.name = "",
    this.slug = "",
    this.isActive = 0,
    this.firstFistoricalData = "",
    this.lastHistoricalData = "",
  });

  ExchangeInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    name = json['name'];

    slug = json['slug'];
    isActive = json['is_active'];
    firstFistoricalData = json['first_historical_data'] == null ? '' : '';
    lastHistoricalData = json['last_historical_data'] == null ? '' : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;

    data['slug'] = slug;
    data['is_active'] = isActive;
    data['first_historical_data'] = firstFistoricalData;
    data['last_historical_data'] = lastHistoricalData;
    return data;
  }
}
