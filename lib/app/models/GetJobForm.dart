class GetJobFormModel {
  GetJobFormModel({
    required this.data,
    required this.ok,
  });
  late final Data1 data;
  late final bool ok;
  
  GetJobFormModel.fromJson(Map<String, dynamic> json){
    data = Data1.fromJson(json['data']);
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['ok'] = ok;
    return _data;
  }
}

class Data1 {
  Data1({
    required this.id,
    required this.skills,
    required this.user,
    required this.qualification,
    required this.scMed,
    required this.engProfi,
    required this.exp,
    required this.expYr,
    required this.ageDt,
    required this.ageMn,
    required this.ageYr,
    required this.interest,
    required this.gender,
  });
  late final int id;
  late final String skills;
  late final int user;
  late final String qualification;
  late final String scMed;
  late final String engProfi;
  late final String exp;
  late final int expYr;
  late final int ageDt;
  late final int ageMn;
  late final int ageYr;
  late final String interest;
  late final String gender;
  
  Data1.fromJson(Map<String, dynamic> json){
    id = json['id'];
    skills = json['skills'];
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
    _data['skills'] = skills;
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