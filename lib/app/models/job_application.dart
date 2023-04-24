class JobPostModel {
  JobPostModel({
      this.data,
      this.ok,
      this.company,
  });
    List<Data>? data;
    bool? ok;
    Company? company;
  
  JobPostModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    ok = json['ok'];
    company = Company.fromJson(json['company']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.map((e)=>e.toJson()).toList();
    _data['ok'] = ok;
    _data['company'] = company!.toJson();
    return _data;
  }
}

class Data {
  Data({
      this.id,
      this.title,
      this.description,
      this.postedBy,
      this.location,
      this.active,
      this.lattitude,
      this.longitude,
       this.jobTmg,
      this.city,
      this.crtdOn,
      this.jobDetails,
      this.appiledCnt,
  });
    int? id;
    String? title;
    String? description;
    int? postedBy;
    String? location;
    bool? active;
    double? lattitude;
    double? longitude;
  String? jobTmg;
  String? city;
  String? crtdOn;
  List<JobDetails>? jobDetails;
   int? appiledCnt;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    postedBy = json['posted_by'];
    location = json['location'];
    active = json['active'];
    lattitude = json['lattitude'];
    longitude = json['longitude'];
    jobTmg = json['jobTmg'];
    city = json['city'];
    crtdOn = json['crtd_on'];
    jobDetails = List.from(json['job_details']).map((e)=>JobDetails.fromJson(e)).toList();
    appiledCnt = json['appiled_cnt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['posted_by'] = postedBy;
    _data['location'] = location;
    _data['active'] = active;
    _data['lattitude'] = lattitude;
    _data['longitude'] = longitude;
    _data['job_tmg'] = jobTmg;
    _data['city'] = city;
    _data['crtd_on'] = crtdOn;
    _data['job_details'] = jobDetails!.map((e)=>e.toJson()).toList();
    _data['appiled_cnt'] = appiledCnt;
    return _data;
  }
}

class JobDetails {
  JobDetails({
      this.id,
      this.profession,
      this.capacity,
      this.qual,
      this.slrStr,
      this.slrEnd,
      this.exp,
      this.lngSpk,
      this.mustSkill,
      this.gender,
  });
    int? id;
    int? profession;
    int? capacity;
    String? qual;
    int? slrStr;
    int? slrEnd;
    int? exp;
    String? lngSpk;
    List<String>? mustSkill;
    String? gender;
  
  JobDetails.fromJson(Map<String, dynamic> json){
    id = json['id'];
    profession = json['profession'];
    capacity = json['capacity'];
    qual = json['qual'];
    slrStr = json['slr_str'];
    slrEnd = json['slr_end'];
    exp = json['exp'];
    lngSpk = json['lng_spk'];
    mustSkill = List.castFrom<dynamic, String>(json['must_skill']);
    gender = json["gender"];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['profession'] = profession;
    _data['capacity'] = capacity;
    _data['qual'] = qual;
    _data['slr_str'] = slrStr;
    _data['slr_end'] = slrEnd;
    _data['exp'] = exp;
    _data['lng_spk'] = lngSpk;
    _data['must_skill'] = mustSkill;
    _data['gender'] = gender;
    return _data;
  }
}

class Company {
  Company({
      this.name,
      this.email,
      this.contact,
      this.address,
      this.photo,
  });
    String? name;
    String? email;
    String? contact;
    String? address;
    String? photo;
  
  Company.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    address = json['address'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['contact'] = contact;
    _data['address'] = address;
    _data['photo'] = photo;
    return _data;
  }
}