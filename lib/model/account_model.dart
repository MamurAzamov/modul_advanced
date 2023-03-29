class Users{
  String? name;
  String? email;
  String? phone;
  String? password;
  String? confirm_password;

  Users(this.name, this.email, this.phone, this.password, this.confirm_password);

  Users.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        phone = json['phone'],
        password = json['password'],
        confirm_password = json['confirm password'];

  Map<String, dynamic> toJson() => {
    'name':name,
    'email':email,
    'phone':phone,
    'password':password,
    'confirm password':confirm_password,
  };
}