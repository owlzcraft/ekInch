// ignore_for_file: no_leading_underscores_for_local_identifiers

class LocalizationModel {
  LocalizationModel({
      this.ok,
      // this.data,
  });
    bool? ok;
    // Data? data;
  
  LocalizationModel.fromJson(Map<String, dynamic> json){
    ok = json['ok'];
    // data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ok'] = ok;
    // _data['data'] = data!.toJson();
    return _data;
  }
}

// class Data {
//   Data({
//       this.homeScreen,
//       this.screen1,
//       this.screen2,
//       this.screen3,
//       this.ConfirmationCode,
//       this.VerifyNum,
//       this.Registration ,
//       this.Registration_2,
//       this.Welcome,
//       this.UploadReel,
//       this.profile,
//       this.ProfileUpdate,
//       this.UpdateNo,
//       this.VerifyNo,
//       this.ProfileUpt_2,
//       this.VideoDashboard,
//       this.MyReels,
//       this.Records,
//       this.ReferEarn,
//       this.Notification,
//       this.EarnPoints,
//       this.MyCertificate,
//       this.feedback,
//       this.hello,
//       this.interested,
//       this.yourSelf,
//       this.addSkills,
//       this.jobList,
//       this.hireMe,
//       this.typeMessage,
//       this.jobApp_1,
//       this.jobApp_2,
//       this.jobApp_3,
//       this.jobApp_4,
//       this.postJob_5,
//       this.postJob_6,
//       this.ultraTech,
//       this.reviews,
//       this.lastPage,
//   });
//     List<HomeScreen> homeScreen;
//     List<screen1> screen1;
//     List<screen2> screen2;
//     List<screen3> screen3;
//     List<ConfirmationCode> ConfirmationCode;
//     List<VerifyNum> VerifyNum;
//     List<Registration > Registration ;
//     List<Registration_2> Registration_2;
//     List<Welcome> Welcome;
//     List<UploadReel> UploadReel;
//     List<Profile> profile;
//     List<ProfileUpdate> ProfileUpdate;
//     List<UpdateNo> UpdateNo;
//     List<VerifyNo> VerifyNo;
//     List<ProfileUpt_2> ProfileUpt_2;
//     List<VideoDashboard> VideoDashboard;
//     List<MyReels> MyReels;
//     List<Records> Records;
//     List<ReferEarn> ReferEarn;
//     List<Notification> Notification;
//     List<EarnPoints> EarnPoints;
//     List<My_certificate> MyCertificate;
//     List<Feedback> feedback;
//     List<Hello> hello;
//     List<Interested> interested;
//     List<YourSelf> yourSelf;
//     List<AddSkills> addSkills;
//     List<JobList> jobList;
//     List<HireMe> hireMe;
//     List<TypeMessage> typeMessage;
//     List<JobApp_1> jobApp_1;
//     List<JobApp_2> jobApp_2;
//     List<JobApp_3> jobApp_3;
//     List<JobApp_4> jobApp_4;
//     List<PostJob_5> postJob_5;
//     List<PostJob_6> postJob_6;
//     List<UltraTech> ultraTech;
//     List<Reviews> reviews;
//     List<LastPage> lastPage;
  
