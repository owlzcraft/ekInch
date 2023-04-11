class CheckStatusModel {
  CheckStatusModel({
    required this.data,
  });
  late final bool data;
  
  CheckStatusModel.fromJson(Map<String, dynamic> json){
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data;
    return _data;
  }
}