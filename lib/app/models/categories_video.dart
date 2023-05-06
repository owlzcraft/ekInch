class CategoriesVideoModel {
  CategoriesVideoModel({
    this.category,
    this.errorCode,
    this.errorMessage,
    this.status,
  });
  List<RCategory>? category;
  String? errorCode;
  String? errorMessage;
  int? status;

  CategoriesVideoModel.fromJson(Map<String, dynamic> json) {
    category =
        List.from(json['category']).map((e) => RCategory.fromJson(e)).toList();
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category'] = category?.map((e) => e.toJson()).toList();
    _data['errorCode'] = errorCode;
    _data['errorMessage'] = errorMessage;
    _data['status'] = status;
    return _data;
  }
}

class RCategory {
  RCategory({
    required this.subCategories,
    required this.categoryName,
    required this.categoryId,
  });
  late final List<SubCategories> subCategories;
  late final String categoryName;
  late final int categoryId;

  RCategory.fromJson(Map<String, dynamic> json) {
    subCategories = List.from(json['sub_categories'])
        .map((e) => SubCategories.fromJson(e))
        .toList();
    categoryName = json['category_name'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sub_categories'] = subCategories.map((e) => e.toJson()).toList();
    _data['category_name'] = categoryName;
    _data['category_id'] = categoryId;
    return _data;
  }
}

class SubCategories {
  SubCategories({
    required this.subCategoryData,
    required this.subCategoryName,
  });
  late final List<SubCategoryData> subCategoryData;
  late final String subCategoryName;

  SubCategories.fromJson(Map<String, dynamic> json) {
    subCategoryData = List.from(json['sub_category_data'])
        .map((e) => SubCategoryData.fromJson(e))
        .toList();
    subCategoryName = json['sub_category_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['sub_category_data'] =
        subCategoryData.map((e) => e.toJson()).toList();
    _data['sub_category_name'] = subCategoryName;
    return _data;
  }
}

class SubCategoryData {
  SubCategoryData({
    required this.coursesId,
    required this.videoId,
    required this.coursesImage,
    required this.totalLikes,
    required this.title,
    required this.comments,
    required this.videoUrl,
    required this.status,
    required this.lowUrl,
  });
  late final String coursesId;
  late final String videoId;
  late final String coursesImage;
  late final int totalLikes;
  late final String title;
  late final List<dynamic> comments;
  late final String videoUrl;
  late final String status;
  late final String lowUrl;

  SubCategoryData.fromJson(Map<String, dynamic> json) {
    coursesId = json['coursesId'];
    videoId = json['videoId'];
    coursesImage = json['coursesImage'];
    totalLikes = json['totalLikes'];
    title = json['title'];
    comments = List.castFrom<dynamic, dynamic>(json['comments']);
    videoUrl = json['video_url'];
    status = json['status'];
    lowUrl = json['low_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['coursesId'] = coursesId;
    _data['videoId'] = videoId;
    _data['coursesImage'] = coursesImage;
    _data['totalLikes'] = totalLikes;
    _data['title'] = title;
    _data['comments'] = comments;
    _data['video_url'] = videoUrl;
    _data['status'] = status;
    _data['low_url'] = lowUrl;
    return _data;
  }
}
