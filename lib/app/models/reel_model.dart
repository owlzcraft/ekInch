class ReelModel {
  ReelModel({
    required this.data,
    required this.msg,
  });
  late final List<Data> data;
  late final String msg;
  
  ReelModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['msg'] = msg;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.reel,
    required this.title,
    required this.thumbnail,
    required this.uploadedOn,
    required this.likes,
    required this.view,
    required this.bucketid,
    required this.category,
    required this.user,
    required this.firstName,
    required this.profileImage,
  });
  late final int id;
  late final String reel;
  late final String title;
  late final String thumbnail;
  late final String uploadedOn;
  late final int likes;
  late final int view;
  late final int bucketid;
  late final int category;
  late final int user;
  late final String firstName;
  late final String profileImage;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    reel = json['reel'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    uploadedOn = json['uploaded_on'];
    likes = json['likes'];
    view = json['view'];
    bucketid = json['bucketid'];
    category = json['category'];
    user = json['user'];
    firstName = json['first_name'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['reel'] = reel;
    _data['title'] = title;
    _data['thumbnail'] = thumbnail;
    _data['uploaded_on'] = uploadedOn;
    _data['likes'] = likes;
    _data['view'] = view;
    _data['bucketid'] = bucketid;
    _data['category'] = category;
    _data['user'] = user;
    _data['first_name'] = firstName;
    _data['profile_image'] = profileImage;
    return _data;
  }
}