//   Data.fromJson(Map<String, dynamic> json){
//     homeScreen = List.from(json['home_screen']).map((e)=>HomeScreen.fromJson(e)).toList();
//     screen1 = List.from(json[' screen1']).map((e)=>screen1.fromJson(e)).toList();
//     screen2 = List.from(json[' screen2']).map((e)=>screen2.fromJson(e)).toList();
//     screen3 = List.from(json[' screen3']).map((e)=>screen3.fromJson(e)).toList();
//     ConfirmationCode = List.from(json['Confirmation_code']).map((e)=>ConfirmationCode.fromJson(e)).toList();
//     VerifyNum = List.from(json['Verify_num']).map((e)=>VerifyNum.fromJson(e)).toList();
//     Registration  = List.from(json['Registration ']).map((e)=>Registration .fromJson(e)).toList();
//     Registration_2 = List.from(json['Registration_2']).map((e)=>Registration_2.fromJson(e)).toList();
//     Welcome = List.from(json['Welcome']).map((e)=>Welcome.fromJson(e)).toList();
//     UploadReel = List.from(json['Upload_Reel']).map((e)=>UploadReel.fromJson(e)).toList();
//     profile = List.from(json['profile']).map((e)=>Profile.fromJson(e)).toList();
//     ProfileUpdate = List.from(json['Profile_update']).map((e)=>ProfileUpdate.fromJson(e)).toList();
//     UpdateNo = List.from(json['Update_no']).map((e)=>UpdateNo.fromJson(e)).toList();
//     VerifyNo = List.from(json['Verify_no']).map((e)=>VerifyNo.fromJson(e)).toList();
//     ProfileUpt_2 = List.from(json['Profile_upt_2']).map((e)=>ProfileUpt_2.fromJson(e)).toList();
//     VideoDashboard = List.from(json['Video_dashboard']).map((e)=>VideoDashboard.fromJson(e)).toList();
//     MyReels = List.from(json['My_reels']).map((e)=>MyReels.fromJson(e)).toList();
//     Records = List.from(json['Records']).map((e)=>Records.fromJson(e)).toList();
//     ReferEarn = List.from(json['Refer_Earn']).map((e)=>ReferEarn.fromJson(e)).toList();
//     Notification = List.from(json['Notification']).map((e)=>Notification.fromJson(e)).toList();
//     EarnPoints = List.from(json['Earn_Points']).map((e)=>EarnPoints.fromJson(e)).toList();
//     MyCertificate = List.from(json['My Certificate']).map((e)=>MyCertificate.fromJson(e)).toList();
//     feedback = List.from(json['feedback']).map((e)=>Feedback.fromJson(e)).toList();
//     hello = List.from(json['hello']).map((e)=>Hello.fromJson(e)).toList();
//     interested = List.from(json['interested']).map((e)=>Interested.fromJson(e)).toList();
//     yourSelf = List.from(json['your_self']).map((e)=>YourSelf.fromJson(e)).toList();
//     addSkills = List.from(json['add_skills']).map((e)=>AddSkills.fromJson(e)).toList();
//     jobList = List.from(json['job_list']).map((e)=>JobList.fromJson(e)).toList();
//     hireMe = List.from(json['hire_me']).map((e)=>HireMe.fromJson(e)).toList();
//     typeMessage = List.from(json['type_message']).map((e)=>TypeMessage.fromJson(e)).toList();
//     jobApp_1 = List.from(json['job_app_1']).map((e)=>JobApp_1.fromJson(e)).toList();
//     jobApp_2 = List.from(json['job_app_2']).map((e)=>JobApp_2.fromJson(e)).toList();
//     jobApp_3 = List.from(json['job_app_3']).map((e)=>JobApp_3.fromJson(e)).toList();
//     jobApp_4 = List.from(json['job_app_4']).map((e)=>JobApp_4.fromJson(e)).toList();
//     postJob_5 = List.from(json['post_job_5']).map((e)=>PostJob_5.fromJson(e)).toList();
//     postJob_6 = List.from(json['post_job_6']).map((e)=>PostJob_6.fromJson(e)).toList();
//     ultraTech = List.from(json['ultraTech']).map((e)=>UltraTech.fromJson(e)).toList();
//     reviews = List.from(json['reviews']).map((e)=>Reviews.fromJson(e)).toList();
//     lastPage = List.from(json['last_page']).map((e)=>LastPage.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['home_screen'] = homeScreen.map((e)=>e.toJson()).toList();
//     _data[' screen1'] =  screen1.map((e)=>e.toJson()).toList();
//     _data[' screen2'] =  screen2.map((e)=>e.toJson()).toList();
//     _data[' screen3'] =  screen3.map((e)=>e.toJson()).toList();
//     _data['Confirmation_code'] = ConfirmationCode.map((e)=>e.toJson()).toList();
//     _data['Verify_num'] = VerifyNum.map((e)=>e.toJson()).toList();
//     _data['Registration '] = Registration .map((e)=>e.toJson()).toList();
//     _data['Registration_2'] = Registration_2.map((e)=>e.toJson()).toList();
//     _data['Welcome'] = Welcome.map((e)=>e.toJson()).toList();
//     _data['Upload_Reel'] = UploadReel.map((e)=>e.toJson()).toList();
//     _data['profile'] = profile.map((e)=>e.toJson()).toList();
//     _data['Profile_update'] = ProfileUpdate.map((e)=>e.toJson()).toList();
//     _data['Update_no'] = UpdateNo.map((e)=>e.toJson()).toList();
//     _data['Verify_no'] = VerifyNo.map((e)=>e.toJson()).toList();
//     _data['Profile_upt_2'] = ProfileUpt_2.map((e)=>e.toJson()).toList();
//     _data['Video_dashboard'] = VideoDashboard.map((e)=>e.toJson()).toList();
//     _data['My_reels'] = MyReels.map((e)=>e.toJson()).toList();
//     _data['Records'] = Records.map((e)=>e.toJson()).toList();
//     _data['Refer_Earn'] = ReferEarn.map((e)=>e.toJson()).toList();
//     _data['Notification'] = Notification.map((e)=>e.toJson()).toList();
//     _data['Earn_Points'] = EarnPoints.map((e)=>e.toJson()).toList();
//     _data['My Certificate'] = MyCertificate.map((e)=>e.toJson()).toList();
//     _data['feedback'] = feedback.map((e)=>e.toJson()).toList();
//     _data['hello'] = hello.map((e)=>e.toJson()).toList();
//     _data['interested'] = interested.map((e)=>e.toJson()).toList();
//     _data['your_self'] = yourSelf.map((e)=>e.toJson()).toList();
//     _data['add_skills'] = addSkills.map((e)=>e.toJson()).toList();
//     _data['job_list'] = jobList.map((e)=>e.toJson()).toList();
//     _data['hire_me'] = hireMe.map((e)=>e.toJson()).toList();
//     _data['type_message'] = typeMessage.map((e)=>e.toJson()).toList();
//     _data['job_app_1'] = jobApp_1.map((e)=>e.toJson()).toList();
//     _data['job_app_2'] = jobApp_2.map((e)=>e.toJson()).toList();
//     _data['job_app_3'] = jobApp_3.map((e)=>e.toJson()).toList();
//     _data['job_app_4'] = jobApp_4.map((e)=>e.toJson()).toList();
//     _data['post_job_5'] = postJob_5.map((e)=>e.toJson()).toList();
//     _data['post_job_6'] = postJob_6.map((e)=>e.toJson()).toList();
//     _data['ultraTech'] = ultraTech.map((e)=>e.toJson()).toList();
//     _data['reviews'] = reviews.map((e)=>e.toJson()).toList();
//     _data['last_page'] = lastPage.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }

