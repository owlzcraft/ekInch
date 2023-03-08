class ProfilePic {
  ProfilePic({
      this.status,
      this.details,
      this.userId,
      this.userPhoto,
  });
    int? status;
    String? details;
    String? userId;
    String? userPhoto;
  
  ProfilePic.fromJson(Map<String, dynamic> json){
    status = json['status'];
    details = json['details'];
    userId = json['userId'];
    userPhoto = json['user_photo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['details'] = details;
    _data['userId'] = userId;
    _data['user_photo'] = userPhoto;
    return _data;
  }
}