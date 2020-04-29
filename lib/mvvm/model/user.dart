class User {
    User();

    String username;
    String company;

    factory User.fromJson(Map<String,dynamic> json) {
        return User()
            ..username = json['username'] as String
            ..company = json['company'] as String;
    }

    Map<String, dynamic> toJson() {
      return <String, dynamic> {
        'username': username,
        'company': company
      };
    }
}
