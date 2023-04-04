class CompanyProfileModel {
  int? id;
  int? user;
  String? name;
  String? email;
  String? contact;
  String? address;
  String? photo;

  CompanyProfileModel(
      {this.id,
      this.user,
      this.name,
      this.email,
      this.contact,
      this.address,
      this.photo});

  CompanyProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    address = json['address'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['address'] = this.address;
    data['photo'] = this.photo;
    return data;
  }
}
