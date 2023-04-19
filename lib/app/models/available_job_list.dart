class AvailableJobsModel {
  AvailableJobsModel({
    this.msg,
    this.data,
    this.ok,
  });
  String? msg;
  List<Data>? data;
  bool? ok;

  AvailableJobsModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['data'] = data?.map((e) => e.toJson()).toList();
    _data['ok'] = ok;
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
    this.company,
    this.jobDetails,
  });
  int? id;
  String? title;

  String? description;

  int? postedBy;

  String? location;

  bool? active;

  double? lattitude;

  double? longitude;

  String ? jobTmg;

  String? city;

  String? crtdOn;

  Company? company;

  List<JobDetails>? jobDetails;

  Data.fromJson(Map<String, dynamic> json) {
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
    company = Company.fromJson(json['company']);
    jobDetails = List.from(json['job_details'])
        .map((e) => JobDetails.fromJson(e))
        .toList();
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
    _data['company'] = company!.toJson();
    _data['job_details'] = jobDetails?.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Company {
  Company({
    this.photo,
    this.name,
    this.address,
  });

  String? photo;
  String? name;
  String? address;

  Company.fromJson(Map<String, dynamic> json) {
    photo = json['photo'];
    name = json['name'];
    address = json['address'];
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
    this.id,
    this.profession,
    this.capacity,
    this.qual,
    this.slrStr,
    this.slrEnd,
    this.exp,
    this.lngSpk,
    this.mustSkill,
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

  JobDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profession = json['profession'];
    capacity = json['capacity'];
    qual = json['qual'];
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
