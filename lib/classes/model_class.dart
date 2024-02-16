class FundraiserModel {
  String image;
  String fundraiserName;
  String totalGoal;
  String achieveGoal;
  String members;

  FundraiserModel({
    required this.image,
    required this.fundraiserName,
    required this.totalGoal,
    required this.achieveGoal,
    required this.members,
  });

  factory FundraiserModel.fromJson(Map<String, dynamic> json) => FundraiserModel(
    image: json["image"],
    fundraiserName: json["fundraiserName"],
    totalGoal: json["totalGoal"],
    achieveGoal: json["achieveGoal"],
    members: json["members"],
  );

  static Map<String, dynamic> toJson(FundraiserModel fundraiserModel) => {
    "image": fundraiserModel.image,
    "fundraiserName": fundraiserModel.fundraiserName,
    "totalGoal": fundraiserModel.totalGoal,
    "achieveGoal": fundraiserModel.achieveGoal,
    "members": fundraiserModel.members,
  };
}