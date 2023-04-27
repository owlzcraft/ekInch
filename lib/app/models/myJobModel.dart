class  AvailableUserModel {
   AvailableUserModel({
      this.data,
      this.ok,
  });
    List<Data>? data;
    bool? ok;
  
   AvailableUserModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.map((e)=>e.toJson()).toList();
    _data['ok'] = ok;
    return _data;
  }
}

class Data {
  Data({
      this.userId,
      this.phoneNumber,
      this.firstName,
      this.adhaarNumber,
      this.organisation,
      this.profession,
      this.photo,
      this.address,
      this.info,
  });
    int? userId;
    String? phoneNumber;
    String? firstName;
    String? adhaarNumber;
    String? organisation;
    String? profession;
    String? photo;
    String? address;
    Info? info;
  
  Data.fromJson(Map<String, dynamic> json){
    userId = json['user_id'];
    phoneNumber = json['phone_number'];
    firstName = json['first_name'];
    adhaarNumber = json['adhaar_number'];
    organisation = json['organisation'];
    profession = json['profession'];
    photo = json['photo'];
    address = json['address'];
    info = Info.fromJson(json['info']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_id'] = userId;
    _data['phone_number'] = phoneNumber;
    _data['first_name'] = firstName;
    _data['adhaar_number'] = adhaarNumber;
    _data['organisation'] = organisation;
    _data['profession'] = profession;
    _data['photo'] = photo;
    _data['address'] = address;
    _data['info'] = info!.toJson();
    return _data;
  }
}

class Info {
  Info({
      this.id,
      this.skillsLst,
      this.user,
      this.qualification,
      this.scMed,
      this.engProfi,
      this.exp,
      this.expYr,
      this.ageDt,
      this.ageMn,
      this.ageYr,
      this.interest,
      this.gender,
  });
    int? id;
    List<String>? skillsLst;
    int? user;
    String? qualification;
    String? scMed;
    String? engProfi;
    String? exp;
    int? expYr;
    int? ageDt;
    int? ageMn;
    int? ageYr;
    String? interest;
    String? gender;
  
  Info.fromJson(Map<String, dynamic> json){
    id = json['id'];
    skillsLst = List.castFrom<dynamic, String>(json['skills_lst']);
    user = json['user'];
    qualification = json['qualification'];
    scMed = json['sc_med'];
    engProfi = json['eng_profi'];
    exp = json['exp'];
    expYr = json['exp_yr'];
    ageDt = json['age_dt'];
    ageMn = json['age_mn'];
    ageYr = json['age_yr'];
    interest = json['interest'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['skills_lst'] = skillsLst;
    _data['user'] = user;
    _data['qualification'] = qualification;
    _data['sc_med'] = scMed;
    _data['eng_profi'] = engProfi;
    _data['exp'] = exp;
    _data['exp_yr'] = expYr;
    _data['age_dt'] = ageDt;
    _data['age_mn'] = ageMn;
    _data['age_yr'] = ageYr;
    _data['interest'] = interest;
    _data['gender'] = gender;
    return _data;
  }
}