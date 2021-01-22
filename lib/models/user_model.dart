class User {
  static const USERID = "id";
  static const USERNAME = "login";
  static const PROFILEURL = "url";
  static const PROFILEIMAGE = "avatar_url";
  static const USERTYPE = "type";

  int _id;
  String _userName, _profileUrl, _profileImage, _userType;

  int get id => _id;

  String get userName => _userName;

  String get profileUrl => _profileUrl;

  String get profileImage => _profileImage;

  String get userType => _userType;

  User({
    int id,
    String userName,
    String profileUrl,
    String profileImage,
    String userType,
  }) {
    _id = id;
    _userName = userName;
    _profileUrl = profileUrl;
    _profileImage = profileImage;
    _userType = userType;
  }

  User.fromJson(Map<String, dynamic> userJsonResp)
      : _id = userJsonResp[USERID],
        _userName = userJsonResp[USERNAME],
        _profileUrl = userJsonResp[PROFILEURL],
        _profileImage = userJsonResp[PROFILEIMAGE],
        _userType = userJsonResp[USERTYPE];

  @override
  String toString() {
    return '''
        _id: $_id,
        _userName: $_userName,
        _profileUrl: $_profileUrl,
        _profileImage: $_profileImage,
        _userType: $_userType
        
        ''';
  }
}
