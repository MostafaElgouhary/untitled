class UsersListModel{
  List<UserModel>? userList;


  UsersListModel.fromJson(Map<String, dynamic> json){
    userList = [];
    json['data'].forEach((element) {
      userList!.add(UserModel.fromJson(element));
    });
  }
}

class UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }
}























/*class UserListModel{
  List<UserModel>?userList;
  UserListModel.fromJson(Map<String,dynamic>Json){
    userList=[];

    Json['data'].forEach((element) {
      userList!.add(UserModel.fromJson(element));
    });

  }

}


class UserModel{
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;



  UserModel.fromJson(Map<String,dynamic>Json){
    id= Json['id'];
    email=Json['email'];
    firstName=Json['first_name'];
    avatar = Json['avatar'];

  }



}*/


//{
//"id": 7,
//"email": "michael.lawson@reqres.in",
//"first_name": "Michael",
//"last_name": "Lawson",
//"avatar": "https://reqres.in/img/faces/7-image.jpg"
//}