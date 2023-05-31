// ignore_for_file: no_leading_underscores_for_local_identifiers

class UploadReelModel {
  UploadReelModel({
    this.ok,
    this.msg,
  });
  bool? ok;
  String? msg;

  UploadReelModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ok'] = ok;
    _data['msg'] = msg;
    return _data;
  }
}
