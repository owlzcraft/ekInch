class RecentlyAddedModel {
  RecentlyAddedModel({
    required this.data,
    required this.ok,
  });
  late final List<RData> data;
  late final bool ok;
  
  RecentlyAddedModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>RData.fromJson(e)).toList();
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['ok'] = ok;
    return _data;
  }
}

class RData {
  RData({
    required this.firstName,
    required this.profession,
    required this.address,
    required this.photo,
    required this.dateOfReg,
  });
  late final String firstName;
  late final String profession;
  late final String address;
  late final String photo;
  late final String dateOfReg;
  
  RData.fromJson(Map<String, dynamic> json){
    firstName = json['first_name'];
    profession = json['profession'];
    address = json['address'];
    photo = json['photo'];
    dateOfReg = json['date_of_reg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['first_name'] = firstName;
    _data['profession'] = profession;
    _data['address'] = address;
    _data['photo'] = photo;
    _data['date_of_reg'] = dateOfReg;
    return _data;
  }
}