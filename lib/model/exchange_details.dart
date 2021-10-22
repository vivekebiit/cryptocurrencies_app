class ExchangeDetails {
  late int id;
  late String name, logo, description, dateLaunched;

  ExchangeDetails({
    this.id = 0,
    this.name = "",
    this.logo = "",
    this.description = "",
    this.dateLaunched = "",
  });

  ExchangeDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    description = json['description'] == null ? '' : '';
    dateLaunched = json['date_launched'] == null ? '' : '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['description'] = description;
    data['date_launched'] = dateLaunched;
    return data;
  }
}