// class HomeScreen {
//   HomeScreen({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   HomeScreen.fromJson(Map<String, dynamic> json){
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

// class  screen1 {
//    screen1({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//    screen1.fromJson(Map<String, dynamic> json){
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

// class  screen2 {
//    screen2({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//    screen2.fromJson(Map<String, dynamic> json){
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

// class  screen3 {
//    screen3({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//    screen3.fromJson(Map<String, dynamic> json){
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

// class ConfirmationCode {
//   ConfirmationCode({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   ConfirmationCode.fromJson(Map<String, dynamic> json){
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

// class VerifyNum {
//   VerifyNum({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   VerifyNum.fromJson(Map<String, dynamic> json){
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

// class Registration{
//   Registration ({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   Registration.fromJson(Map<String, dynamic> json){
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

// class Registration_2 {
//   Registration_2({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   Registration_2.fromJson(Map<String, dynamic> json){
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

// class Welcome {
//   Welcome({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   Welcome.fromJson(Map<String, dynamic> json){
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

// class UploadReel {
//   UploadReel({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   UploadReel.fromJson(Map<String, dynamic> json){
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

// class Profile {
//   Profile({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   Profile.fromJson(Map<String, dynamic> json){
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

// class ProfileUpdate {
//   ProfileUpdate({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   ProfileUpdate.fromJson(Map<String, dynamic> json){
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

