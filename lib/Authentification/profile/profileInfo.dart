import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/Authentification/screens/UserLinking.dart';
import '/Authentification/screens/User.dart';
import 'package:provider/provider.dart';
import '/Authentification/profile/editprofile.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyProfilePage> {
  bool _status = true;
  late UserController contactController;
  late List<User> users;
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    contactController = Provider.of<UserController>(context, listen: true);
    users = contactController.users;
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    // Récupérer le dernier utilisateur
    User? lastUser = users.isNotEmpty ? users.last : null;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(3, 100, 176, 65),
                ],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(top: _height / 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/user.jpg'),
                            radius: _height / 5,
                          ),
                          SizedBox(height: _height / 30),
                          Text(
                            'Welcome ${lastUser?.name ?? ""}',
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: _height / 2.2,
                    ),
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: _height / 2.6,
                      left: _width / 20,
                      right: _width / 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 2.0,
                                offset: Offset(0.0, 2.0),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: _height / 20),
                          child: Column(
                            children: <Widget>[
                              infoChild(
                                _width,
                                Icons.person,
                                'Name: ${lastUser?.name ?? ""}',
                              ),
                              infoChild(
                                _width,
                                Icons.phone,
                                'Phone Number: ${lastUser?.phone ?? ""}',
                              ),
                              infoChild(_width, Icons.directions_car, 'Show all Vehicles'),
                              Padding(
                                padding: EdgeInsets.only(top: _height / 30),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => UserEditScreen(),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: _width / 3,
                                    height: _height / 20,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(3, 100, 176, 65),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(_height / 40),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black87,
                                          blurRadius: 2.0,
                                          offset: Offset(0.0, 1.0),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Edit Profile',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    
    );
  }

  Widget infoChild(double width, IconData icon, data) => new Padding(
        padding: new EdgeInsets.only(bottom: 8.0),
        child: new InkWell(
          child: new Row(
            children: <Widget>[
              new SizedBox(
                width: width / 10,
              ),
              new Icon(
                icon,
                color:const Color.fromRGBO(3, 100, 176, 65),
                size: 36.0,
              ),
              new SizedBox(
                width: width / 20,
              ),
              new Text(data)
            ],
          ),
          onTap: () {
            print('Info Object selected');
          },
        ),
      );
}
