
import 'dart:convert';

CompanyProfileModel companyModelFromJson(String str) =>
    CompanyProfileModel.fromJson(json.decode(str));

String companyModelToJson(CompanyProfileModel data) => json.encode(data.toJson());

class CompanyProfileModel {
  CompanyProfileModel({
      this.data,
      required this.ok,
  });
    Data? data;
    bool? ok;
  
  CompanyProfileModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data?.toJson();
    _data['ok'] = ok;
    return _data;
  }
}

class Data {
  Data({
      this.id,
      this.user,
      this.name,
      this.email,
      this.contact,
      this.address,
      this.photo,
  });
    int? id;
    int? user;
    String? name;
    String? email;
    String? contact;
    String? address;
    String? photo;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    user = json['user'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    address = json['address'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user'] = user;
    _data['name'] = name;
    _data['email'] = email;
    _data['contact'] = contact;
    _data['address'] = address;
    _data['photo'] = photo;
    return _data;
  }
}