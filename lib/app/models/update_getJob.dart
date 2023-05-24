// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names

class UpdateGetJobFormModel {
  UpdateGetJobFormModel({
    this.data,
    this.ok,
  });
  DataG? data;
  bool? ok;

  UpdateGetJobFormModel.fromJson(Map<String, dynamic> json) {
    data = DataG.fromJson(json['data']);
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.toJson();
    _data['ok'] = ok;
    return _data;
  }
}

class DataG {
  DataG({
    this.id,
    this.skills,
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
  String? skills;

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

  DataG.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    qualification = json['qualification'];
    skills = json['skills'];

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
    _data['user'] = user;
    _data['skills'] = skills;
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
