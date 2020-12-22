
class User {

  static const USERID = "id";
  static const USERNAME = "login";
  static const PROFILEURL = "url";
  static const PROFILEIMAGE = "avatar_url";
  static const USERTYPE = "type";

  int _id;
  String _userName;
  String _profileUrl;
  String _profileImage;
  String _userType;

  int get id => _id;
  String get username => _userName;
  String  get profileUrl => _profileUrl;
  String get profileImage => _profileImage;
  String get userType => _userType;

  User.fromJson(Map<String, dynamic> userJsonResp)
      : _id = userJsonResp[USERID],
        _userName = userJsonResp[USERNAME],
        _profileUrl = userJsonResp[PROFILEURL],
        _profileImage = userJsonResp[PROFILEIMAGE],
        _userType = userJsonResp[USERTYPE];
}