// class UpdateNo {
//   UpdateNo({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   UpdateNo.fromJson(Map<String, dynamic> json){
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

// class VerifyNo {
//   VerifyNo({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   VerifyNo.fromJson(Map<String, dynamic> json){
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

// class ProfileUpt_2 {
//   ProfileUpt_2({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   ProfileUpt_2.fromJson(Map<String, dynamic> json){
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

// class VideoDashboard {
//   VideoDashboard({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   VideoDashboard.fromJson(Map<String, dynamic> json){
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

// class MyReels {
//   MyReels({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   MyReels.fromJson(Map<String, dynamic> json){
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

// class Records {
//   Records({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   Records.fromJson(Map<String, dynamic> json){
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

// class ReferEarn {
//   ReferEarn({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   ReferEarn.fromJson(Map<String, dynamic> json){
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

// class Notification {
//   Notification({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   Notification.fromJson(Map<String, dynamic> json){
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

// class EarnPoints {
//   EarnPoints({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   EarnPoints.fromJson(Map<String, dynamic> json){
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

// class MyCertificate {
//   MyCertificate({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   MyCertificate.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     return data;
//   }
// }

// class Feedback {
//   Feedback({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   Feedback.fromJson(Map<String, dynamic> json){
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

// class Hello {
//   Hello({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   Hello.fromJson(Map<String, dynamic> json){
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

// class Interested {
//   Interested({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   Interested.fromJson(Map<String, dynamic> json){
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

// class YourSelf {
//   YourSelf({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   YourSelf.fromJson(Map<String, dynamic> json){
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

// class AddSkills {
//   AddSkills({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   AddSkills.fromJson(Map<String, dynamic> json){
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

// class JobList {
//   JobList({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   JobList.fromJson(Map<String, dynamic> json){
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

// class HireMe {
//   HireMe({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   HireMe.fromJson(Map<String, dynamic> json){
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

// class TypeMessage {
//   TypeMessage({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   TypeMessage.fromJson(Map<String, dynamic> json){
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

// class JobApp_1 {
//   JobApp_1({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   JobApp_1.fromJson(Map<String, dynamic> json){
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

// class JobApp_2 {
//   JobApp_2({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   JobApp_2.fromJson(Map<String, dynamic> json){
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

// class JobApp_3 {
//   JobApp_3({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   JobApp_3.fromJson(Map<String, dynamic> json){
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

// class JobApp_4 {
//   JobApp_4({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   JobApp_4.fromJson(Map<String, dynamic> json){
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

// class PostJob_5 {
//   PostJob_5({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   PostJob_5.fromJson(Map<String, dynamic> json){
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

// class PostJob_6 {
//   PostJob_6({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   PostJob_6.fromJson(Map<String, dynamic> json){
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

// class UltraTech {
//   UltraTech({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   UltraTech.fromJson(Map<String, dynamic> json){
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

// class Reviews {
//   Reviews({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   Reviews.fromJson(Map<String, dynamic> json){
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

// class LastPage {
//   LastPage({
//       this.id,
//       this.name,
//   });
//     int? id;
//     String? name;
  
//   LastPage.fromJson(Map<String, dynamic> json){
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
