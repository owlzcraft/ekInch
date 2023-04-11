class AvailableJobsModel {
  AvailableJobsModel({
    required this.msg,
    required this.data,
    required this.ok,
  });
  late final String msg;
  late final List<Data> data;
  late final bool ok;
  
  AvailableJobsModel.fromJson(Map<String, dynamic> json){
    msg = json['msg'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['ok'] = ok;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.postedBy,
    required this.location,
    required this.active,
    required this.lattitude,
    required this.longitude,
     this.jobTmg,
    required this.city,
    required this.crtdOn,
    required this.company,
    required this.jobDetails,
  });
  late final int id;
  late final String title;
  late final String description;
  late final int postedBy;
  late final String location;
  late final bool active;
  late final double lattitude;
  late final double longitude;
  late final Null jobTmg;
  late final String city;
  late final String crtdOn;
  late final Company company;
  late final List<JobDetails> jobDetails;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    postedBy = json['posted_by'];
    location = json['location'];
    active = json['active'];
    lattitude = json['lattitude'];
    longitude = json['longitude'];
    jobTmg = null;
    city = json['city'];
    crtdOn = json['crtd_on'];
    company = Company.fromJson(json['company']);
    jobDetails = List.from(json['job_details']).map((e)=>JobDetails.fromJson(e)).toList();
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
    _data['company'] = company.toJson();
    _data['job_details'] = jobDetails.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Company {
  Company({
    required this.photo,
     this.name,
     this.address,
  });
  late final String photo;
  late final String? name;
  late final String? address;
  
  Company.fromJson(Map<String, dynamic> json){
    photo = json['photo'];
    name = null;
    address = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['photo'] = photo;
    _data['name'] = name;
    _data['address'] = address;
    return _data;
  }
}

class JobDetails {
  JobDetails({
    required this.id,
    required this.profession,
    required this.capacity,
     this.qual,
    required this.slrStr,
    required this.slrEnd,
    required this.exp,
    required this.lngSpk,
    required this.mustSkill,
  });
  late final int id;
  late final int profession;
  late final int capacity;
  late final String? qual;
  late final int slrStr;
  late final int slrEnd;
  late final int exp;
  late final String lngSpk;
  late final List<String> mustSkill;
  
  JobDetails.fromJson(Map<String, dynamic> json){
    id = json['id'];
    profession = json['profession'];
    capacity = json['capacity'];
    qual = null;
    slrStr = json['slr_str'];
    slrEnd = json['slr_end'];
    exp = json['exp'];
    lngSpk = json['lng_spk'];
    mustSkill = List.castFrom<dynamic, String>(json['must_skill']);
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
    return _data;
  }
}