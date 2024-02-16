import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'model_class.dart';

class Fundraisers {
  static final Fundraisers _fundraisers = Fundraisers._internal();

  factory Fundraisers() {
    return _fundraisers;
  }

  Fundraisers._internal();


  SharedPreferences? sp;

  Future<void> init() async {
    sp = await SharedPreferences.getInstance();
  }

  List<Map<String, dynamic>> fundraiseList = [
    {
      'image': 'assets/images/image3.png',
      'fundraiserName': 'The Crafted Corner',
      'totalGoal': '50000',
      'achieveGoal': '10000',
      'members': '150'
    },
    {
      'image': 'assets/images/image4.png',
      'fundraiserName': 'The Fashion Fusion',
      'totalGoal': '50000',
      'achieveGoal': '10000',
      'members': '150'
    },
    {
      'image': 'assets/images/image1.png',
      'fundraiserName': 'Sweet Delights Bakery',
      'totalGoal': '50000',
      'achieveGoal': '10000',
      'members': '150'
    },
    {
      'image': 'assets/images/image2.png',
      'fundraiserName': 'The Bookworm’s Haven',
      'totalGoal': '50000',
      'achieveGoal': '10000',
      'members': '150'
    }
  ];

  Future<void> setSharePreferenceData() async {

    final fundraiserModel =
    fundraiseList.map((e) => FundraiserModel.fromJson(e)).toList();
    await sp?.setString('fundraiserModel', encode(fundraiserModel));
  }

  List<FundraiserModel> getSharePreference()  {

    final getString = sp?.getString('fundraiserModel') ?? '';
    final fundraiseList = decode(getString);
    return fundraiseList;
  }

  String encode(List<FundraiserModel> list) {
    return jsonEncode(list.map((e) => FundraiserModel.toJson(e)).toList());
  }

  List<FundraiserModel> decode(String list) {
    return (jsonDecode(list) as List<dynamic>)
        .map((e) => FundraiserModel.fromJson(e))
        .toList();
  }
}