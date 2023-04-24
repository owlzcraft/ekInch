class GetFeedbackModel {
  GetFeedbackModel({
     this.ok,
    this.data,
  });
  bool? ok;
  Data? data;
  
  GetFeedbackModel.fromJson(Map<String, dynamic> json){
    ok = json['ok'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ok'] = ok;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
     this.flag,
    this.star,
     this.feedbackAudio,
    this.feedbackTxt,
  });
  bool? flag;
  int? star;
  String? feedbackAudio;
  String? feedbackTxt;
  
  Data.fromJson(Map<String, dynamic> json){
    flag = json['flag'];
    star = json['star'];
    feedbackAudio = json['feedback_audio'];
    feedbackTxt = json['feedback_txt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['flag'] = flag;
    _data['star'] = star;
    _data['feedback_audio'] = feedbackAudio;
    _data['feedback_txt'] = feedbackTxt;
    return _data;
  }
}