// ignore_for_file: file_names
// class SkillsListModel {
//   SkillsListModel({
//     required this.ok,
//     required this.data,
//   });
//   late final bool ok;
//   late final Data data;
  
//   SkillsListModel.fromJson(Map<String, dynamic> json){
//     ok = json['ok'];
//     data = Data.fromJson(json['data']);
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['ok'] = ok;
//     _data['data'] = data.toJson();
//     return _data;
//   }
// }

// class Data {
//   Data({
//     required this.skills,
//     required this.spkEng,
//     required this.exp,
//     required this.scMed,
//     required this.qualifications,
//     required this.gender,
//   });
//   late final Skills skills;
//   late final List<SpkEng> spkEng;
//   late final List<Exp> exp;
//   late final List<ScMed> scMed;
//   late final List<Qualifications> qualifications;
//   late final List<Gender> gender;
  
//   Data.fromJson(Map<String, dynamic> json){
//     skills = Skills.fromJson(json['skills']);
//     spkEng = List.from(json['spk_eng']).map((e)=>SpkEng.fromJson(e)).toList();
//     exp = List.from(json['exp']).map((e)=>Exp.fromJson(e)).toList();
//     scMed = List.from(json['sc_med']).map((e)=>ScMed.fromJson(e)).toList();
//     qualifications = List.from(json['qualifications']).map((e)=>Qualifications.fromJson(e)).toList();
//     gender = List.from(json['gender']).map((e)=>Gender.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['skills'] = skills.toJson();
//     _data['spk_eng'] = spkEng.map((e)=>e.toJson()).toList();
//     _data['exp'] = exp.map((e)=>e.toJson()).toList();
//     _data['sc_med'] = scMed.map((e)=>e.toJson()).toList();
//     _data['qualifications'] = qualifications.map((e)=>e.toJson()).toList();
//     _data['gender'] = gender.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }

// class Skills {
//   Skills({
//     required this.Civil,
//     required this.Plumbing,
//     required this.PAINTER,
//     required this.CARPENTER,
//     required this.WELDER,
//     required this.BARBINDER,
//     required this.ELECTRICAL,
//   });
//   late final List Civil;
//   late final List Plumbing;
//   late final List PAINTER;
//   late final List CARPENTER;
//   late final List WELDER;
//   late final List BARBINDER;
//   late final List ELECTRICAL;
  
//   // Skills.fromJson(Map<String, dynamic> json){
//   //   Civil = List.from(json['Civil']).map((e)=>Civil.fromJson(e)).toList();
//   //   Plumbing = List.from(json['Plumbing']).map((e)=>Plumbing.fromJson(e)).toList();
//   //   PAINTER = List.from(json['PAINTER']).map((e)=>PAINTER.fromJson(e)).toList();
//   //   CARPENTER = List.from(json['CARPENTER']).map((e)=>CARPENTER.fromJson(e)).toList();
//   //   WELDER = List.from(json['WELDER']).map((e)=>WELDER.fromJson(e)).toList();
//   //   BARBINDER = List.from(json['BAR_BINDER']).map((e)=>BARBINDER.fromJson(e)).toList();
//   //   ELECTRICAL = List.from(json['ELECTRICAL']).map((e)=>ELECTRICAL.fromJson(e)).toList();
//   // }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['Civil'] = Civil.map((e)=>e.toJson()).toList();
//     _data['Plumbing'] = Plumbing.map((e)=>e.toJson()).toList();
//     _data['PAINTER'] = PAINTER.map((e)=>e.toJson()).toList();
//     _data['CARPENTER'] = CARPENTER.map((e)=>e.toJson()).toList();
//     _data['WELDER'] = WELDER.map((e)=>e.toJson()).toList();
//     _data['BAR_BINDER'] = BARBINDER.map((e)=>e.toJson()).toList();
//     _data['ELECTRICAL'] = ELECTRICAL.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }

// class Civil {
//   Civil({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
  
//   Civil.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class Plumbing {
//   Plumbing({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
  
//   Plumbing.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class PAINTER {
//   PAINTER({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
  
//   PAINTER.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class CARPENTER {
//   CARPENTER({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
  
//   CARPENTER.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class WELDER {
//   WELDER({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
  
//   WELDER.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class BARBINDER {
//   BARBINDER({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
  
//   BARBINDER.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class ELECTRICAL {
//   ELECTRICAL({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
  
//   ELECTRICAL.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class SpkEng {
//   SpkEng({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
  
//   SpkEng.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class Exp {
//   Exp({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
  
//   Exp.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class ScMed {
//   ScMed({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
  
//   ScMed.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class Qualifications {
//   Qualifications({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
  
//   Qualifications.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }

// class Gender {
//   Gender({
//     required this.id,
//     required this.name,
//   });
//   late final int id;
//   late final String name;
  
//   Gender.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     return _data;
//   }
// }