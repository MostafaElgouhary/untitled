import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:untitled/UserModel.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dio dio = Dio();
  String url = 'https://reqres.in/api/users';

  UsersListModel? usersListModel;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<UsersListModel> getData() async {
    Response response = await dio.get(url);
    usersListModel = UsersListModel.fromJson(response.data);
    return usersListModel!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
      ),
      body: FutureBuilder<UsersListModel>(
        future: getData(),
        builder: ((context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
            itemCount: usersListModel!.userList!.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing:
                Text(usersListModel!.userList![index].id.toString()),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      usersListModel!.userList![index].avatar!),
                ),
                subtitle: Text(usersListModel!.userList![index].email!),
                title: Text(
                    '${usersListModel!.userList![index].firstName!} ${usersListModel!.userList![index].lastName!}'),
              );
            },
          )
              : snapshot.hasError
              ? Text('Sorry, Someting went')
              : Center(child: CupertinoActivityIndicator());
        }),
      ),
    );
  }
}

/*main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home:HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Dio dio =Dio();
  String url='https://reqres.in/api/user';
  UserListModel? userListModel;

@override
void intState(){
  super.intState();
  getData();

}
Future getData() async{
  Response response =await  dio.get(url);
  userListModel=UserListModel.fromJson(response.data);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text('drag'),
    );
  }
}*/
// create=post
// ,update=put
// ,read=get
// delete=delete,
//in