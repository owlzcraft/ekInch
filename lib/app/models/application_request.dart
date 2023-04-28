class ApplicationRequestModel {
  ApplicationRequestModel({
      this.data,
      this.ok,
  });
    List<DataR>? data;
    bool? ok;
  
  ApplicationRequestModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>DataR.fromJson(e)).toList();
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.map((e)=>e.toJson()).toList();
    _data['ok'] = ok;
    return _data;
  }
}

class DataR {
  DataR({
      this.uid,
      this.userPhoneno,
      this.userName,
      this.userImage,
      this.userLocation,
      this.userOccupation,
      this.userInfo,
  });
    int? uid;
    String? userPhoneno;
    String? userName;
    String? userImage;
    String? userLocation;
    String? userOccupation;
    UserInfo? userInfo;
  
  DataR.fromJson(Map<String, dynamic> json){
    uid = json['uid'];
    userPhoneno = json['user_phoneno'];
    userName = json['user_name'];
    userImage = json['user_image'];
    userLocation = json['user_location'];
    userOccupation = json['user_occupation'];
    userInfo = UserInfo.fromJson(json['user_info']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uid'] = uid;
    _data['user_phoneno'] = userPhoneno;
    _data['user_name'] = userName;
    _data['user_image'] = userImage;
    _data['user_location'] = userLocation;
    _data['user_occupation'] = userOccupation;
    _data['user_info'] = userInfo!.toJson();
    return _data;
  }
}

class UserInfo {
  UserInfo({
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
  
  UserInfo.fromJson(Map<String, dynamic> json){
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