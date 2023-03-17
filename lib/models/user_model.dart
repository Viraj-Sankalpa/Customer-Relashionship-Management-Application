class UserModel{
   final String id;
   final String name;
   final String email;
   final String phone;
   final String password;

  const UserModel({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.password
  });

  toJson(){
    return{
      "name":name,
      "email":email,
      "phone": phone,
      "password":password
    };
  }

}