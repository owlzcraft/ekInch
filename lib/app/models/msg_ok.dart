class FeedbackModel {
  FeedbackModel({
    this.msg,
     this.ok,
  });
   String? msg;
   bool? ok;
  
  FeedbackModel.fromJson(Map<String, dynamic> json){
    msg = json['msg'];
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg;
    _data['ok'] = ok;
    return _data;
  }
}

