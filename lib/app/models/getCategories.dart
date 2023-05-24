// ignore_for_file: no_leading_underscores_for_local_identifiers, file_names

class GetcategoriesModel {
  GetcategoriesModel({
    required this.data,
  });
  late final List<Data> data;
  
  GetcategoriesModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.categoryImage,
    required this.categoryTitle,
    required this.categoryId,
  });
  late final String categoryImage;
  late final String categoryTitle;
  late final int categoryId;
  
  Data.fromJson(Map<String, dynamic> json){
    categoryImage = json['categoryImage'];
    categoryTitle = json['categoryTitle'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categoryImage'] = categoryImage;
    _data['categoryTitle'] = categoryTitle;
    _data['categoryId'] = categoryId;
    return _data;
  }
}