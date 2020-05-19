class User {
  String id;
  String account;
  String nickName;
  String token;
  String sign;
  String openId;
  String photo;
  String pwd;

  User(this.id, this.account, this.nickName, this.token, this.sign, this.openId,
      this.photo, this.pwd);

  User.fromJson(Map<String, dynamic> json)
      : this(json['id'], json['account'], json['nickName'], json['token'],
            json['sign'], json['openId'], json['photo'], json['pwd']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'account': account,
      'nickName': nickName,
      'token': token,
      'sign': sign,
      'openId': openId,
      'photo': photo,
      'pwd': pwd
    };
  }
}
