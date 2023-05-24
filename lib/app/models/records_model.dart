// ignore_for_file: no_leading_underscores_for_local_identifiers

class RecordsModel {
  RecordsModel({
      this.data,
      this.ok,
  });
    List<DataH>? data;
    bool? ok;
  
  RecordsModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>DataH.fromJson(e)).toList();
    ok = json['ok'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data!.map((e)=>e.toJson()).toList();
    _data['ok'] = ok;
    return _data;
  }
}

class DataH {
  DataH({
      this.videoId,
      this.id,
      this.title,
      this.catName,
      this.subcatName,
      this.videoFileName,
      this.count,
      this.seenLength,
      this.viewsCount,
  });
    String? videoId;
    String? id;
    String? title;
    String? catName;
    String? subcatName;
    String? videoFileName;
    String? count;
    int? seenLength;
    int? viewsCount;
  
  DataH.fromJson(Map<String, dynamic> json){
    videoId = json['video_id'];
    id = json['id'];
    title = json['title'];
    catName = json['cat_name'];
    subcatName = json['subcat_name'];
    videoFileName = json['videoFileName'];
    count = json['count'];
    seenLength = json['seen_length'];
    viewsCount = json['views_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['video_id'] = videoId;
    _data['id'] = id;
    _data['title'] = title;
    _data['cat_name'] = catName;
    _data['subcat_name'] = subcatName;
    _data['videoFileName'] = videoFileName;
    _data['count'] = count;
    _data['seen_length'] = seenLength;
    _data['views_count'] = viewsCount;
    return _data;
  }
}